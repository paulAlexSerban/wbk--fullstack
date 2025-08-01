# target_api.py
from flask import Flask, jsonify
import random

app = Flask(__name__)


@app.route("/target")
def target():
    # if random.random() < 0.5:
    #     return jsonify({"error": "Temporary failure"}), 500
    # return jsonify({"message": "Success"}), 200
    return jsonify({"error": "Temporary failure"}), 500


if __name__ == "__main__":
    app.run(port=5001)
