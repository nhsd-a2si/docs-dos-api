---
title: Search by ODS Code
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: byODSCode.html
summary: Description of byODSCode endpoint
---

# Description
This method retrieves services which match the ODS code entered, and returns a larger dataset than the clinical and service type search methods, allowing users to access additional information about the service.

It should be noted that the ODS code should be a unique value and therefore should only return one service, however there are a small number of instances where services that have been duplicated may have the same ODS code. In these circumstances, all services matching the ODS code provided will be returned.

# Request

| Parameter      | Type       | Required? | 
|----------------|------------|-----------|
| odsCode        | String     | Yes       |


# Search Rules

| Parameter       | Rule                                                                                                 |
|-----------------|------------------------------------------------------------------------------------------------------|
| Username        | Only services where the Referral Role matches the Search Role of the authenticated user are returned |
|                 | Only Active services are returned |
| ODS Code        | All active services with a matching ODS code are returned |
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
