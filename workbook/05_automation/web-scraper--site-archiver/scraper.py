"""
Web scraper using Playwright — mirrors a site for offline use.
Crawls all internal links, downloads HTML/CSS/JS/images,
rewrites asset URLs to relative local paths.
"""

import asyncio
import re
import hashlib
import mimetypes
from pathlib import Path
from urllib.parse import urljoin, urlparse, urlunparse
from collections import deque

from playwright.async_api import async_playwright


# ─── helpers ────────────────────────────────────────────────────────────────


def url_to_local_path(base_url: str, url: str, output_dir: Path) -> Path:
    """Map a URL to a local mirror path, e.g. /about/ → about/index.html"""
    parsed = urlparse(url)
    path = parsed.path

    if not path or path == "/":
        rel = "index.html"
    elif path.endswith("/"):
        rel = path.lstrip("/") + "index.html"
    else:
        # Guess extension from mime if none present
        if "." not in Path(path).name:
            rel = path.lstrip("/") + "/index.html"
        else:
            rel = path.lstrip("/")

    return output_dir / rel


def sanitize_filename(url: str) -> str:
    """Hash long or weird asset URLs to a safe filename."""
    parsed = urlparse(url)
    path = parsed.path.lstrip("/")
    if len(path) > 120 or not path:
        ext = mimetypes.guess_extension(mimetypes.guess_type(url)[0] or "") or ""
        return hashlib.md5(url.encode()).hexdigest() + ext
    return path


def rewrite_html_assets(
    html: str, page_url: str, base_url: str, output_dir: Path, asset_map: dict
) -> str:
    """Replace absolute/relative asset URLs in HTML with local relative paths."""

    def replacer(m):
        attr, val = m.group(1), m.group(2)
        abs_url = urljoin(page_url, val)
        if abs_url in asset_map:
            return f'{attr}="{asset_map[abs_url]}"'
        return m.group(0)

    html = re.sub(r'(src|href|action)="([^"]*)"', replacer, html)
    html = re.sub(r"(src|href|action)='([^']*)'", replacer, html)
    return html


def relative_path(from_file: Path, to_file: Path) -> str:
    """Compute relative path from one file to another."""
    try:
        return str(to_file.relative_to(from_file.parent))
    except ValueError:
        # Walk up
        from_parts = from_file.parent.parts
        to_parts = to_file.parts
        common = 0
        for a, b in zip(from_parts, to_parts):
            if a == b:
                common += 1
            else:
                break
        ups = len(from_parts) - common
        rel = "../" * ups + "/".join(to_parts[common:])
        return rel


# ─── core scraper ───────────────────────────────────────────────────────────


