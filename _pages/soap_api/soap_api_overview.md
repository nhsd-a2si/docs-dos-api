---
title: SOAP API - Overview
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_api_overview.html
summary: An overview of the DoS SOAP API
published: true
---

## The SOAP API ##

*Also sometimes referred to as **CheckCapacitySummary***

The SOAP API is the primary API used by NHS 111 services. It provides consumers with a curated search function, and access to technical endpoint information for services to aid with transfer of care for patients.

## API Use Case ##

## WSDL Documentation ##

You can view some WSDL-generated documentation for the SOAP API here: [Web Service v1.3 WSDL Documentation](/soap_v1-3/){:target="_blank"}


## Web Methods

The SOAP API provides the following methods:

| Method               | Description                                                                             |
|----------------------|-----------------------------------------------------------------------------------------|
| [CheckCapacitySummary](/soap_api_ccs.html) | Perform a fully-ranked (curated) clinical search to find services appropriate for a clinical need |
| [ServiceDetailsById](/soap_api_sdbid.html)   | Retrieve technical endpoint details for a specific Service ID or ODS code               |

The path to the SOAP API is: **https://???.pathwaysdos.nhs.uk/app/api/webservices** where **???** is replaced with the subdomain relating to the [environment](/environments_overview.html) you are targeting.

You can grab the latest version (v1.3) of the WSDL from here: [https://www.pathwaysdos.nhs.uk/app/api/webservices?wsdl=1.3](https://www.pathwaysdos.nhs.uk/app/api/webservices?wsdl=1.3){:target="_blank"}



### [CheckCapacitySummary](/soap_api_ccs.html)

| Request | A non-identifiable representation of a 'clinical case' |
| Returns | A curated, ordered set of service results (valid requests will always return some results - see "Catch All Results") |


### [ServiceDetailsById](/soap_api_sdbid.html)

| Request | A service identifier - either ServiceId or OdsCode |
| Returns | A list of technical endpoint details (0 or more) |
