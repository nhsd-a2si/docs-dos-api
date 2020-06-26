---
title: Check Capacity Summary Field Definition v1.5 - Details of Active Service Attributes
keywords: develop
tags: [testing,integration,deployment]
permalink: ccs_fields_v1.5_service_attribute_details.html
published: true
---

The following table lists all Service Attributes currenty active in DoS.

| **Attribute Name** | **Data Type** | **Description** | **Expected System Behaviour** | **DoS Profile Notes** |
|--------------------|---------------|-----------------|-------------------------------|-----------------------|
|requirebooking	| Boolean |This attribute identifies that the service can only be referred into with an appointment.|If this attribute is set to TRUE the DoS service cannot be selected until an appointment booking has been made. | When adding this attribute to a service it is important to note that not all 3rd party systems are using the attribute to inform system behaviour.  Therfore it is necessary to continue to maintain the referral notes on the service to indicate that referral is by appointment only.|
