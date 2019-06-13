---
title: SOAP API version 1.5 – Summary of Changes
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_v1.5_changesummary.html
summary: A summary of the new features in DoS SOAP API version 1.5
published: true
---

# Summary of Web Service v1.5 Changes

This section details the changes that have been introduced in web service v1.5, and therefore how it differs from v1.4. If you are currently using v1.3, you may also need to refer to the v1.4 overview – subsequent pages will detail the entire functionality and will not expect you to have prior understanding of previous versions.

New functionality included in this release has been added to the CheckCapacitySummary endpoint and the ServiceDetailsbyID endpoint. GetHospitalScores remains unchanged.

* Web service version 1.5 has a new WSDL, available here (https://uat.pathwaysdos.nhs.uk/app/api/webservices?wsdl=1.5)
* API version 1.5 is available in our UAT environment. Until this version is formally released, all new fields are available but not all are fully functional currently, and some have not been assured. 

## New Features – CheckCapacitySummary Request

### Age Functionality

Version 1.5 of the CheckCapacitySummary search will allow a more granular search, using the actual age of the patient, in days, months or years, rather than using a fixed age group. The Check Capacity Summary request has been updated to accommodate this.

The AgeFormat field will remain in place but will allow entry of two new formats – Months and Days – in addition to the existing Years and Groups.

The Age field will remain in place, and allow a number between 0 - 129, but additional validation will ensure that only valid numbers are entered according to the age format used.

Years may be used where the patient aged between 2 and 129 years.

Months may be used where the patient is less than two years old, the upper limit being 23 months (to include the day before the patient’s second birthday), and the lower limit being 1 month. Where the patient is two or older, then Years must be used. Where the patient is less than 1 month, then Days must be used.

Days may only be used where the patient is less than one month old, the upper limit being 31 days. Where the patient is deemed to be one month or more (which could occur before the 31 day upper limit), then months should be used.

If a Months or Years format is used, this will be converted to a number of days where:
daysinmonth = 30.4375
daysinyear = 365.25
These are then rounded down to a whole number

The calculated value in days will be returned in the response. 

It should be noted that sending an age group will still be allowed under version 1.5 but will be discouraged unless the exact age of the patient cannot be determined, as the results may not accurately reflect the age ranges that the service has been profiled for.

Additional validation ensures that both the AgeFormat and the Age fields are mandatory.

### Distance Override
Currently the search will only use the distance passed in the request if there is no distance in the DoS postcode file which matches the postcode used.

An override option will prioritise the distance in the web service over that stored in the DoS. This function should be used with caution, and primarily for testing purposes, as the postcode files in the DoS have been carefully profiled by DoS Leads.

### Additional Validation on Input Fields
Currently if an SG is passed in which passes the formatting rules but does not exist in the DoS database, the request is accepted but the search will fail to match on any services and will invoke a catch-all response. Additional validation will be added to ensure that only SG codes which are known to the DoS can be searched, and an error will be returned if this is not the case.

Currently if a disposition is passed in which passes the formatting rules but does not exist in the DoS database, the request is accepted and the search will not match against dispositions. Additional validation will be added to ensure that only disposition codes which are known to the DoS can be searched, and an error will be returned if this is not the case.

### Changes To Existing Error Codes
Some error codes are not currently unique; the affected codes will be re-numbered so that the error can be more easily identified by the code alone. Initially this only affects error 106 - invalid age format supplied, but this page will be updated as more changes are made. More detail on web service errors can be found in the 'Error Codes' page.

## New Features - CheckCapacitySummary Response

### Current Wait Times
The CheckCapacitySummary response includes a placeholder array to allow for the inclusion of waiting times in the future. This will be included in the response once for each service that is returned. Initially this will always be returned with null values.

These fields, grouped with the tag ‘capacityAttributes’, are:
* Name
* Description
* Value

This provides the flexibility for additional capacity metrics to be added in the future, without changing the web service. The names currently planned for are:
* CurrentWaitTime
* PatientsInDepartment
* PatientsBeingSeen
* Notes

### Service Attributes

The DoS is being changed to enable certain attributes to be stored against individual service records. These attributes will vary in number and may differ according to the service type.

The CheckCapacitySummary response includes a placeholder array to allow for the inclusion of service attributes as they are developed. This will be included in the response once for each service that is returned.  Initially this will always be returned with null values.

These fields, grouped with the tag ‘attributes’, are:
* name
* description
* value
* dataType

### Service Endpoints

The CheckCapacitySummary response includes the service endpoints for each service that is returned. This data is currently only available via the ServiceDetailsById web service endpoint, but will now be included, in a slightly different format, in CheckCapacitySummary responses. 

The fields, grouped with the tag ‘serviceEndPoints', are:
* order
* transport
* format
* interaction
* businessScenario
* address
* compression
* comment

Additional transport methods to support direct booking are included in v1.5 responses. These responses use the same fields as all other endpoints, although the order may not be required for this type.


### Search Distance and Source
DoS version 4.12 introduced the ability for DoS Leads to specify the optimum search distance for each postcode area. This means that the distance passed in the CheckCapacitySummary request may not be used. 

The response now includes the actual distance that was used in the search, together with the source used to obtain the distance.
The sources are:
* Postcode
* District
* Sector
* Webservice
* National

### Service Age Ranges
For each service that is returned in the CheckCapacitySummary response, the age ranges profiled for each returned service are included.

The fields, grouped with the tag ‘serviceAgeRange’, are:
* Age From
* Age To

## New Features – ServiceDetailsByID Response

This endpoint continues to return the same data as previously – the service endpoint data for a given Service ID – it will be formatted differently.

The fields, grouped with the tag ‘contactDetails', are:
* order
* transport
* format
* interaction
* businessScenario
* address
* compression
* comment

It should be noted that additional transport methods may soon be added to the endpoints functionality in the DoS, and these will be included in this version of the web service as they are developed.
