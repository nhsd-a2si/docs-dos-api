---
title: Search by Service ID
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: byServiceId.html
summary: Description of byServiceId endpoint
---

# Description
This method retrieves services which match the service ID entered, and returns a larger dataset than the clinical and service type search methods, allowing users to access additional information about the service. This is a unique field and each request will therefore return a maximum of one result.

# Request

| Parameter      | Type       | Required? | 
|----------------|------------|-----------|
| serviceId      | Integer     | Yes       |


# Search Rules

| Parameter       | Rule                                                                                                 |
|-----------------|------------------------------------------------------------------------------------------------------|
| Username        | Only services where the Referral Role matches the Search Role of the authenticated user are returned |
|                 | Only Active services are returned |
| ODS Code        | Only the service with a matching Service ID is returned |
| Capacity Status | Capacity ‘RAG’ status is only returned if the value has been updated within the last 24 hours |


# Response

All responses should state:
* Status
* Code
* Transaction ID
* Catch all (True/False)
* Service Count

*Note: Even though the term ‘catch-all’ is used here, this does not make use of the Check Capacity Summary catch-all rule, where the nearest two EDs are returned if one or fewer matching services are found. Where at least one service is returned from the search, this will be False, and True where no services are returned*

Where matching services are returned, the following data items should be included:
* Service ID
* Service Name
* Service Type
  * ID
  *	Name
* ODS Code
* isNational (True/False)
* Created
  * Date
  * Time
  * By
* Address
* Town
* Postcode
* Easting
* Northing
* Phone
  * Public
  * Non-public
  * Fax
* Email
* Website
* Opening Times
  * Open all hours (True/False)
  * Day
    * Session
        * Start
           * Hours
           * Minutes
  * Specified Dates
* Referral Instructions 
   * Public Information (labelled ‘callHandler’)
   * Referral Information (labelled ‘other’)
* Capacity Status
  * Rag
  * Human
  * Hex
  * Updated
    * Date
    * Time
    * By
* Symptom Groups
  * ID
  * Name
  * Symptom Discriminators
    * ID
    * Name
* Dispositions
  * ID
  * Name
* Service Referrals
  * Restricted (True/False)
  * Services
    * ID
    * Name
* Genders
  * ID
  * Name
* Endpoints
* Service public name
* Professional referral information
    

## Note about repsonse fields

## Email

This is the email address of the service and is intended for use by clinicians and not for sharing with the public.

## Opening times

You may receive multiple types of opening time, and these should be treated in a priority order.

### Specified Opening Times

These allow services to register exceptions to their usual hours and should override any other sessions that are returned, including the Open All Hours flag.

### Open All Hours

If the flag is set to Open All Hours = True and there are no specified times for the given date, then the service should be treated as open 24 hours a day, 7 days a week. There should not be any standard opening times for these services but if there are, they should be ignored.

### Public Holidays

Services can be profiled with a set of times or can be set to closed for all public holidays (exceptions are recorded as a specified time). If the given day is a public holiday, then this should override the standard opening times for that day.

### Standard Opening Times

These are the days and times that the service is open when none of the above apply. A service may have multiple session times for any given day, and these cannot overlap. 

Session times cannot extend beyond midnight for a given day, so a service which is open over night will display as open until 23:59 on one day and will re-open at 00:00 the following day.

## Referral Information

Additional information about the service is provided in two separate fields. the instructions labelled 'callHandler' are intended to provide information about the service to members of the public. The field labelled 'other' is intended for use by clinicians and care should be taken when displaying this, as it may contain non-public information such as contact methods.

## Telephone Numbers

Both public and non-public telephone numbers are included in the response. The non-public telephone numbers must not be displayed where the person using the application is not a clinician.
## Capacity Status

The default capacity for services is Green (High) but this may be changed to Amber (Low) or Red (None) for a set period of time, up to 5 days. Services which have a Red status will return but care should be taken when deciding whether or not to display these, as they have reported that they have little or no capacity to accept new patients, or may be temporarily closed. 

## Public name  
  
An alternative name for the service that would be better known to the public, and may differ from the registered name.
  
## Professional referral information
  
Additional referral information.