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

## Reject Reasons ##

| ReasonID | ReasonText | ShortReasonText | Require comment? | Clinicians only? | Category |
|-|-|-|-|-|-|
| 21 | Unsuitable due to transport/distance |	Transport not suitable | N | N | Patient |
| 22 | Rejected for capacity reasons | No capacity | N | N | Service |
| 23 | Service not clinically appropriate | Not clinically appropriate | Y | Y | Clinician |
| 24 | Service declined referral | Referral rejected | Y | N | Service |
| 26 | Rejected for patient choice | Patient choice | Y | N | Patient |
| 27 | Service could not be contacted | Couldn't contact service | N | N | Service |
| 31 | No appointments available | No appointments | N | N | Service |
| 32 | Appointments not suitable | Appointments not suitable | N | N | Service |
| 40 | Patient not eligible for service | Not eligible | Y | N | Patient |
| 41 | Patient requested home visit | Requested home visit | N | N | Patient |
| 42 | Unsuitable due to distance | Distance too far | N | N | Patient |
| 99 | Other reason | Other reason | Y | N | Other |
  
## Using the categories ##

Reasons are divided into categories, which can be used to group the reasons in a user interface to make it easier for a user to quickly select one. 

The `ShortReasonText` field can be used as the reason description *when the reasons are displayed within the context of their categories*.

e.g. if you implemented the Reject Reasons as individual buttons in a window, you could label the buttons in groups by their categories, and then use the `ShortReasonText` as the button labels - the grouping would give the buttons the necessary context.

If the reasons are not displayed within their category groupings, the full `ReasonText` value should be used as the description.


## Source Data ##

You can download the latest version of the Reject Reasons data here: [reject_reasons_191218.csv](data_downloads/reject_reasons_191218.csv)
