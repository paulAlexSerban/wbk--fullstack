CHROME_BIN ?= /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
CDP_PORT ?= 9222
CDP_URL ?= http://127.0.0.1:$(CDP_PORT)
CHROME_USER_DATA_DIR ?= $(HOME)/Library/Application Support/Google/Chrome
CHROME_PROFILE_DIR ?= Default
SITE_URL ?= https://example.com
OUTPUT_DIR ?= archive/example

install-deps:
	@uv sync
	@playwright install chromium

test:
	@uv run test

syntax-diagnostics:
	@python -m py_compile scraper.py run.py

archive-site:
# 	python run.py https://example.com --output mirror --max-pages 500 --concurrency 4 --no-headless
	@uv run run.py $(SITE_URL) --output $(OUTPUT_DIR) --max-pages 500 --concurrency 4 --no-headless

run-chrome-w-remote-debugging:
	@open -na "Google Chrome" --args --remote-debugging-port=$(CDP_PORT) --user-data-dir="$(CHROME_USER_DATA_DIR)" --profile-directory="$(CHROME_PROFILE_DIR)"


archive-site-w-cdp:
	@curl -fsS $(CDP_URL)/json/version >/dev/null || \
		open -na "Google Chrome" --args --remote-debugging-port=$(CDP_PORT) --user-data-dir="$(CHROME_USER_DATA_DIR)" --profile-directory="$(CHROME_PROFILE_DIR)"
	@for i in 1 2 3 4 5 6 7 8 9 10; do \
		curl -fsS $(CDP_URL)/json/version >/dev/null && break; \
		sleep 0.5; \
	done
	@curl -fsS $(CDP_URL)/json/version >/dev/null || \
		(echo "CDP endpoint $(CDP_URL) is not reachable." && exit 1)
	@uv run run.py $(SITE_URL) --output $(OUTPUT_DIR) --cdp-url $(CDP_URL) --max-pages 500 --concurrency 4 --no-headless

