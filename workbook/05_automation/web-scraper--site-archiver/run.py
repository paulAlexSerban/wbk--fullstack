"""
CLI entry point for the site scraper.

Usage:
    python run.py https://example.com
    python run.py https://example.com --output mirror --max-pages 500 --concurrency 4 --no-headless
"""

import argparse
import asyncio
import sys
from scraper import SiteScraper


def parse_args():
    p = argparse.ArgumentParser(description="Mirror a website for offline use via Playwright.")
    p.add_argument("url",                   help="Starting URL to crawl")
    p.add_argument("--output",    "-o",     default="site_mirror",  help="Output directory (default: site_mirror)")
    p.add_argument("--max-pages", "-m",     type=int, default=200,  help="Max pages to crawl (default: 200)")
    p.add_argument("--concurrency", "-c",   type=int, default=3,    help="Concurrent browser tabs (default: 3)")
    p.add_argument("--no-headless",         action="store_true",    help="Show the browser window")
    p.add_argument("--cdp-url",             help="Attach to an existing Chromium via CDP (e.g. http://127.0.0.1:9222)")
    return p.parse_args()


async def main():
    args = parse_args()

    scraper = SiteScraper(
        start_url=args.url,
        output_dir=args.output,
        max_pages=args.max_pages,
        concurrency=args.concurrency,
        headless=not args.no_headless,
        cdp_url=args.cdp_url,
    )

    print(f"Starting crawl: {args.url}")
    print(f"Output dir:     {args.output}/")
    print(f"Max pages:      {args.max_pages}   Concurrency: {args.concurrency}\n")
    if args.cdp_url:
        print(f"CDP attach:     {args.cdp_url}\n")

    try:
        await scraper.run()
    except KeyboardInterrupt:
        scraper.stop()
        print("\nStopped by user.")
        sys.exit(0)


if __name__ == "__main__":
    asyncio.run(main())