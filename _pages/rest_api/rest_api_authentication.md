---
title: Authentication
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: rest_api_authentication.html
summary: Authentication to use the DoS API using HTTP basic auth
---

Authentication to the REST API uses HTTP basic auth. Authentication is used to track API usage and to control which information is returned to the consumer.

HTTP basic auth is built in to all HTTP clients and requires the `Authorization` request header with the username and password colon delimited and base64 encoded.

For example using username:password of `dos:l3tm31n` would produce:

```sh
$ curl --basic -v --user dos:l3tm31n https://www.pathwaysdos.nhs.uk/app/controllers/api/v1.0/services/byOdsCode/FA123

> GET /app/controllers/api/v1.0/services/byOdsCode/FA123 HTTP/1.1
> Host: www.pathwaysdos.nhs.uk
> Authorization: Basic ZG9zOmwzdG0zMW4=
```

NHS Digital is responsible for issuing and managing credentials.

Attempting to access resources without authentication will result in a 401 error.

```json
{
  "error": {
    "code": 401,
    "message": "Unauthorized: You are not authorized to access this resource."
  }
}
```
