---
title: Check Capacity Summary Field Definition v1.4
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: ccs_fields_v1.4.html
published: true
---

# Check Capacity Summary Field Definition v1.4

## Request 
The following table details the parameters included in a Check Capacity Summary v1.4 request

| **Field Name**    | **Required?**    | **Type**   | **Default Value** | **Description**   |
|-----------------|----------------|----------|-----------------|-----------------|
|serviceVersion	  |  No	           |string	  | 1.3             | the web service version being requested, must be a valid value |
|username         |	Yes            |string    |	N/A	            | Must be an active DoS account |
|password	        | Yes            |string	  | N/A             |	Must match the password for the username |
|caseRef          |	No	           |string	  | N/A	            | Reference used by provider system – not used in search but included in audit logs and used for support purposes|
|caseId           |	No             |	string	| N/A	            | Reference used by provider system – not used in search but included in audit logs and used for support purposes |
|postcode         |	Yes            |	string  |	N/A	            | Must be a valid UK postcode |
|surgery          |	No	           |string    |	N/A	            | GP surgery ODS code |
|age	            |Yes             |	int     |	N/A             |	min 0, max 129 |
|ageFormat        |Yes             |	string	| N/A	            | Available values: Years, AgeGroup |
|disposition      |	No             |	int     |	N/A             |	Disposition ID |
|symptomGroup	    | Yes            |	int     |	N/A             |	Symptom Group ID |
|symptomDiscriminatorList |	Yes    |	Array: int	| N/A	        | Symptom Discriminator ID |
|searchDistance	| No	           | int	    | 60              |	kilometres, min 1, max 99 |
|gender         |	No             |	string	| I	              | Available values: M, F, I |
|SearchDateTime | No             | date/time | current date/time | Uses ISO8601 standard  |



## Response
The following table details the Check Capacity Summary v1.4 response 

| **Field Name**  | **Type**    | **Description / Corresponding DoS Field Label**  |
|---------------|-----------|------------------------------------------------|
|TransactionID  |	string	  | Used in audit logs and assists with support requests |
|RequestedAtDateTime | date/time | The time that the search request was received |
|SearchDateTime | date/time | The time used to calculate the search results |
|id             |	string	  | The unique ID of the service |
|capacity       |	string	  | The capacity status of the service: High = Green, Low = Amber, None = Red (will not return in Check Capacity Summary search) |
|name           |	string	 | Service Name |
|publicName     | string   | Public Name  |
| contactDetails |	string	| Public Phone Number |
| address	      | string	   | Service Address |
| postcode     |	string	  | Service Postcode |
| northings    |	int	      | Northings assigned to the service postcode (may not be the exact value for the service as one value is stored per postcode, not per individual property within a postcode) |
| eastings    |	int         |	Eastings assigned to the service postcode (may not be the exact value for the service as one value is stored per postcode, not per individual property within a postcode) |
| url	        | string      |	Service Website |
| serviceType: |      |           |
|          id | int   | ID of the service type assigned to the service |
|        name | string | 	Name of the service type assigned to the service |
| odsCode     |	string	| ODS code of the service (not validated against ODS records) |
|nonPublicTelephoneNo |	string	| Non-Public Phone |
|fax |	string	| Fax Number |
|referralText |	string |	Public Facing Information |
|distance |	string |	Distance from patient postcode (Straight-line distance between search postcode and service postcode, in miles) |
|notes |	string |	Referral Information (free text field intended for use by 111 Call Handlers and clinicians) |
|openAllHours |	Boolean |	True/False – if true, the service is open 24 hours a day, 7 days a week |
|waitTimes    |    |       |
|currentWaitTime, patientsInDepartment, patientsBeingSeen |  |To allow current wait time data to be included in the response. In all cases currently, these fields will not be populated |
| rotaSessions |  |       |
|   startDayOfWeek, startTime - hours, minutes - endTime - hours, minutes |  | Array	Cycles through each day of the week and provides all opening and closing times for each day, using 24 hour clock. Includes a day named Bankholiday, which gives standard public holiday opening times for the service |
|  openTimeSpecified |	Array |	Provides a date and time for each specified session, which are exceptions to the dates and times provided in the standard hours listings, in the format: DD-MM-YYYY-hh:mm-hh:mm. If the service is closed on a specified day, the time will display as 00:00-00:00 |