class SiteScraper:
    def __init__(
        self,
        start_url: str,
        output_dir: str = "site_mirror",
        max_pages: int = 200,
        concurrency: int = 3,
        headless: bool = True,
        on_progress=None,  # callback(scraped, total, url)
        on_log=None,  # callback(message)
    ):
        self.start_url = start_url.rstrip("/")
        parsed = urlparse(self.start_url)
        self.base_origin = f"{parsed.scheme}://{parsed.netloc}"
        self.output_dir = Path(output_dir)
        self.max_pages = max_pages
        self.concurrency = concurrency
        self.headless = headless
        self.on_progress = on_progress or (lambda *a: None)
        self.on_log = on_log or print

        self.visited_pages: set[str] = set()
        self.visited_assets: set[str] = set()
        self.asset_map: dict[str, str] = {}  # abs_url → local relative path string
        self.queue: deque[str] = deque()
        self.sem: asyncio.Semaphore = None
        self.browser = None
        self._stop = False

    def stop(self):
        self._stop = True

    def _is_internal(self, url: str) -> bool:
        return urlparse(url).netloc == urlparse(self.base_origin).netloc

    def _normalize(self, url: str) -> str:
        p = urlparse(url)
        return urlunparse((p.scheme, p.netloc, p.path, "", "", ""))

    async def _download_asset(self, url: str, page) -> str | None:
        """Download a binary asset and return its local path string (relative to output_dir)."""
        if url in self.visited_assets:
            return self.asset_map.get(url)
        self.visited_assets.add(url)

        rel = sanitize_filename(url)
        local = self.output_dir / rel
        local.parent.mkdir(parents=True, exist_ok=True)

        try:
            response = await page.request.get(url)
            if response.ok:
                local.write_bytes(await response.body())
                self.asset_map[url] = rel
                return rel
        except Exception as e:
            self.on_log(f"  [asset error] {url}: {e}")
        return None

    async def _scrape_page(self, url: str, context):
        if self._stop:
            return
        norm = self._normalize(url)
        if norm in self.visited_pages:
            return
        self.visited_pages.add(norm)

        self.on_log(f"[page] {norm}")
        page = await context.new_page()

        try:
            await page.goto(norm, wait_until="networkidle", timeout=30_000)
            await page.wait_for_timeout(500)  # let late JS settle

            # ── collect asset URLs ──────────────────────────────────────────
            asset_urls = await page.evaluate(
                """() => {
                const urls = new Set();
                document.querySelectorAll('img[src],video[src],audio[src],source[src]').forEach(e => e.src && urls.add(e.src));
                document.querySelectorAll('link[rel="stylesheet"]').forEach(e => e.href && urls.add(e.href));
                document.querySelectorAll('script[src]').forEach(e => e.src && urls.add(e.src));
                document.querySelectorAll('[style]').forEach(e => {
                    const m = e.getAttribute('style').match(/url\(['""]?(.*?)['""]?\)/g);
                    if (m) m.forEach(u => { const inner = u.match(/url\(['""]?(.*?)['""]?\)/)[1]; urls.add(new URL(inner, location.href).href); });
                });
                return [...urls];
            }"""
            )

            async with asyncio.TaskGroup() as tg:
                for aurl in asset_urls:
                    tg.create_task(self._download_asset(aurl, page))

            # ── collect internal links ─────────────────────────────────────
            links = await page.evaluate(
                """() =>
                [...document.querySelectorAll('a[href]')]
                    .map(a => a.href)
                    .filter(h => h.startsWith('http'))
            """
            )
            for link in links:
                ln = self._normalize(link)
                if self._is_internal(ln) and ln not in self.visited_pages:
                    self.queue.append(ln)

            # ── save HTML ─────────────────────────────────────────────────
            html = await page.content()
            html = rewrite_html_assets(
                html, norm, self.base_origin, self.output_dir, self.asset_map
            )

            local_path = url_to_local_path(self.base_origin, norm, self.output_dir)
            local_path.parent.mkdir(parents=True, exist_ok=True)
            local_path.write_text(html, encoding="utf-8")
            self.on_log(f"  saved → {local_path.relative_to(self.output_dir)}")

        except Exception as e:
            self.on_log(f"  [error] {norm}: {e}")
        finally:
            await page.close()

        self.on_progress(len(self.visited_pages), self.max_pages, norm)

    async def run(self):
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.queue.append(self.start_url)
        self.sem = asyncio.Semaphore(self.concurrency)

        async with async_playwright() as pw:
            self.browser = await pw.chromium.launch(headless=self.headless)
            context = await self.browser.new_context(
                user_agent="Mozilla/5.0 (compatible; SiteMirror/1.0)",
                java_script_enabled=True,
            )

            while (
                self.queue
                and len(self.visited_pages) < self.max_pages
                and not self._stop
            ):
                batch = []
                while self.queue and len(batch) < self.concurrency:
                    url = self.queue.popleft()
                    norm = self._normalize(url)
                    if norm not in self.visited_pages:
                        batch.append(norm)

                if not batch:
                    break

                async with asyncio.TaskGroup() as tg:
                    for url in batch:
                        tg.create_task(self._scrape_page(url, context))

            await self.browser.close()

        self.on_log(
            f"\n✓ Done. {len(self.visited_pages)} pages, {len(self.visited_assets)} assets → {self.output_dir}/"
        )
