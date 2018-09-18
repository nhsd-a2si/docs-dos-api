# Search by Service Type

This search method allows users to search the DoS based on service type ID, location and optional patient details, and returns a set of details about matching services. It returns up to the number of results specified per service type and ordered by distance, closest first.

# Request

| Parameter        | Type           | Required?   | Description       |
|------------------|----------------|-------------|-------------------|
| caseId           | String         | No          |                   |
| searchDistance   | Integer        | No          | Distance in miles, to a maximum of 100. If not entered, default value of 37.5 is used |
| postcode         | String         | Yes         |                   |
| gpPracticeId     | Integer        | No          | DoS service ID of patient's GP Practice  |
| age              | Integer        | No          | DoS age group of patient       |
| gender           | String         | No          | Gender of patient, M,F,I  |
| disposition      | String         | No          | Not currently used - if a value is passed in, this will be ignored   |
| serviceTypeIds   | Array          | Yes         | ID of DoS Service Types required. Allows multiple IDs per request |
| numberPerType    | Integer        | No          | Maximum number of services to return, per service type searched |

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

## Service Type IDs

A list of service types and their IDs is available [here.](https://github.com/nhsd-a2si-data/dos-reference-data) 


# Request Validation Rules

| Parameter	           | Rule       	| Error Message           |
|----------------------|--------------|-------------------------|
|Search Distance       |	Max 100     |	Bad Request: Search distance must be no more than 100 |
| Search Distance      |	Must be a number	| Bad Request: Search distance must be numeric |
| Postcode             |	Postcode must be in the DoS postcode lookup table |	Bad Request: Invalid post code |
| Postcode             |	Postcode cannot be Null	 | Bad Request: Postcode must be provided |
| GP Practice ID       |	Must be a valid service ID |	Bad Request: The supplied service ID of the patient's practice does not exist in the system |


# Search Rules

| Parameter         |	Rule                    |
|-------------------|-------------------------|
| Username          |	Only services where the Referral Role matches the Search Role of the authenticated user are returned |
|                   |	Only Active services are returned |
| Search Distance   |	Use this value to calculate the search box, with the postcode passed in at the centre - only services within this box are returned. If Null or Zero, default value is used: 37.5 miles |
| Postcode          |	Postcode is used to calculate the search distance, and the distance (in miles) between the postcode and each service is included in response |
| Gender	          | Only services matching the gender code provided are returned in the response. Where null, Gender is ignored |
| GP Practice ID	  | Services which are restricted to patients of a specified GP practice will only return if the GP Practice ID passed in is on the Service Referrals list of the service |
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




