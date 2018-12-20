---
title: SOAP API v1.5 - Error Codes
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_api_errors_1_5.html
summary: A list of potential error codes you could receive from the SOAP API
published: true
---

## Error Codes

If your SOAP request is invalid in some way, or there is an error with processing an appropriate request, you will receive an error in the following format:

```xml
<env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope">
    <env:Body>
        <env:Fault>
            <env:Code>
                <env:Value>303</env:Value>
            </env:Code>
            <env:Reason>
                <env:Text>Incorrect Privileges: Please check that the user has the correct privileges to run this service</env:Text>
            </env:Reason>
        </env:Fault>
    </env:Body>
</env:Envelope>
```


## Error Codes for web service version v1.5

*Note*: Error codes are currently being updated and some will be re-numbered. This work is in progress and this table is therefore subject to change. Where known, changes have been indicated in the table

| Code | Description                | Notes                                                                | Current Status |
-------|----------------------------|----------------------------------------------------------------------|----------------|
| 100 | System Search failure |   | |
| 101 | Postcode Validation: Postcode not found | | |
| 102 | Service Search: No services found | This error will only return if catch-all has also failed. This most frequently occurs when the postcode is out of area – e.g. Wales or Scotland | | 
| 103 | Request Response: Service not found | ServiceDetailsbyID endpoint only | | 
| 104 | Parameter Validation: No valid discriminators passed/SGSD combo not valid |   |
| xxx | Parameter Validation: invalid SG | | In development
| 105 | Parameter Validation: Search distance must be greater than 0km and less than maximum system distance. | The maximum is a configuration parameter set in DoS – currently 99  |
| 106 | Parameter Validation: Invalid gender supplied - supported values: M, F, I |   |
| 106 | Parameter Validation: Invalid age format supplied - supported values Years, Months, Days, AgeGroup |   | To be re-numbered |
| 115 | Parameter Validation: Invalid age value supplied. Supported values where Days format is used are numbers between 0-31 | | In development |
| 116 | Parameter Validation: Invalid age value supplied. Supported values where Months format is used are whole numbers between 1-23 | | In development |
| 117 | Parameter Validation: Invalid age value supplied. Supported values where Years format is used are whole numbers between 2-129 | | In development |
| 114 | Parameter Validation: Invalid age supplied - mandatory field, only whole numbers allowed | | In development |
| 118 | Parameter Validation: Invalid age value supplied. Supported values where AgeGroup is used are: 1, 2, 3, 4 | | In development |
| 107 | WSDL Validation: Unsupported Webservice version |   |
| 108 | Malformed XML: The soap message is not valid xml. |   |
| 108 | Malformed XML: Unable to identify the SOAP version | | To be renumbered |
| 109 | WSDL Validation: (109) - Unable to find version
| 108 | Parameter Validation: Search date and time is invalid | Where a search date/time is passed in, this must be in a valid format | To be re-numbered |
| 109 | Parameter Validation: searchDateTime ([value]) more than 12 months in future | | To be re-numbered |
| 110 | Parameter Validation: searchDateTime ([value]) more than 1 minute in the past | |  |
| 113 | Parameter Validation: where the distance override value is true, a distance value must be provided | | |
| 300 | Unable to login to DoS web services | Generic error (usually a system level issue) |
| 302 | Authentication failed: Please check user credentials (username/password) or check whether the user account is locked (use password reset to unlock) |  | To be re-numbered |
| 302 | Authentication Failed: Please check that the user has the correct privileges to run this service | Usually because the user does not have the correct permission on their account | 
| 1001 | Request Validation: Unable to locate username and password in the request |   |
| 500 | Internal Server Error |   |
| 504 | Time out |     |

