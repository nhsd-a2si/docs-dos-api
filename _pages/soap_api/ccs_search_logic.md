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
The DoS database holds a table of postcodes, each stored against a search distance, in kilometres. These may be full or partial postcodes, using either the postcode sector or district. This provides the flexibility to specify search distances against small or larger areas.
This overrides the ability that some provider systems have to pass a distance in to the request. Passing in a distance is still permitted, but it will be used only if there is no stored value in the database for that postcode.

Current default value: 60 kilometres

This distance field in the request is validated against the following rules:
* This is an optional field
* Distances are in kilometres
* Must be a number between 1 and 99 (any other value will return an error only where it has not been overridden by a value in the database)

The search distance to be used is calculated in the following order:
1. The distance listed in the table where there is an exact match to the full Postcode

Where there is no match, then;

2. The distance listed in the table where there is an exact match to the postcode Sector

Where there is no match, then;

3. The distance listed in the table where there is an exact match to the postcode District

Where there is no match, then;

4. The search distance value entered in search request

Where a distance is not passed in, then;

5. Use the National default value


### Validate Postcode
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

## First Search Pipeline ##
Once the initial validations and checks are complete, the first search can begin. The aim of this filter is to quickly reduce the number of potential returns. No record is kept of which services are eliminated at this point.

### Check Service Status
There are multiple statuses for a service in the DoS, however only those which are Active will be returned in a Check Capacity Summary search.

### Check Distance
Any services whose northings/eastings values do not fall within the search box will be discarded.

### Match Symptom Group (SG)
Any service that is not profiled with the SG that is passed in will be discarded. The following rules are in place:
*	The value must be correctly formatted
There are a couple of points to note:
*	The SG value is not mandatory in the web service request, so a null or missing value will not error, however this will fail to match any services and will trigger a catch-all search
*	The SG value is not validated against a list of available values, so if a value that does not exist is used, it will not error, however this will fail to match any services and will trigger a catch-all search

### Match Gender
Gender is matched using the following rules:
Default value: I (Indeterminate)
*	The gender must be a valid value – an invalid value will return an error
*	If the field is null or missing, the default value will be used
*	Services with no gender profiled will not be matched and will therefore not return

### Match GP Surgery
Services can be profiled to show that they are commissioned by a specific GP or group of GPs, and if they are marked as restricted, they will only return if the patient is registered with one of the listed GP practices. This is often referred to a as a ‘service referral’ and is described in more detail in the profiling tips section below.
The ODS code of the patient’s GP surgery can optionally be included in the request and this is matched using the following rules:
*	If the service is marked as Restricted, if the ODS code is null or missing, the service will not match and will not return
*	If the service is marked as Restricted, if the ODS code in the request is not on the service referral list for the service, it will not match and will not return
*	If the service is marked as Unrestricted, or has no service referrals, it will be treated as a match

## Second Search Pipeline ##

All services which remain as potential candidates for return following the first search pipeline now go through a second filter, to determine a final list of matching services which could be returned. Any services which fail to match on only one of the criteria listed below will be classed as ‘Gap’ services. Gap results are described separately.

### Check Capacity Status
Capacity Status is a RAG (Red, Amber, Green) rating of how busy the service is. If this is changed to anything other than green, it is automatically reset to green after a length of time specified by the logged-in user when the status is changed. The automatic reset time is any period between fifteen minutes and twenty-four hours, in fifteen minute increments. The service may be manually reset to green at any time.

Services are filtered on capacity using the following rule:
*	Capacity status must be Green or Amber – services with  a Red capacity status are not returned

### Match Symptom Discriminator (SD)
Symptom Discriminators are stored in the DoS separately but each is linked to one or more Symptom Groups and they can only be added to a service profile as a valid combination. Symptom Groups and Discriminators, and their combinations, are determined by the Pathways system.
Symptom Discriminators are matched using the following rules:
*	A null value is not accepted and will return an error
*	The value must be correctly formatted, and incorrect formatting will return an error
*	Multiple SDs are accepted but any duplicates which are requested will be removed
*	SDs which are not a valid combination with the SG provided will be removed
Services which are not profiled with one or more of the remaining SDs will not be returned.

