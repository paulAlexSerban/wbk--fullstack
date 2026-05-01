import time
import asyncio
import statistics
from concurrent.futures import ThreadPoolExecutor
import requests
import httpx
import os
from datetime import datetime

# 🧩 Configuration
URL = "http://localhost:5000/call-httpx-tenacity"
TOTAL_REQUESTS = 100
CONCURRENCY = 10

# Create results directory if it doesn't exist
os.makedirs("benchmark_results", exist_ok=True)


# 📊 Metrics collector
class Stats:
    def __init__(self, mode):
        self.mode = mode
        self.times = []
        self.success = 0
        self.fail = 0

    def record(self, start, end, success):
        self.times.append(end - start)
        if success:
            self.success += 1
        else:
            self.fail += 1

    def report(self, total_time):
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"benchmark_results/benchmark_{self.mode}_{timestamp}.txt"
        
        with open(filename, 'w') as f:
            f.write(f"API Benchmark Results\n")
            f.write(f"====================\n")
            f.write(f"URL: {URL}\n")
            f.write(f"Mode: {self.mode}\n")
            f.write(f"Test Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"Total Requests: {TOTAL_REQUESTS}\n")
            f.write(f"Concurrency: {CONCURRENCY}\n")
            f.write(f"Total Time: {total_time:.2f} seconds\n\n")
            
            f.write(f"Results Summary:\n")
            f.write(f"---------------\n")
            f.write(f"✅ Successful requests: {self.success}\n")
            f.write(f"❌ Failed requests: {self.fail}\n")
            f.write(f"Success Rate: {(self.success/(self.success+self.fail))*100:.1f}%\n\n")
            
            if self.times:
                f.write(f"Performance Metrics:\n")
                f.write(f"-------------------\n")
                f.write(f"📈 Average latency: {statistics.mean(self.times):.4f} sec\n")
                f.write(f"📉 Min latency: {min(self.times):.4f} sec\n")
                f.write(f"📈 Max latency: {max(self.times):.4f} sec\n")
                f.write(f"📊 Median latency: {statistics.median(self.times):.4f} sec\n")
                if len(self.times) > 1:
                    f.write(f"📏 Std deviation: {statistics.stdev(self.times):.4f} sec\n")
                f.write(f"🔁 Throughput: {self.success / sum(self.times):.2f} requests/sec\n")
                f.write(f"🔁 Overall RPS: {self.success / total_time:.2f} requests/sec\n\n")
                
                f.write(f"Response Time Distribution:\n")
                f.write(f"-------------------------\n")
                sorted_times = sorted(self.times)
                percentiles = [50, 75, 90, 95, 99]
                for p in percentiles:
                    idx = int((p / 100) * len(sorted_times)) - 1
                    if idx >= 0:
                        f.write(f"P{p}: {sorted_times[idx]:.4f} sec\n")
            else:
                f.write("No results to report.\n")
        
        print(f"Results saved to: {filename}")
        
        # Also print to console
        if self.times:
            print(f"✅ Successful requests: {self.success}")
            print(f"❌ Failed requests: {self.fail}")
            print(f"📈 Average latency: {statistics.mean(self.times):.4f} sec")
            print(f"📉 Min latency: {min(self.times):.4f} sec")
            print(f"📈 Max latency: {max(self.times):.4f} sec")
            print(f"🔁 Throughput: {self.success / sum(self.times):.2f} requests/sec")
        else:
            print("No results to report.")


# -----------------------------------
# 🧵 Synchronous requests with threads
# -----------------------------------
def send_request_sync(stats: Stats):
    start = time.time()
    try:
        response = requests.get(URL, timeout=5)
        success = response.status_code == 200
    except Exception:
        success = False
    end = time.time()
    stats.record(start, end, success)


def benchmark_sync():
    stats = Stats("sync")
    start_time = time.time()
    
    with ThreadPoolExecutor(max_workers=CONCURRENCY) as executor:
        futures = [
            executor.submit(send_request_sync, stats) for _ in range(TOTAL_REQUESTS)
        ]
        for f in futures:
            f.result()
    
    end_time = time.time()
    total_time = end_time - start_time
    stats.report(total_time)
    return total_time


# -----------------------------------
# ⚡ Asynchronous requests with httpx
# -----------------------------------
async def send_request_async(client, stats: Stats):
    start = time.time()
    try:
        resp = await client.get(URL, timeout=5.0)
        success = resp.status_code == 200
    except Exception:
        success = False
    end = time.time()
    stats.record(start, end, success)


async def benchmark_async():
    stats = Stats("async")
    start_time = time.time()
    
    async with httpx.AsyncClient() as client:
        sem = asyncio.Semaphore(CONCURRENCY)

        async def sem_task():
            async with sem:
                await send_request_async(client, stats)

        await asyncio.gather(*(sem_task() for _ in range(TOTAL_REQUESTS)))
    
    end_time = time.time()
    total_time = end_time - start_time
    stats.report(total_time)
    return total_time


# -----------------------------------
# 🔧 Entrypoint
# -----------------------------------
if __name__ == "__main__":
    import sys

    mode = sys.argv[1] if len(sys.argv) > 1 else "sync"
    print(
        f"Benchmarking {URL} with {TOTAL_REQUESTS} requests and {CONCURRENCY} concurrency..."
    )

    if mode == "sync":
        total_time = benchmark_sync()
    elif mode == "async":
        total_time = asyncio.run(benchmark_async())
    else:
        print("Usage: python api_benchmark.py [sync|async]")
        exit(1)

    print(f"⏱ Total time: {total_time:.2f} seconds")