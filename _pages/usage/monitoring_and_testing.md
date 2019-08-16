---
title: API Monitoring
keywords: deploy
tags: [deploy]
sidebar: overview_sidebar
permalink: api_monitoring.html
summary: Guidance for monitoring the DoS APIs
---

## Use a Case ID of 'MONITORING' when sending monitoring requests into the APIs

Some consumers need to monitor the state of the DoS APIs in order to ensure they can gracefully handle unavailability of the API to their application.

**If you would need to do this, you must first get permission from the DoS team otherwise your account may be disabled.**

* Requests MUST be no more frequent than 1 every minute, but preferably 1 every 5 minutes

* Search distance must be set to '1'

* You MUST use a Case ID of 'MONITORING' in all requests.

e.g. in the path for the JSON / POC API:

`https://uat.directoryofservices.nhs.uk/app/controllers/api/v1.0/byServiceType/MONITORING/1/../../../../..`

e.g. in the payload for the SOAP API / Web Service:

```xml
<web:c>
    <web:caseId>MONITORING</web:caseId>
    <web:postcode>LS177NZ</web:postcode>
    <web:age>1</web:age>
    <web:ageFormat>AgeGroup</web:ageFormat>
    <web:disposition>1132</web:disposition>
    <web:symptomGroup>1206</web:symptomGroup>
    <web:symptomDiscriminatorList>
    <web:int>4193</web:int>
    </web:symptomDiscriminatorList>
    <web:searchDistance>1</web:searchDistance>
    <web:gender>M</web:gender>
</web:c>
```

* For SOAP requests, you should not include the CaseRef element.