### Match Disposition (DX)
Dispositions are also determined by the Pathways system and are stored in the DoS as Dispositions (each of which is given a Dx code) and Disposition Groups. Usually this is a one to one relationship and the group has the same description as the disposition, and it is these which are used in the Check Capacity Search, but when searching through the UI (Clinical Search) it is possible to select a group which is linked to multiple Dispositions and therefore match against multiple dispositions at once.
A timeframe (in minutes) is stored against each disposition group, and this determines the opening time calculation for the service (described in a later section).
It is the ID of the Disposition Group which is passed in and matched against the service, using the following rules:
*	A null value is accepted – if a null value is used this parameter is ignored and matches all services
*	The value, if used, must be correctly formatted, and incorrect formatting will return an error

### Match Referral Role
Each user account is assigned one Referral Role (also known as Search Role), which provides a broad indication of the type of user that they are – for example, there are different referral roles for 111 providers, healthcare professionals and apps which provide advice directly to members of the public.
Services may be profiled with one or more Referral Roles, which indicate which type of user is able to refer to that service.
If the service is not profiled with a matching Referral Role to that of the authenticated user, or is not profiled with any referral roles, the service will not return.

### Check Age Format and Match on Age
It should be noted that age profiling of services on the DoS has been changed, so that where services have previously been profiled with one or more age groups, it is now possible to profile services with one or more age ranges, which provides a more flexible method of declaring which ages a service can cater for. The web service has not yet been updated and still searches using age groups, as described here. The DoS converts the age ranges stored against the service profiles into groups, until such a time as the web service is changed.
The patient’s age can be entered either as one of the recognised age groups or as an actual age in years, and therefore both an Age Format field and an Age field are used in the request. These are matched using the following rules:
*	If a Null value is entered for the Age Format field, the parameter is ignored and will match all services
*	Age Format, if used, must contain a valid value. If the value is invalid an error will be returned
Where the format used is Age Group, the following rules apply to the Age element:
*	If the Age format is invalid, an error is returned. Valid age groups are:
    *	4: Neonate and Infant - 0 years
    *	3: Toddler - 1-4 years
    *	2: Child - 5-15 years
    * 1: Adult - 16+ (includes ages 16-129)
    *	8: Older People - 65+ (includes ages 65-129)
*	If an age group is used in the Age element that is valid format but doesn't exist (e.g. 5), no services will match and the catch-all will be returned
*	If the Age element is null or missing, no services will match and the catch-all will be returned
Where the format used is Years, the following rules apply to the Age element:
*	When entering an age the upper limit is 129
*	If the Age format is invalid or above the upper limit, the Age element is ignored and all services are matched
*	If the Age element is null or missing, age is ignored and all services are matched
*	If the Age Format is Years, the age will be converted to an Age Group

### Match Session Times
The current time (time of search) is used to calculate which services will be open within the required timeframe and discards all services which will not. This is a complex calculation which ensures that the service is not closing within half an hour of the current time to allow the patient time to attend and, for longer disposition timeframes, ensures that the service is open before the last hour of the disposition. The system calculates a ‘session time’ within these rules and a service will only return if it is open at some point within the calculated session time.

The rules are as follows:
*	The disposition timeframe is taken from the disposition group and is in minutes
*	The session end time is dependent on the disposition: 
    *	0 mins (immediately) = Time of search + 60 mins
    *	>0 & <= 30 mins = Time of search + 30 mins
    *	31 – 60 mins = Time of search + Disposition
    *	> 60 mins = Time of search + Disposition – 60 mins
    *	NULL = treated as 0 and therefore Time of search + 60 mins
*	The service must be open within the calculated session time (i.e. between the start and end time parameters that have been calculated according to the rules) – there is no minimum timeframe. E.g. if the calculated session time window starts at 9:30 and the service closes at 9:30, this is a valid service
*	The service must not be closing within 30 minutes of the search time

### Check for Services that Should Only Return If Open
Some services will be marked to only return from a search if they are either open at the time of the search or are due to open within a specified timeframe (either 15 or 30 minutes) of the search time.

### Check for Limited Services
Services may be limited to one or more CCGs. These services will only return if they are limited to the CCG of the search location.

## Gap Results
If any services that go through the second search pipeline fail to match on only one criterion, they are recorded as having 'gapped' and can be analysed by commissioners.

