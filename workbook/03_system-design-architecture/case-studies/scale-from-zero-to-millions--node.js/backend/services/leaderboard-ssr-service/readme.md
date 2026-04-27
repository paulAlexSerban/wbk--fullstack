# Leaderboard SSR Service

This service is responsible for rendering the leaderboard page on the server side. It fetches the necessary data from the database and renders the HTML using a template engine.

## API Endpoints
| Endpoint           | Method | Description                                        |
| ------------------ | ------ | -------------------------------------------------- |
| `/`                | GET    | Renders the leaderboard page with the latest data. |
| `/users`           | GET    | Renders the users page with the list of users.     |
| `/users/:id`       | GET    | Renders the user profile page for a specific user. |
| `/api/leaderboard` | GET    | Fetches the leaderboard data in JSON format.       |
| `/api/users`       | GET    | Fetches the list of users in JSON format.          |

## Data Models
- **User**: Represents a user in the system with properties such as `id`, `name`, `score`, `rank`, `firstName`, `lastName`, `address`, `email`, `phone`, `website`, and `company`.
- **LeaderboardEntry**: Represents an entry in the leaderboard with properties such as `userId`, `score`, and `rank`.
- **Leaderboard**: Represents the leaderboard with properties such as `entries` (array of `LeaderboardEntry`) and `lastUpdated`.

## Tech Stack
- Node.js 24
- JavaScript + Express.js
- SQLite via built-in `node:sqlite`
- Handlebars (`express-handlebars`) for SSR templates
- Yarn for dependency management
- Docker + Docker Compose for containerization

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

This exposes the service on `http://localhost:3000` and persists SQLite data in a Docker volume.
