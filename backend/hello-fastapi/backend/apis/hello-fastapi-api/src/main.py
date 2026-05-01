import asyncio
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(
    title="Hello FastAPI",
    description="A minimal Hello World API built with FastAPI.",
    version="0.1.0",
)

class Item(BaseModel):
    text: str
    is_done: bool = False

class ItemsStore:
    def __init__(self):
        self.items: list[Item] = []

    def add_item(self, item: Item) -> list[Item]:
        self.items.append(item)
        return self.items

    def get_items(self) -> list[Item]:
        return self.items

    def get_item(self, item_id: int) -> Item:
        if 0 <= item_id < len(self.items):
            return self.items[item_id]
        else:
            raise HTTPException(status_code=404, detail="Item not found")

items_store = ItemsStore()


@app.get("/", response_model=list[Item])
def read_root() -> list[Item]:
    return items_store.get_items()


@app.get("/health", response_model=dict[str, str])
def health_check() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/async", response_model=dict[str, str])
async def async_endpoint() -> dict[str, str]:
    await asyncio.sleep(1)  # Simulate some async work
    return {"message": "This is an async endpoint"}


@app.post("/items", response_model=list[Item])
def create_item(item: Item) -> list[Item]:
    items_store.add_item(item)
    return items_store.get_items()


@app.get("/items", response_model=list[Item])
def get_items() -> list[Item]:
    return items_store.get_items()


@app.get("/items", response_model=list[Item])
def list_items(limit: int = 10) -> list[Item]:
    return items_store.get_items()[:limit]


@app.get("/items/{item_id}", response_model=Item)
def get_item(item_id: int) -> Item:
    return items_store.get_item(item_id)