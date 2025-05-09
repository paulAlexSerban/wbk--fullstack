import uuid
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint, abort
from db import stores

blp = Blueprint("Store", __name__, description="Store API operations")


@blp.route("/store/<string:store_id>")
class Store(MethodView):
    def get(self, store_id):
        try:
            return stores[store_id]
        except KeyError:
            abort(404, message="Store not found.")

    def put(self, store_id):
        store_data = request.get_json()
        if "name" not in store_data:
            abort(
                400, message="Bad request. Ensure name is included in the JSON payload."
            )

        try:
            store = stores[store_id]
            store |= store_data
            return store
        except KeyError:
            abort(404, message="Store not found.")

    def delete(self, store_id):
        try:
            del stores[store_id]
            return {"message": "Store deleted."}
        except KeyError:
            abort(404, message="Store not found.")


@blp.route("/store")
class StoreList(MethodView):
    def get(self):
        return {"stores": stores}

    def post(self):
        store_data = request.get_json()
        if "name" not in store_data:
            abort(
                400, message="Bad request. Ensure name is included in the JSON payload."
            )

        for store in stores.values():
            if store["name"] == store_data["name"]:
                abort(400, message="Store already exists in the database.")

        store_id = str(uuid.uuid4().hex)
        new_store = {**store_data, "id": store_id}
        stores[store_id] = new_store
        return new_store, 201
