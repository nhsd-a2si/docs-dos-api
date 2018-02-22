---
title: Authentication
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: authentication.html
summary: Authentication to use the DoS API using HTTP basic auth
---

Authentication to the API uses HTTP basic auth. Authentication is used to track API usage and to authorize write access to the data where this is permitted. All resources except _/status_ require authentication.

HTTP basic auth is built in to all HTTP clients and requires the `Authorization` request header with the username and password colon delimited and base 64 encoded. For example using username/password eps/3xamp1e would produce:

```sh
$ curl --basic -v --user eps:3xamp1e dos.eps.digital.nhs.uk/v0.0.1/dispenser/FA123

> GET /v0.0.1/dispenser/FA123 HTTP/1.1
> Host: dos.eps.digital.nhs.uk
> Authorization: Basic ZXBzOjN4YW1wMWU=
```

NHS Digital will be responsible for issuing and managing credentials.

Attempting to access resources without authentication will result in a 403 error.
