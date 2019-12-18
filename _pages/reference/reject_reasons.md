---
title: Reject Reasons
keywords: reference
tags: [reference]
sidebar: overview_sidebar
permalink: reject_reasons.html
summary: Reference data for service rejection reasons
---

The Reject Reasons are used to collect information about why recommended services are not appropriate for patients.

Users should be asked to select a reason whenever rejecting a recommended service from the DoS.

Reasons are divided into categories, which can be used to group the reasons in a user interface to make it easier for a user to quickly select one. The `ShortReasonText` field can be used as the reason description *when the reasons are displayed within the context of their assigned categories*. 

If the reasons are not displayed in the context of their categories, the full `ReasonText` field should be used.

## Reject Reasons ##

| ReasonID | ReasonText | ShortReasonText | Require comment? | Clinicians only? | Category |
|-|-|-|-|-|-|
| 23 | Recommended service not clinically appropriate | Not clinically appropriate | N | Y | Clinician |
| 21 | Unsuitable due to transport/distance |	Cannot travel | N | N | Patient |
| 22 | Rejected for capacity reasons | No capacity | N | N | Service |
| 24 | Service declined referral or could not be contacted | Referral not accepted | N | N | Service |
| 26 | Patient choice | Patient choice | Y | N | Patient |
| 31 | No appointments | No appointments | N | N | Service |
| 32 | Available appointments not suitable | Appointments not suitable | N | N | Service |
| 40 | Patient not eligible for service | Not eligible | N | N | Patient |
| 41 | Patient requires home visit | Requires home visit | N | N | Patient |
| 99 | Other reason | Other reason | Y | N | Other |
  
## Source Data ##

You can download a raw CSV of these values [here](data_downloads/reject_reasons.csv)
