---
title: SOAP API - CheckCapacitySummary
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_api_ccs.html
summary: Details about the CheckCapacitySummary SOAP method
published: true
---

## Overview

CheckCapacitySummary allows a consumer to perform a fully-ranked (curated) search to find services that can provide appropriate care to meet a patient's clinical need

| Request | A non-identifiable representation of a 'clinical case' |
| Returns | A curated, ordered set of service results (valid requests should always return some results - see "Catch All Results") |

## Search Logic

When a consumer posts a CheckCapacitySummary request, there is a fairly complex set of logic steps that are performed before a results set it returned.

These steps can be thought of as a 'filter pipeline', with each step of the pipeline taking a broad results set and returning a more narrow results set. The pipeline process is largely transparent to the API consumer.

There are several different types of filters that are applied:

* Basic permissions - e.g. what does your API account allow you to search for
* Service attribute filters - e.g. remove results which do not match the required attributes of the search
* Ranking filters - e.g. which services should be returned as a priority over other services
