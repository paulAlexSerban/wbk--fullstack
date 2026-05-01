from flask import Flask, jsonify
import requests
from urllib3.util.retry import Retry as urllib3_retry
from requests.adapters import HTTPAdapter

import httpx
from httpx_retries import RetryTransport, Retry as httpx_retry
import asyncio
import aiohttp

from tenacity import retry, stop_after_attempt
from tenacity.wait import wait_base
import time

# Use a JSON API instead of Google's HTML page
TARGET_URL = "http://localhost:5001/target"

app = Flask(__name__)

# ---------------------------------------------------------------------------
# requests with retries
# ---------------------------------------------------------------------------

session = requests.Session()
retries = urllib3_retry(total=3, backoff_factor=1, status_forcelist=[500])
adapter = HTTPAdapter(max_retries=retries)
session.mount("http://", adapter)
session.mount("https://", adapter)


@app.route("/call-requests")
def call_requests():
    try:
        resp = session.get(TARGET_URL)
        resp.raise_for_status()
        return jsonify(resp.json()), resp.status_code
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ---------------------------------------------------------------------------
# httpx with manual retries
# ---------------------------------------------------------------------------


@app.route("/call-httpx-manual-retries")
def call_httpx_with_manual_retries():
    max_retries = 3
    delay_seconds = 1

    for attempt in range(1, max_retries + 1):
        try:
            with httpx.Client() as client:
                response = client.get(TARGET_URL)
                response.raise_for_status()
                return jsonify(response.json())
        except httpx.HTTPStatusError as e:
            # Retry only on 5xx responses
            if 500 <= e.response.status_code < 600:
                if attempt < max_retries:
                    time.sleep(delay_seconds)
                    continue
                return (
                    jsonify(
                        {"error": f"Failed after {attempt} attempts", "details": str(e)}
                    ),
                    500,
                )
            else:
                return jsonify({"error": str(e)}), e.response.status_code
        except Exception as e:
            return jsonify({"error": str(e)}), 500


# ---------------------------------------------------------------------------
# httpx-retries
# ---------------------------------------------------------------------------


@app.route("/call-httpx-retries")
def call_httpx_retries():
    retry_strategy = httpx_retry(
        total=5, backoff_factor=0.5, status_forcelist=[500], allowed_methods=["GET"]
    )
    transport = RetryTransport(retry=retry_strategy)

    try:
        with httpx.Client(transport=transport) as client:
            response = client.get(TARGET_URL)
            response.raise_for_status()
            return jsonify(response.json())
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ---------------------------------------------------------------------------
# httpx (sync mode) with retry using tenacity
# ---------------------------------------------------------------------------


def hook_before_sleep(retry_state):
    print(
        f"Retry #{retry_state.attempt_number} after {retry_state.outcome.exception()}, next wait {retry_state.next_action.sleep} seconds"
    )
    
def hook_after_retry(retry_state):
    print(f"Retry #{retry_state.attempt_number} completed, next attempt in {retry_state.next_action.sleep} seconds")


class wait_scaled_inverted_exponential(wait_base):
    def __init__(
        self, retries, max_wait=90, min_delay=1.0, base=2.0, backoff_factor=1.0
    ):
        self.retries = retries
        self.max_wait = max_wait
        self.min_delay = min_delay
        self.base = base
        self.backoff_factor = backoff_factor
        self.delays = self._compute_delays()

    def _compute_delays(self):
        # Step 1: Generate raw inverse exponential weights
        raw_weights = [1 / (self.base**i) for i in range(1, self.retries + 1)]
        total_weight = sum(raw_weights)

        # Step 2: Normalize to max_wait
        scaled_weights = [(w / total_weight) * self.max_wait for w in raw_weights]

        # Step 3: Apply backoff factor and min_delay cap
        delays = [
            max(self.min_delay, self.backoff_factor * delay) for delay in scaled_weights
        ]
        return delays

    def __call__(self, retry_state):
        attempt = retry_state.attempt_number
        if 1 <= attempt <= self.retries:
            return self.delays[attempt - 1]
        return self.delays[-1]  # fallback to last delay


@retry(
    stop=stop_after_attempt(5),
    wait=wait_scaled_inverted_exponential(
        retries=5, max_wait=90, base=2, backoff_factor=0.8, min_delay=1
    ),
    before_sleep=hook_before_sleep,
    reraise=True,
)
def call_httpx():
    resp = httpx.get(TARGET_URL)
    resp.raise_for_status()
    return resp.json()


@app.route("/call-httpx-tenacity")
def call_httpx_route():
    try:
        data = call_httpx()
        # stats = data.retry.statistics
        # print(f"Retry statistics: {stats}")
        return jsonify(data)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ---------------------------------------------------------------------------
# aiohttp with asyncio + retry
# ---------------------------------------------------------------------------


# @retry(stop=stop_after_attempt(3), wait=wait_fixed(1))
# async def call_aiohttp():
#     async with aiohttp.ClientSession() as session:
#         async with session.get(TARGET_URL) as resp:
#             resp.raise_for_status()
#             return await resp.json()


# @app.route("/call-aiohttp")
# def call_aiohttp_route():
#     try:
#         data = asyncio.run(call_aiohttp())
#         return jsonify(data)
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(port=5000)
