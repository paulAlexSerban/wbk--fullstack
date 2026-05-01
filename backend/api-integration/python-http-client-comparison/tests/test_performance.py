import pytest
import requests
import statistics
import time
from datetime import datetime
import os

ENDPOINTS = [
    # "http://localhost:5000/call-requests",
    # "http://localhost:5000/call-httpx-manual-retries",
    # "http://localhost:5000/call-httpx-retries",
    # "http://localhost:5000/call-aiohttp",
    "http://localhost:5000/call-httpx-tenacity",
]

ITERATIONS = 1

# Create results directory if it doesn't exist
os.makedirs("performance_results", exist_ok=True)

# clean performance results directory
for file in os.listdir("performance_results"):
    file_path = os.path.join("performance_results", file)
    if os.path.isfile(file_path):
        os.remove(file_path)

def write_results_to_file(url, successes, errors, durations):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    endpoint_name = url.split("/")[-1]  # Extract endpoint name from URL
    filename = f"performance_results/performance_{endpoint_name}_{timestamp}.txt"

    with open(filename, "w") as f:
        f.write(f"Performance Test Results\n")
        f.write(f"========================\n")
        f.write(f"Endpoint: {url}\n")
        f.write(f"Test Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"Iterations: {ITERATIONS}\n\n")

        f.write(f"Results Summary:\n")
        f.write(f"---------------\n")
        f.write(f"Successes: {successes}/{ITERATIONS}\n")
        f.write(f"Failures: {errors}/{ITERATIONS}\n")
        f.write(f"Success Rate: {(successes/ITERATIONS)*100:.1f}%\n\n")

        if durations:
            f.write(f"Performance Metrics:\n")
            f.write(f"-------------------\n")
            f.write(f"Min Time: {min(durations):.4f}s\n")
            f.write(f"Max Time: {max(durations):.4f}s\n")
            f.write(f"Mean Time: {statistics.mean(durations):.4f}s\n")
            f.write(f"Median Time: {statistics.median(durations):.4f}s\n")
            if len(durations) > 1:
                f.write(f"Stdev Time: {statistics.stdev(durations):.4f}s\n")

            f.write(f"\nDetailed Results:\n")
            f.write(f"----------------\n")
            for i, duration in enumerate(durations, 1):
                f.write(f"Request {i}: {duration:.4f}s\n")
        else:
            f.write(f"No valid results recorded\n")

    print(f"Results saved to: {filename}")


@pytest.mark.parametrize("url", ENDPOINTS)
def test_endpoint_performance(url):
    durations = []
    successes = 0
    errors = 0

    for i in range(ITERATIONS):
        start = time.time()
        try:
            resp = requests.get(url, timeout=10)
            elapsed = time.time() - start
            durations.append(elapsed)
            if resp.status_code == 200:
                successes += 1
            else:
                errors += 1
        except Exception as e:
            elapsed = time.time() - start
            durations.append(elapsed)
            errors += 1

    # Write results to file
    write_results_to_file(url, successes, errors, durations)
