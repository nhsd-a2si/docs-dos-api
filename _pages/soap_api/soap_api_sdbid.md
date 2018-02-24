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

| Request | A service identifier - either ServiceId or OdsCode |
| Returns | A list of technical endpoint details (0 or more) |

## Search Logic

When a consumer posts a CheckCapacitySummary request, there is a fairly complex set of logic steps that are performed before a results set it returned.

These steps can be thought of as a 'filter pipeline', with each step of the pipeline taking a broad results set and returning a more narrow results set. The pipeline process is largely transparent to the API consumer.

There are several different types of filters that are applied:

* Basic permissions - e.g. what does your API account allow you to search for
* Service attribute filters - e.g. remove results which do not match the required attributes of the search
* Ranking filters - e.g. which services should be returned as a priority over other services
