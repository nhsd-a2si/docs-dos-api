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

The SOAP API is the primary API used by NHS 111 services. It provides consumers with a curated search function, and access to technical endpoint information for services to aid with transfer of care for patients.

{% include note.html content="The SOAP API is sometimes referred to as **CheckCapacitySummary**, which is actually one of the web methods available." %}

{% include warning.html content="Support for version 1.3 of the SOAP API has ended. All users must now use version 1.5. Access to versions 1.3 and 1.4 will soon be removed" %}

## API Use Case ##

The SOAP API supports the following high-level use cases:

* Find an appropriate list of services for a specific clinical need

* Get technical endpoint information for a given service

* Obtain capacity information for specified hospitals or wards

## API Versions ##

To allow for the release of new features there may be more than one supported version of the API available. Following the release of a new API, consumers are given time to make any required changes before moving to the new version. It is possible to use different versions by passing in the required version number in the request. Where no version number is passed in, the default version is used.

**Current Supported Versions**

v1.5


**Default Version**

v1.5 (from mid-June 2020)


## WSDL Documentation ##

You can view some WSDL-generated documentation for the SOAP API here: [Web Service v1.3 WSDL Documentation](/soap_v1-3/){:target="_blank"}


## Web Methods

The SOAP API provides the following methods:

| Method               | Description                                                                             |
|----------------------|-----------------------------------------------------------------------------------------|
| [CheckCapacitySummary](/soap_api_ccs.html) | Perform a fully-ranked (curated) clinical search to find services appropriate for a clinical need |
| [ServiceDetailsById](/soap_api_sdbid.html)   | Retrieve technical endpoint details for a specific Service ID or ODS code               |
| GetHospitalScores  | Retrieve capacity data for a specific set of hospitals | 

The path to the SOAP API is: **https://webservice.directoryofservices.nhs.uk/app/api/webservices** where **webservice** is replaced with a subdomain specific to the [environment](/environments_overview.html) you are targeting.

You can grab the latest version (v1.3) of the WSDL from here: [https://www.directoryofservices.nhs.uk/app/api/webservices?wsdl=1.3](https://www.pathwaysdos.nhs.uk/app/api/webservices?wsdl=1.3){:target="_blank"}


### [CheckCapacitySummary](/soap_api_ccs.html)

| Type    | Description                                                                                                          |
|---------|----------------------------------------------------------------------------------------------------------------------|
| Request | A non-identifiable representation of a 'clinical case' |
| Response | A curated, ordered set of service results (valid requests will always return some results - see "Catch All Results") |


### [ServiceDetailsById](/soap_api_sdbid.html)
 
| Type    | Description                                                                                                          |
|---------|----------------------------------------------------------------------------------------------------------------------|
| Request | A service identifier - either ServiceId or OdsCode |
| Response | A list of technical endpoint details (0 or more) |


### GetHospitalScores

| Type    | Description                                                                                                          |
|---------|----------------------------------------------------------------------------------------------------------------------|
| Request | Username and password - no search parameters required |
| Response | ODS code and Overall Pressure Score (only services profiled with a Beds or ED capacity grid) |
