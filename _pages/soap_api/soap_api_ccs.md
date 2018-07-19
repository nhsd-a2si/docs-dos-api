---
title: SOAP API - CheckCapacitySummary v1.3
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_api_ccs.html
summary: Details about the CheckCapacitySummary SOAP method
published: true
---

## Overview

CheckCapacitySummary allows a consumer to perform a fully-ranked (curated) search to find services that can provide appropriate care to meet a patient's clinical need

| Type    |   Description                                                                                                          |
|---------|------------------------------------------------------------------------------------------------------------------------|
| Request | A non-identifiable representation of a 'clinical case'                                                                 |
| Response | A curated, ordered set of service results (valid requests should always return some results - see "Catch All Results") |

## Search Logic

When a consumer posts a CheckCapacitySummary request, there is a fairly complex set of logic steps that are performed before a results set it returned.

These steps can be thought of as a 'filter pipeline', with each step of the pipeline taking a broad results set and returning a more narrow results set. The pipeline process is largely transparent to the API consumer.

There are several different types of filters that are applied:

* Basic permissions - validate the XML, the account permissions and some initial parameters
* Service attribute filters - discount a large number of services based on distance, symptom group (SG), gender and GP surgery
* Fine filter - filter remaining services based on the other parameters and begin Gap processing
* Calculate display order - determine the order in which services return, based on ranking and other rules
