---
title: Errors
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: errors.html
summary: Error reporting including the complete errorbase
---

## Error Responses

Errors are generally using the HTTP status code with addtional information available returned in the `error` object.

### 400 - Bad request

Example:
```json
{
  "error": {
    "code": 400,
    "message": "Bad Request: The supplied service ID of the patient's practice does not exist in the system"
  }
}
```


### 401 - Unauthorised

Example:
```json
{
  "error": {
    "code": 401,
    "message": "Unauthorized: You are not authorized to access this resource."
  }
}
```
