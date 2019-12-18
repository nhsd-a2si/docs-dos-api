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
| 21 | Unsuitable due to transport/distance |	Travel not possible | N | N | Patient |
| 22 | Rejected for capacity reasons | No capacity | N | N | Service |
| 24 | Service declined referral | Rejected referral | N | N | Service |
| 26 | Rejected for patient choice | Patient choice | Y | N | Patient |
| 27 | Service could not be contacted | Couldn't make contact | N | N | Service |
| 31 | No appointments available | No appointments | N | N | Service |
| 32 | Available appointments not suitable | Appointments not suitable | N | N | Service |
| 40 | Patient not eligible for service | Not eligible | N | N | Patient |
| 41 | Patient requested home visit | Requested home visit | N | N | Patient |
| 99 | Other reason | Other reason | Y | N | Other |
  
## Source Data ##

You can download a raw CSV of these values [here](data_downloads/reject_reasons_draft_191218_3.csv)
