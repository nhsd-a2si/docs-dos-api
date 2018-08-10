---
title: SOAP API - ServiceDetailsById
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_api_sdbid.html
summary: Details about the ServiceDetailsById SOAP method
published: true
---

## Overview

ServiceDetailsById allows a consumer to retrieve a list of 0 or more technical endpoint records for a given service.

|**Type**| **Description**                                    |
|--------|----------------------------------------------------|
|Request | A service identifier - either ServiceId or OdsCode |
|Returns | A list of technical endpoint details (0 or more) |

Once the required service ID is known, usually following a Check Capacity Summary response, this service can be called to obtain the endpoint details for the given service

## Request

| **Field Name**    | **Required?**    | **Type**   | **Default Value** | **Description**   |
|-----------------|----------------|----------|-----------------|-----------------|
|username  |  Yes	           |string	  | N/A            | DoS account user name |
|password | Yes | string | N/A | DoS password |
| serviceId | Yes | int | N/A | DoS ID or ODS code for the required service |


## Response

| **Field Name**  | **Type**    | **Description**  |
|---------------|-----------|------------------------------------------------|
|tag |	string	  | type of address - ITK, email, phone  |
|name | string |   |
|address | string | endpoint address |
|order | int | the order in which the addresses should be used, if more than one is provided |
