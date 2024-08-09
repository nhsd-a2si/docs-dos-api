---
title: Check Capacity Summary Field Definition v1.5 - Service Attribute Overview
keywords: develop
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: ccs_fields_v1.5_service_attribute.html
published: true
---

Each Service Attribute will have a value of a specific data type.  The following table provides details of valid data types.

Note: All values will be returned as string in the ccs response.  The data type field will identify how the value should be interpreted.

| **Data Type**    | **Description**    |
|------------------|--------------------|
|Boolean	  | This represents values of 'TRUE' and 'FALSE' only |


The following table lists all Service Attributes currenty active in DoS.

| **Attribute Name** | **Data Type** | **Description** | **Expected System Behaviour** | **DoS Profile Notes** |
|--------------------|---------------|-----------------|-------------------------------|-----------------------|
|requirebooking	| Boolean |This attribute identifies that the service can only be referred into with an appointment.|If this attribute is set to TRUE the DoS entry can be selected but it is not possible to make a referral. | When adding this attribute to a service it is important to note that not all 3rd party systems are using the attribute to inform system behaviour.  Therefore it is necessary to continue to maintain the referral notes on the service to indicate that referral is by appointment only. **_Note:_** _NHS Digital are working with the other suppliers as part of the development to support UEC Care Connect for booking and this will be a requirement.  See ([Booking only](https://developer.nhs.uk/apis/uec-appointments/dos_bookingonly.html)) page for more information about appointment booking._|
|Digital_Go_With_Notif	| Boolean |This attribute indicates that a patient can physically go to the service and the service will also be notified of their referral. |If this attribute is set to TRUE the patient referral is expected to trigger an electronic notification. | When adding this attribute to a service it is important to note that the notification endpoint details must be profiled and correct.|
|webchat_enabled | Boolean | This attribute is used by 111 Online as part of a webchat pilot service. | Where this attribute is linked to a service and is TRUE, 111 Online is able to offer webchat facility to patients. | To be used only with agreement from 111 Online and the participating service |
|Website Signposting | Boolean |This attribute indicates that a service uses their website as their primary method of referral. |Where this attribute is linked to a service and is TRUE, 111 Online may direct the user to the listed website for the service. | To be used only with agreement from 111 Online and the participating service |



