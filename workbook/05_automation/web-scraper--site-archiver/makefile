install-deps:
	@uv sync
	@playwright install chromium

test:
	@uv run test

archive-site:
# 	python run.py https://example.com --output mirror --max-pages 500 --concurrency 4 --no-headless
	@uv run run.py https://example.com --output archive/example --max-pages 500 --concurrency 4 --no-headless