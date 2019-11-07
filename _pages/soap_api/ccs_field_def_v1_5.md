---
title: Check Capacity Summary Field Definition v1.5
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: ccs_fields_v1.5.html
published: true
---

# Request 
The following table details the parameters included in a Check Capacity Summary v1.5 request


| **Field Name**    | **Required?**    | **Type**   | **Default Value** | **Description**   |
|-----------------|----------------|----------|-----------------|-----------------|
|serviceVersion	  |  No	           |string	  | 1.3             | The web service version being requested, must be a valid value |
|username         |	Yes            |string    |	N/A	            | Must be an active DoS account |
|password	        | Yes            |string	  | N/A             |	Must match the password for the username |
|caseRef          |	No	           |string	  | N/A	            | Reference used by provider system – not used in search but included in audit logs and used for support purposes|
|caseId           |	No             |	string	| N/A	            | Reference used by provider system – not used in search but included in audit logs and used for support purposes |
|postcode         |	Yes            |	string  |	N/A	            | Must be a valid UK postcode |
|surgery          |	No	           |string    |	N/A	            | GP surgery ODS code |
|age	            |Yes             |	int     |	N/A             |	min 0, max 129 – accepted value is dependent on age format used. Days = 0-31, Months = 1-23, Years = 2-129, AgeGroup = 1-4|
|ageFormat        |Yes             |	string	| N/A	            | Available values: Days, Months, Years, AgeGroup |
|disposition      |	No             |	int     |	N/A             |	Disposition ID |
|symptomGroup	    | Yes            |	int     |	N/A             |	Symptom Group ID |
|symptomDiscriminatorList |	Yes    |	Array: int	| N/A	        | Symptom Discriminator ID |
|searchDistance	| No	           | int	    | 60              |	kilometres, min 1, max 99 |
|forceSearchDistance	| No	| Boolean	| False	| When true, the distance passed in the request will be used before any pre-set search distance |
|gender         |	No             |	string	| I	              | Available values: M, F, I |
|SearchDateTime | No             | date/time | current date/time | Example value: `2019-01-20T08:44:00+00:00`  |


# Response
The following table details the Check Capacity Summary v1.5 response 

| **Field Name**  | **Type**    | **Description / Corresponding DoS Field Label**  |
|---------------|-----------|------------------------------------------------|
|TransactionID  |	string	  | Used in audit logs and assists with support requests |
|RequestedAtDateTime | date/time | The time that the search request was received |
|SearchDateTime | date/time | The time used to calculate the search results |
|SearchDistance | int | The distance used in the search |
|SearchDistanceUsedSource | string | The source of the distance – postcode, district, sector, national, override, web service |
|CalculatedAgeInDays | int | The patient age passed in the request, converted into days |
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
| id (Service Type) | int   | ID of the service type assigned to the service |
| name (Service Type) | string | 	Name of the service type assigned to the service |
| odsCode     |	string	| ODS code of the service (not validated against ODS records) |
|nonPublicTelephoneNo |	string	| Non-Public Phone |
|fax |	string	| Fax Number |
|publicFacingInformation |	string |	Public Facing Information |
|distance |	string |	Distance from patient postcode (Straight-line distance between search postcode and service postcode, in miles) |
|referralInformation |	string |	Referral Information (free text field intended for use by 111 Call Handlers and clinicians) |
|openAllHours |	Boolean |	True/False – if true, the service is open 24 hours a day, 7 days a week |
|capacityAttributes    | Array   |       |
| name, description, value |  | To allow current wait time data to be included in the response. Intially the names included will be: currentWaitTime, patientsInDepartment, patientsBeingSeen. In all cases currently, these fields will not be populated |
| serviceEndpoints	| Array |        |
|  endpointOrder, transport, format, interaction, businessScenario, address, compression, comment |	| includes all available fields for each endpoint profiled against the service, which may be 0 – many. |
| rotaSessions | Array |       |
|   startDayOfWeek, startTime - hours, minutes - endTime - hours, minutes |  | Cycles through each day of the week and provides all opening and closing times for each day, using 24 hour clock. Includes a day named Bankholiday, which gives standard public holiday opening times for the service |
|  openTimeSpecified |	Array |	Provides a date and time for each specified session, which are exceptions to the dates and times provided in the standard hours listings, in the format: DD-MM-YYYY-hh:mm-hh:mm. If the service is closed on a specified day, the time will display as 00:00-00:00 |
| attributes	|  Array |       |
|  dataType, name, description, value  | | Each service may have 0 – many attributes, and each will be included here. Intially this will return no data |
| serviceAgeRange	|  Array |         |
| daysFrom, daysTo	|  | The age range in days profiled on the service which has matched the age passed in the request |

