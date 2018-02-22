---
title: Errors
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: errors.html
summary: Error reporting including the complete errorbase
---


Errors are generally using the HTTP status code with addtional information available returned in the Error object. Where the error relates to a specific parameter
these are specifically named in the `fields` property. The Error object has the following definition:
```yaml
  Error:
    type: object
    properties:
      code:
        type: integer
        format: int32
      message:
        type: string
      fields:
        type: string
```
Example:
```json
{
  "code": 5,
  "message": "Invalid parameter"
  "fields": ods
}

```
## Errorbase ##

All DoS-specific errors are listed below. This list is expected to be extended as the API is developed further. Normal HTTP-layer errors may also be returned.

| Code  | Message                                                                                            | Fields           | HTTP Status |
|-------|----------------------------------------------------------------------------------------------------|------------------|-------------|
| 1     | Unknown error                                                                                      | `null`           | 500         |
| 2     | Dispenser not found                                                                                | `ods`            | 404         |
| 3     | Exceeded rate limit                                                                                | `null`           | 429         |
| 4     | Invalid parameter                                                                                  | `ods` \| `postcode` \| `distance` \| `open_within` \| `availability_start` \| `service_type` \| `name` | 400 |
| 5     | Invalid dispenser                                                                                  | `null`           | 400         |
| 6     | This account is not authorised to use this method                                                  | `null`           | 403         |
| 7     | Opening time service not responding                                                                | `null`           | 500         |
| 8     | Dispenser search service not responding                                                            | `null`           | 500         |
| 9     | Opening time service returned error - {error}                                                      | `null`           | 500         |
| 10    | Dispenser search service returned error - {error}                                                  | `null`           | 500         |
| 11    | Authentication is required to access this resource                                                 | `null`           | 403         |
| 12    | Authentication invalid                                                                             | `null`           | 403         |
| 13    | Service is down for maintenance                                                                    | `null`           | 501         |
| 14    | Too many search results                                                                            | `null`           | 500         |
| 15    | No matching dispenser                                                                              | `null`           | 500         |


### Examples ###

```
TODO
````

