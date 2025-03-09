from flask import Flask
app = Flask(__name__)

stores = [
    {
        "name": "My Store",
        "items": [
            {
                "name": "My Item",
                "price": 15.99
            },
            {
                "name": "My Item 2",
                "price": 10.99
            },
            {
                "name": "My Item 3",
                "price": 20.99
            },
            {
                "name": "My Item 4",
                "price": 5.99
            },
            {
                "name": "My Item 5",
                "price": 25.99
            },
            {
                "name": "My Item 6",
                "price": 30.99
            },
            {
                "name": "My Item 7",
                "price": 35.99
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
