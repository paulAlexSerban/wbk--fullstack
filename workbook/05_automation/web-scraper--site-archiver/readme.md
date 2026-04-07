# Site Mirror — Playwright Web Scraper
**Category:** Developer tooling / automation
**Type:** Web scraper / site archiver
**Class:** Browser automation tool
**Subclass:** Offline site mirror (as opposed to data extraction scrapers, which parse and store structured data, or monitoring scrapers, which check for changes)

The closest established term for it is a **HTTrack-style website copier**, but implemented with a real browser engine (Playwright) instead of a plain HTTP client — which puts it in the more modern subcategory of **headless browser crawlers**, distinguished by their ability to handle JavaScript-rendered content.

## Overview

Crawls an entire website using a real browser (Playwright/Chromium), downloads all HTML, CSS, JS, and images, rewrites links to relative local paths, and saves everything in a `wget`-style mirror folder structure so you can browse offline.

---

## Setup

```bash
# install uv
pip install uv
uv sync
playwright install chromium
```

---

## Usage

```bash
# Basic — mirrors https://example.com into ./site_mirror/
python run.py https://example.com

# Custom output folder, crawl up to 500 pages, 5 parallel tabs
python run.py https://example.com --output ./mirror --max-pages 500 --concurrency 5

# Show the browser window while crawling (useful for debugging JS-heavy sites)
python run.py https://example.com --no-headless

# Reuse an already-open Chrome/Chromium session (non-incognito context)
python run.py https://example.com --cdp-url http://127.0.0.1:9222
```

### All options

| Flag                   | Default       | Description               |
| ---------------------- | ------------- | ------------------------- |
| `--output` / `-o`      | `site_mirror` | Output directory          |
| `--max-pages` / `-m`   | `200`         | Stop after N pages        |
| `--concurrency` / `-c` | `3`           | Browser tabs open at once |
| `--no-headless`        | off           | Show browser window       |
| `--cdp-url`            | none          | Attach to open browser via CDP |

### Reuse an existing open browser

Start Chrome/Chromium with remote debugging enabled, then pass the CDP URL to the scraper.

```bash
# macOS example
open -na "Google Chrome" --args --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-cdp-profile

# then run scraper against the existing browser session
python run.py https://example.com --cdp-url http://127.0.0.1:9222
```

If you use the Make target `archive-site-w-cdp`, it now auto-starts this debug Chrome instance when needed and waits for `http://127.0.0.1:9222` to become available.

To get path to you existing Chrome profile, open `chrome://version` in Chrome and look for "Profile Path". Use that path as `CHROME_USER_DATA_DIR` and the profile folder name (e.g. `Default`) as `CHROME_PROFILE_DIR`.

To use your existing Chrome profile instead of `/tmp/chrome-cdp-profile`:

```bash
# convenience target (uses ~/Library/Application Support/Google/Chrome)
make archive-site-w-cdp-existing-profile

# or override explicitly
make archive-site-w-cdp \
    CHROME_USER_DATA_DIR="$HOME/Library/Application Support/Google/Chrome" \
    CHROME_PROFILE_DIR="Default"
```

If Chrome is already running without remote debugging, close it first, then run one of the commands above so it starts with `--remote-debugging-port`.

---

## Output structure

```
site_mirror/
├── index.html            ← homepage
├── about/
│   └── index.html
├── blog/
│   ├── index.html
│   └── my-post/
│       └── index.html
└── assets/
    ├── style.css
    ├── app.js
    └── logo.png
```

All `src=` and `href=` attributes in the saved HTML are rewritten to point to
local relative paths — open `index.html` in any browser with no internet.

---

## Using as a library

```python
import asyncio
from scraper import SiteScraper

async def main():
    scraper = SiteScraper(
        start_url="https://example.com",
        output_dir="mirror",
        max_pages=100,
        concurrency=4,
        headless=True,
        on_log=print,
        on_progress=lambda done, total, url: print(f"{done}/{total} {url}"),
    )
    await scraper.run()

asyncio.run(main())
```

---

## Notes

- **JavaScript-rendered content** is fully supported — Playwright waits for  `networkidle` before capturing the page.
- **Rate limiting**: keep `--concurrency` at 3–5 to avoid overloading servers. 
- **robots.txt**: the scraper does not check `robots.txt` — use responsibly and only on sites you have permission to mirror.
- **Auth-gated pages**: pass a `storage_state` to the Playwright context if you need to mirror pages behind a login.