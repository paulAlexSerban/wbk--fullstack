CHROME_BIN ?= /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
CDP_PORT ?= 9222
CDP_URL ?= http://127.0.0.1:$(CDP_PORT)
CHROME_USER_DATA_DIR ?= $(HOME)/Library/Application Support/Google/Chrome
CHROME_PROFILE_DIR ?= Default

install-deps:
	@uv sync
	@playwright install chromium

test:
	@uv run test

syntax-diagnostics:
	@python -m py_compile scraper.py run.py

archive-site:
# 	python run.py https://example.com --output mirror --max-pages 500 --concurrency 4 --no-headless
	@uv run run.py https://bytebytego.com/my-courses --output archive/byte-byte-go-courses --max-pages 500 --concurrency 4 --no-headless

run-chrome-w-remote-debugging:
	@open -na "$(CHROME_BIN)" --args --remote-debugging-port=$(CDP_PORT) --user-data-dir="$(CHROME_USER_DATA_DIR)" --profile-directory="$(CHROME_PROFILE_DIR)"

archive-site-w-cdp:
	@uv run run.py https://bytebytego.com/my-courses --output archive/byte-byte-go-courses --cdp-url $(CDP_URL) --max-pages 500 --concurrency 4 --no-headless

