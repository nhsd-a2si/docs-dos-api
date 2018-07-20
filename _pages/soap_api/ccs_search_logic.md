---
title: Check Capacity Summary Search Logic
keywords: develop, validation, rules
tags: [testing,integration,deployment, logic, rules, validate]
sidebar: overview_sidebar
permalink: ccs_logic.html
summary: Search logic for the CheckCapacitySummary SOAP method
published: true
---


## Overview ##

The search is split into several sections, each of which filter out more services until a set of valid results remain. These results are then grouped and ordered according to a set of rules.

## Initial Request Validation ##

The first set of filters check the xml and the user credentials, as well as ensuring that some of the parameters passed in are valid. This section describes those checks.

### Validate XML
The XML is validated to ensure that it is well-formed and an error is returned if not. Incorrect or additional elements are ignored.

### Authenticate User
The account is authenticated using the username and password included in the request. This is validated against the following rules:
* The username must be that of an active DoS user account
* The password matches that of the user
* The user has the correct permission (webService) applied to their account 
Failure to comply with any or all of these rules returns an error.

### Validate API version
* If the field is null or missing, the default value will be used
* If the value passed in is not a valid, supported API version, an error will be returned

### Validate Search Distance
This is an optional field which, if populated, will overide the default distance.
This field is validated against the following rules:
Current default value: 60
* This is an optional field and if it is null or missing, the default value is used
* Distances are in kilometres
* Must be a number between 1 and 99

Validate Postcode
The postcode is used to ensure that services returned are within an appropriate travelling distance for the patient and to calculate the distance from patient values which are included in the return (displayed in miles). Therefore this is a mandatory value and must be a valid postcode.
Postcodes are validated using the following rules:
* A null value or missing element is not accepted
* The postcode must be valid (i.e. exist in the DoS database – see note below)
Failure to comply with any or all of these rules returns an error.

*What is a valid postcode in the DoS?*
The Locations table in the DoS holds a single version of each UK postcode and a northings and eastings value for that postcode. These postcodes are used to add addresses to services in the Dos and to validate searches, and the northings/eastings values are used to calculate distances.
Postcodes are updated regularly from Ordnance Survey AddressBase files. Postcodes which have ended and are no longer in use are not removed from this table, although those which ended many years ago are not included. New postcodes are added when they are available in the AddressBase files, although due to processes which must be followed to produce these files, there are instances where new postcodes are active and in use but not yet included. In these instances, if the postcode is reported to DoS administrators it can be validated and manually added to the Locations table.

### Calculate Search Box (Distance)
In order to determine which services fall within the required search distance, the northings/eastings of the postcode is used as the centre point from which to calculate which services fall within the range. A maximum northings and eastings value is calculated using either the distance passed in the request or the default value and any services whose postcode has a northings and/or eastings value above this is ignored.
Although the term ‘search radius’ is frequently used, distances are calculated as a square and, as such, where a service is towards the corner of the square, it could be further away than the specified distance (e.g. the corners of a 60km square could be up to 85km away).
The search box is calculated using the following rules:
* The postcode provided (search postcode) is the centre of the search box
* Distance calculation is a straight line between the search postcode and that of the service, in kilometres
* The distance between the centre of the search box and the centre of each side is  equal to the search distance provided, or the default if none is provided
* The straight line value between the postcode provided and the service is converted in to miles and returned as the distance from patient value

