from flask import Flask, request

app = Flask(__name__)

stores = [
    {
        "name": "My Store",
        "id": 1,
        "items": [
            {
                "name": "My Item",
                "price": 15.99,
                "id": 1
            },
            {
                "name": "My Item 2",
                "price": 10.99,
                "id": 2
            },
            {
                "name": "My Item 3",
                "price": 20.99,
                "id": 3
            },
            {
                "name": "My Item 4",
                "price": 5.99,
                "id": 4
            },
            {
                "name": "My Item 5",
                "price": 25.99,
                "id": 5
            },
            {
                "name": "My Item 6",
                "price": 30.99,
                "id": 6
            },
            {
                "name": "My Item 7",
                "price": 35.99,
                "id": 7
            }
        ]
    }
]

available_routes = {
    "GET /": "Retrieve available routes",
    "GET /stores": "Retrieve all stores"
}


@app.get("/")
def home():
    return available_routes


@app.get("/stores")
def get_stores():
    return {"stores": stores}

@app.get("/store/<string:store_id>")
def get_store(store_id):
    for store in stores:
        if store["id"] == int(store_id):
            return store
    return {"message": "Store not found"}, 404

@app.post("/store")
def create_store():
    request_data = request.get_json()
    print(request_data)
    new_store = {
        "name": request_data["name"],
        "id": len(stores) + 1,
        "items": []
    }
    stores.append(new_store)
    return new_store, 201

@app.post("/store/<string:store_id>/item")
def create_item_in_store(store_id):
    request_data = request.get_json()
    for store in stores:
        if store["id"] == int(store_id):
            new_item = {
                "name": request_data["name"],
                "price": request_data["price"],
                "id": len(store["items"]) + 1
            }
            store["items"].append(new_item)
            return new_item, 201
    return {"message": "Store not found"}, 404

@app.get("/store/<string:store_id>/item")
def get_items_in_store(store_id):
    for store in stores:
        if store["id"] == int(store_id):
            return {"items": store["items"]}
    return {"message": "Store not found"}, 404

if __name__ == "__main__":
    app.run(debug=True)
