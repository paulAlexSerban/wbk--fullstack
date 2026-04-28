# Leaderboard SSR Service

This service is responsible for rendering the leaderboard page on the server side. It fetches the necessary data from the database and renders the HTML using a template engine.

## Run Locally
```bash
yarn install
yarn start
```

The service starts on `http://localhost:3000`.

## Run With Docker
```bash
docker compose up --build
```

This exposes the service on `http://localhost:3000` and persists JSON data in a Docker volume.
