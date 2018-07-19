---
title: SOAP API - Error Codes
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: soap_errors.html
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


## Error Codes for web service version v1.3

| Code | Description                | Notes                                                                                |
-------|----------------------------|----------------------------------------------------------------------|
| 100 | System Search failure |   |
| 101 | Postcode Validation: Postcode not found |
| 102 | Service Search: No services found | This error will only return if catch-all has also failed. This most frequently occurs when the postcode is out of area – e.g. Wales or Scotland |
| 103 | Request Response: Service not found |   |
| 104 | Parameter Validation: No valid discriminators passed/SGSD combo not valid |   |
| 105 | Parameter Validation: Search distance must be greater than 0km and less than maximum system distance. | The maximum is a configuration parameter set in DoS – currently 99  |
| 106 | Parameter Validation: Invalid gender supplied - supported values: M, F, I |   |
| 106 | Parameter Validation: Invalid age format supplied - supported values Years, AgeGroup |   |
| 107 | WSDL Validation: Unsupported Webservice version |   |
| 108 | Request Validation: Malformed XML: The soap message is not valid xml. |   |
| 109 | WSDL Validation: (109) - Unable to find version
| 300 | Unable to login to DoS web services | Generic error (usually a system level issue) |
| 302 | Authentication failed: Please check user credentials (username/password) or check whether the user account is locked (use password reset to unlock) |   |
| 303 | Incorrect Privileges: Please check that the user has the correct privileges to run this service | Usually because the user does not have the correct permission on their account  |
| 1001 | Request Validation: Unable to locate username and password in the request |   |
