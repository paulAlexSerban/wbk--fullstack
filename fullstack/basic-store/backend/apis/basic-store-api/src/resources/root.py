import uuid
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint, abort
from db import items

blp = Blueprint("Root", __name__, description="Root API operations")

available_routes = {
    "GET /": "Retrieve available routes",
    "GET /stores": "Retrieve all stores",
    "GET /store/<string:store_id>": "Retrieve store by ID",
    "POST /store": "Create a new store",
    "POST /item": "Create a new item",
    "GET /item": "Retrieve all items",
    "GET /item/<string:item_id>": "Retrieve item by ID",
}


@blp.route("/")
class Root(MethodView):
    def get(self):
        return available_routes
