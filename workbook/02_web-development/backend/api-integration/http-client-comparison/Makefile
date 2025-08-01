install_deps:
	@echo "Installing dependencies..."
	@uv pip install -r requirements.txt	
	@echo "Dependencies installed."

run_main:
	@echo "Running main_api.py..."
	@python src/main_api.py

run_target:
	@echo "Running target_api.py..."
	@python src/target_api.py

test:
	@echo "Running tests..."
	@python -m pytest tests

benchmark_sync:
	@echo "Running synchronous benchmark..."
	@python tests/api_benchmark.py sync

benchmark_async:
	@echo "Running asynchronous benchmark..."
	@python tests/api_benchmark.py async