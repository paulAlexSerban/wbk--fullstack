CHROME_BIN ?= /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
CDP_PORT ?= 9222
CDP_URL ?= http://127.0.0.1:$(CDP_PORT)
CHROME_USER_DATA_DIR ?= $(HOME)/Library/Application Support/Google/Chrome
CHROME_CDP_DATA_DIR ?= $(HOME)/Library/Application Support/Google/ChromeCDP
CHROME_PROFILE_DIR ?= Default
SITE_URL ?= https://bytebytego.com/courses/tech-resume
OUTPUT_DIR ?= archive/bytebytego-my-courses

install-deps:
	@uv sync
	@playwright install chromium

test:
	@uv run test

syntax-diagnostics:
	@python -m py_compile scraper.py run.py

archive-site:
	@uv run run.py $(SITE_URL) --output $(OUTPUT_DIR) --max-pages 500 --concurrency 4 --no-headless

setup-chrome-cdp-profile:
	@echo "Syncing '$(CHROME_PROFILE_DIR)' profile to CDP data dir..."
	@mkdir -p "$(CHROME_CDP_DATA_DIR)/$(CHROME_PROFILE_DIR)"
	@rsync -a --delete "$(CHROME_USER_DATA_DIR)/$(CHROME_PROFILE_DIR)/" \
		"$(CHROME_CDP_DATA_DIR)/$(CHROME_PROFILE_DIR)/"


run-chrome-w-remote-debugging:
	@pkill -f "Google Chrome.*--remote-debugging-port=$(CDP_PORT)" >/dev/null 2>&1 || true
	@sleep 0.4
	@"$(CHROME_BIN)" --remote-debugging-port=$(CDP_PORT) --user-data-dir="$(CHROME_CDP_DATA_DIR)" --profile-directory="$(CHROME_PROFILE_DIR)" about:blank >/tmp/chrome-cdp.log 2>&1 &


archive-site-w-cdp:
	@$(MAKE) setup-chrome-cdp-profile
	@$(MAKE) run-chrome-w-remote-debugging
	@for i in 1 2 3 4 5 6 7 8 9 10; do \
		curl -fsS $(CDP_URL)/json/version >/dev/null && break; \
		sleep 0.5; \
	done
	@curl -fsS $(CDP_URL)/json/version >/dev/null || \
		(echo "CDP endpoint $(CDP_URL) is not reachable." && exit 1)
	@uv run run.py $(SITE_URL) --output $(OUTPUT_DIR) --cdp-url $(CDP_URL) --max-pages 500 --concurrency 4 --no-headless

