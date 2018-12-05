---
title: REST API Overview
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: rest_api_overview.html
summary: An overview of the DoS REST API
---

## The REST API ##

*Also sometimes referred to as **Proof of Concept API***

The REST API was created to enable approved third party developers to gain access to DoS data. A valid DoS account is required.

## Web Methods ##

| Method  | Description                                                                |
|---------|----------------------------------------------------------------------------|
| byClinicalTerm | Enter clinical terms and location information and return matching services, ordered by distance  | 
| byServiceType | Enter DoS service types and location information and return matching services, ordered by distance |
| byODSCode | Enter an ODS code and return details of the matching service |
| byServiceId |  Enter a DoS Service ID and return details of the matching service  |

## Endpoint ##

The REST API endpoint is: https://XXX.pathwaysdos.nhs.uk/app/controllers/api/v1.0/ where XXX refers to the instance that you are attempting to connect to.
