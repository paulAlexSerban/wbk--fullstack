# Profiles REST API

## Tech-stack

- Python, Django, Django REST framework, Docker, Flake8, AutoPEP8, PostgreSQL, pgAdmin4

## Features

1. Hello API - A simple API to test the API is working or not.
2. Profiles API - A CRUD API for managing user profiles.
3. Login API - An API for user login.
4. Feed API - An API to manage user status updates.

### Hello API

#### Hello API View

- `/api/hello-view/`

  - GET - Retrieve a hello message.
  - POST - Create a hello message.

- `/api/hello-view/<ID>`
  - PUT - Update a hello message.
  - PATCH - Partially update a hello message.
  - DELETE - Delete a hello message.

#### Hello API ViewSet

- `/api/hello-viewset/`

  - GET - Retrieve a hello message.
  - POST - Create a hello message.

- `/api/hello-viewset/<ID>`
  - PUT - Update a hello message.
  - PATCH - Partially update a hello message.
  - DELETE - Delete a hello message.

### Profiles API

- `/api/profile/`
  - GET - Retrieve a list of profiles.
  - POST - Create a profile.
- `/api/profile/<id>/`
  - GET - Retrieve a specific profile.
  - PUT - Update a specific profile with a new data.
  - PATCH - Partially update a specific profile with a new data.
  - DELETE - Delete a specific profile.

### Login API

- `/api/login/`
  - POST - Login a user and return an authentication token.

```json
{
  "email": "admin@test.com",
  "password": "admin"
}
```

### Feed API

- `/api/feed/`
  - GET - Retrieve a list of feed items.
  - POST - Create a feed item for the authenticated user.
- `/api/feed/<id>/`
  - GET - Retrieve a specific feed item.
  - PUT - Update a specific feed item with a new data for the authenticated user.
  - PATCH - Partially update a specific feed item with a new data for the authenticated user.
  - DELETE - Delete a specific feed item for the authenticated user.
