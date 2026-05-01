# Hello FastAPI API

## What

This folder contains a minimal FastAPI API entrypoint:

- `src/main.py` creates the FastAPI app.
- `GET /` returns a simple Hello World response.
- `GET /health` returns a basic health-check response.

## Why

This setup is useful as a clean starting point for:

- learning FastAPI basics,
- bootstrapping a backend service quickly,
- validating local API tooling and environment setup.

## How

### 1) Install dependencies

From the project root (or your active Python environment):

```bash
pip install -r requirements.txt
```

### 2) Run the API

From this folder (`backend/apis/hello-fastapi`):

```bash
uvicorn main:app --reload
```

### 3) Test endpoints

- API root: http://127.0.0.1:8000/
- Health: http://127.0.0.1:8000/health
- Interactive docs (Swagger UI): http://127.0.0.1:8000/docs
- ReDoc: http://127.0.0.1:8000/redoc

### Expected sample response

`GET /`

```json
{
  "message": "Hello, World!"
}
```
