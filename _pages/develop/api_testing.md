---
title: API Testing
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: api_testing.html
summary: Guidance for testing against the DoS APIs
---

## Use a Case ID of 'TEST' when sending test requests into the APIs
When making API requests for non-live purposes (i.e. not for actual delivery of healthcare services) you must use a test ID in your request.

The Case ID must be set to `TEST`

e.g. in the path for the JSON / POC API:

`https://uat.pathwaysdos.nhs.uk/app/controllers/api/v1.0/byServiceType/TEST/../../../../../..`

e.g. in the payload for the SOAP API / Web Service:

```xml
<web:c>
    <!--Optional:-->
    <web:caseRef>eaf74b1f-bf83-443c-9cce-3a438fd1d2ce</web:caseRef>
    <web:caseId>TEST</web:caseId>
    <web:postcode>LS177NZ</web:postcode>
    <web:surgery>L81043</web:surgery>
    <web:age>1</web:age>
    <web:ageFormat>AgeGroup</web:ageFormat>
    <web:disposition>1132</web:disposition>
    <web:symptomGroup>1206</web:symptomGroup>
    <web:symptomDiscriminatorList>
    <web:int>4193</web:int>
    </web:symptomDiscriminatorList>
    <web:searchDistance>25</web:searchDistance>
    <web:gender>M</web:gender>
</web:c>
```

* For SOAP requests, you should not include the CaseRef element unless essential within the context of the testing you are performing.
