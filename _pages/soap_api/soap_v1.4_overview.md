---
title: SOAP API version 1.4- Overview
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_v1.4_overview.html
summary: A summary of the new features in DoS SOAP API version 1.4
published: true
---


# Overview of Web Service v1.4

This section details the changes that have been introduced in web service v1.4, and therefore how it differs from v1.3. New functionality included in this release has been added to the CheckCapacitySummary endpoint, and the other endpoints – ServiceDetailsbyID and GetHospitalScores – are unchanged.

## Summary

* Web service version 1.4 has a new WSDL

### Search Date and Time
New functionality has been introduced which allows a search date/time to be passed in to the CheckCapacitySummary request. When this is passed in, the search is conducted using that date and time instead of the current date and time, allowing scenario testing for dates in the future to take place.

* The date/time field which is passed in to the request is:
   * searchDateTime – the date and time of the search
* The date/time fields which are included in the response are:
   * RequestedAtDateTime – the date and time the request was made
   * SearchDateTime – the date and time of the search

This new field is subject to the following validation:
* If the search date/time field is null or missing, the current date and time is used in the search
* If the search date/time field is used and the value is different from the current date/time, for audit logging purposes this is treated as a test case and not a live patient request
* If the field is populated but has an incorrect format, an error message is returned
   * The accepted format uses ISO8601 standard. Example: 2018-08-01T09:05:00. Searching using different timezones is not currently supported
* If a date/time more than 12 months in the future (from the current date/time) is used, an error is returned
* If a date/time more than 60 seconds in the past is used, an error is returned

### Public Name Field
A new field has been added to the DoS service record to enable services to be profiled with a name other than the standard service name, known as Public Name. This is a non-mandatory field with a 75 character limit and is not populated by default.

This field is now included in the CheckCapacitySummary response, with the tag ‘publicName’.

Where services wish to use this field, it is expected that there will be provision to use the Service Name if the Public Name is not populated.

### Current Wait Times
The CheckCapacitySummary response includes a placeholder array to allow for the inclusion of waiting times in the future. Initially this will always be returned with null values.

_Note:_ The format of these fields will change in web service version 1.5, so we do not advise using these fields in this version

These fields, grouped with the tag ‘waitTimes’, are:
* currentWaitTime
* patientsInDepartment
* patientsBeingSeen
* notes
