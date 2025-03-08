from flask import Flask
app = Flask(__name__)

stores = [
    {
        "name": "My Store",
        "items": [
            {
                "name": "My Item",
                "price": 15.99
            }
        ]
    }
]

available_routes = {
    "GET /": "Retrieve available routes",
    "GET /stores": "Retrieve all stores"
}

@app.route("/")
def home():
    return available_routes

@app.route("/stores")
def get_stores():
    return {"stores": stores}

if __name__ == "__main__":
    app.run(debug=True)