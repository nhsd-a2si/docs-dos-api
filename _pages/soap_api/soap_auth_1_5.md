---
title: SOAP API – Authentication v1.5
keywords: develop
tags: [testing,integration,deployment, security]
sidebar: overview_sidebar
permalink: soap_api_1_5_auth.html
published: true
---

## Authentication

All methods on the SOAP API require a `User` object to authenticate.

```xml
<web:userInfo>
    <web:username>{{username}}</web:username>
    <web:password>{{password}}</web:password>
</web:userInfo>
```

The supplied username and password must be a valid, active account within the instance of the DoS that you are targeting.

If you supply an invalid set of credentials you will receive a `Fault` object:

```xml
<env:Fault>
    <env:Code>
        <env:Value>302</env:Value>
    </env:Code>
    <env:Reason>
        <env:Text>Authentication Failed: Please check user credentials (username/password) or check whether the user account is locked (use password reset to unlock)</env:Text>
    </env:Reason>
</env:Fault>
```

## Permissions

A specific permission 'webService' must be applied to a user account in order to use the SOAP API.

If you supply valid credentials which do not have the appropriate permission, you will receive:

```xml
<env:Fault>
    <env:Code>
        <env:Value>303</env:Value>
    </env:Code>
    <env:Reason>
        <env:Text>Incorrect Privileges: Please check that the user has the correct privileges to run this service</env:Text>
    </env:Reason>
</env:Fault>
```
