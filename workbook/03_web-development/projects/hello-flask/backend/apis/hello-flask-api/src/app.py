from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    response = {
        "statusCode": 200,
        "message": "Hello Flask from Docker!!"
    }
    return response

if __name__ == "__main__":
    app.run(debug=True)