---
title: Search by Clinical Term
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: byClinicalTerm.html
summary: Description of byClinicalTerm endpoint
---

# Description
AKA Symptom Search

This search method allows users to search the DoS based on symptoms, location and optional patient details, and returns a set of data about matching services. It returns up to the number of results specified per service type and ordered by distance, closest first.

# Request

| Parameter        | Type           | Required?   | Description       |
|------------------|----------------|-------------|-------------------|
| caseId           | String         | No          |                   |
| postcode         | String         | Yes         |                   |
| searchDistance   | Integer        | No          | Distance in miles, to a maximum of 100. If not entered, default value of 37.5 is used |
| gpPracticeId     | Integer        | No          | DoS service ID of patient's GP Practice  |
| age              | Integer        | No          | DoS age group of patient       |
| gender           | String         | No          | Gender of patient, M,F,I  |
| disposition      | String         | No          | Not currently used - if a value is passed in, this will be ignored   |
| symptomGroupDiscriminatorCombos   | Array          | Yes         | DoS SGSD IDs - format SGID=SDID. Only one combination per search request |
| numberPerType    | Integer        | No          | Maximum number of services to return, per service type searched |

It should be noted that where a field is marked above as not required, it should still be included in the search string, represented with a zero (0).

URL format:
.../app/controllers/api/v1.0/services/byClinicalTerm/{caseId}/{postcode}/{searchDistance}/{gpPracticeId}/{age}/{gender}/{disposition}/{symptomGroupDiscriminatorCombos}/{numberPerType}

## Age Group Definition
ID 4: Neonate and Infant - 0 years

ID 3: Toddler - 1-4 years

ID 2: Child - 5-15 years

ID 1: Adult - 16+ (includes ages 16-129)

ID 8: Older People - 65+ (includes ages 65-129)

## Gender Definition

M - Male

F - Female

I - Indeterminate


# Request Validation Rules

| Parameter	           | Rule       	| Error Message           |
|----------------------|--------------|-------------------------|
|Search Distance       |	Max 100     |	Bad Request: Search distance must be no more than 100 |
| Search Distance      |	Must be a number	| Bad Request: Search distance must be numeric |
| Postcode             |	Postcode must be in the DoS postcode lookup table |	Bad Request: Invalid post code |
| Postcode             |	Postcode cannot be Null	 | Bad Request: Postcode must be provided |
| Age                  |  Must be a valid Age Group ID | Bad Request: The age group ID must be one of the following: 1, 2, 3, 4, 8 |
| Gender               |  Must be a valid Gender ID |  Bad Request: The gender must be one of the following: M, F, I (case sensitive) |
| GP Practice ID       |	Must be a valid service ID |	Bad Request: The supplied service ID of the patient's practice does not exist in the system |
| symptomGroupDiscriminatorCombos   | Must contain a valid combination of SG/SD IDs  | Bad Request: Invalid \"SymptomGroupId=SymptomDiscriminatorId\" combination supplied  |


# Search Rules

| Parameter         |	Rule                    |
|-------------------|-------------------------|
| Username          |	Only services where the Referral Role matches the Search Role of the authenticated user are returned |
|                   |	Only Active services are returned |
| Search Distance   |	Use this value to calculate the search box, with the postcode passed in at the centre - only services within this box are returned. If Null or Zero, default value is used: 37.5 miles |
| Postcode          |	Postcode is used to calculate the search distance, and the distance (in miles) between the postcode and each service is included in response |
| Postcode          | If no postcode is passed in, an error will not be returned but no services will match |
| Age               | Only services matching the age group provided are returned in the response. Where null, Age Group is ignored |
| Gender	          | Only services matching the gender code provided are returned in the response. Where null, Gender is ignored |
| GP Practice ID	  | Services which are restricted to patients of a specified GP practice will only return if the GP Practice ID passed in is on the Service Referrals list of the service |
|symptomGroupDiscriminatorCombos | If no SG/SD combination is passed in, or the format is incorrect, an error will not be returned but no services will match |
| Number per type	  | Where there are more results per Service Type than the Number per type value, only the closest services (by distance) up to the total number requested are returned. If passed in Null or zero, the default value is used: 5 |
|	   |  Capacity ‘RAG’ status is only returned if the value has been updated within the last 24 hours |


# Response

Results are presented in distance order, closest first, with the following exception:

Where the GP Practice ID passed in is included in the Service Referrals list of the returned service, this service is displayed first.

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
* Address
* Postcode
* Easting
* Northing
* Phone
  * Public
  * Non-public
  * Fax
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
* Endpoints
* Distance from patient

## Note about response fields

## Email

This is the email address of the service and is intended for use by clinicians and not for sharing with the public.

## Opening times

You may receive multiple types of opening time, and these should be treated in a priority order

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

Where a service capacity has not been updated for more than 24 hours, this is not returned.


## Distance from patient

This is a straight-line distance between the search postcode and that of the service, in miles.

