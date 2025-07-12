# Rest API Checklist

## Request

- the Request should include
  - the HTTP method
  - the URL
  - the headers
  - the Body (if POST, PUT or PATCH)

```http
GET /api/v1/entities/17
User-Agent: PostmanRuntime/7.26.8
Accept: */*
Cache-Control: no-cache
Postman-Token: 3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b
Host: localhost:3000
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
```

## Response

- the Response should include
  - the status code
  - the headers
  - the Body

```http
HTTP/1.1 200 OK
Date: Mon, 14 Dec 2020 14:00:00 GMT
Content-Type: text/plain; charset=utf-8
Transfer-Encoding: chunked
Connection: keep-alive
access-control-allow-origin: *
Vary: Accept-Encoding
```

```json
{
  "orderId": 17,
  "orderDate": "2020-12-14",
  "items": [
    {
      "itemId": 1,
      "itemName": "item 1",
      "quantity": 1
    },
    {
      "itemId": 2,
      "itemName": "item 2",
      "quantity": 2
    }
  ]
}
```

## HTTP Verb

| Verb   | Role                      | Body | Params in ... |
| ------ | ------------------------- | ---- | ------------- |
| GET    | Read - Retrieve resources | No   | URL           |
| POST   | Create - Create resources | Yes  | Body          |
| PUT    | Update - Update resources | Yes  | URL           |
| PATCH  | Update - Partial update   | Yes  | URL           |
| DELETE | Delete - Delete resources | No   | URL           |
| HEAD   | Read - Retrieve headers   | No   | URL           |

## URL Structure

```http
/api/v1/order/17/items?user=john&date=2020-12-14
```

- `/api` - the API word - to identify the API
- `/v1` - the version number - to identify the version
- `/order` - the resource/entity name - to identify the resource
- `/17` - the resource identifier/id param - to identify the resource instance
- `/items` - the sub-resource name - to identify the sub-resource
- `?user=john&date=2020-12-14` - the query string - to filter the resources

- NEVER include verbs in the URL
- some parts are optional (eg. sub-entity)
- use singular/plural wisely

## Response/Status Codes

| Verb   | Code    | Description            |
| ------ | ------- | ---------------------- |
| GET    | 200     | OK                     |
| GET    | 400     | Bad Request            |
| GET    | 401/403 | Unauthorized/Forbidden |
| GET    | 404     | Not Found              |
| GET    | 500     | Internal Server Error  |
| POST   | 200     | OK                     |
| POST   | 201     | Created                |
| POST   | 202     | Accepted               |
| POST   | 204     | No Content             |
| POST   | 400     | Bad Request            |
| POST   | 401/403 | Unauthorized/Forbidden |
| POST   | 404     | Not Found              |
| PUT    | 200     | OK                     |
| PUT    | 202     | Accepted               |
| PUT    | 204     | No Content             |
| PUT    | 400     | Bad Request            |
| PUT    | 401/403 | Unauthorized/Forbidden |
| PUT    | 404     | Not Found              |
| DELETE | 200     | OK                     |
| DELETE | 400     | Bad Request            |
| DELETE | 401/403 | Unauthorized/Forbidden |
| DELETE | 404     | Not Found              |

- avoid non-standard codes
- consider use of 207 (Multi-Status) for batch operations when necessary

## Docs
- always use OpenAPI/Swagger for API documentation
    - great for testing also besides documentation
    - it does not have to be exported to external clients

## Versioning
- include version in the API (URL or Header)
- define version support policy (eg. 1 year)
- use semantic versioning (eg. v1.2.3)

##  Authentication (AuthN) & Authorization(AuthZ)
- prefer using widely-used protocols such as OAuth2
- use popular authentication servers if possible
- if the API is internal and cannot utilize AuthN server, check if API Gateway & Discovery service offers AuthN & AuthZ can be used

## Performance
- if needed, make sure Rate Limit Quota are in place
- use checking whenever possible

## Monitoring
- collect API usage data
- use this data to improve teh API
  - DO NOT develop your own monitoring engine - use a 3rd part for that
