import uuid
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint, abort
from db import items, stores

blp = Blueprint("Item", __name__, description="Items API operations")


@blp.route("/item/<string:item_id>")
class Item(MethodView):
    def get(self, item_id):
        try:
            return items[item_id]
        except KeyError:
            abort(404, message="Item not found.")

    def put(self, item_id):
        item_data = request.get_json()
        if "name" not in item_data or "price" not in item_data:
            abort(
                400,
                message="Bad request. Ensure name, and price are included in the JSON payload.",
            )

        try:
            item = items[item_id]
            item |= item_data
            return item
        except KeyError:
            abort(404, message="Item not found.")

    def delete(self, item_id):
        try:
            del items[item_id]
            return {"message": "Item deleted."}
        except KeyError:
            abort(404, message="Item not found.")


@blp.route("/item")
class ItemList(MethodView):
    def get(self):
        return {"items": list(items.values())}

    def post(self):
        item_data = request.get_json()
        if (
            "store_id" not in item_data
            or "name" not in item_data
            or "price" not in item_data
        ):
            abort(
                400,
                message="Bad request. Ensure store_id, name, and price are included in the JSON payload.",
            )

        for item in items.values():
            if (
                item["name"] == item_data["name"]
                and item["store_id"] == item_data["store_id"]
            ):
                abort(400, message="Item already exists in store.")

        if item_data["store_id"] not in stores:
            abort(404, message="Store not found.")

        item_id = str(uuid.uuid4().hex)
        new_item = {**item_data, "id": item_id}
        items[item_id] = new_item
        return new_item, 201
