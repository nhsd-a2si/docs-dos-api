---
title: SOAP API Overview
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: develop_overview.html
summary: An overview of the DoS SOAP API
---

## The SOAP API ##

*Also sometimes referred to as **CheckCapacitySummary***

The dispenser object includes the following information:

* ODS Code
* Name
* Service type _currently only EPS R2 enabled pharmacies_
* Address
  - Address line _x 4_
  - Postcode
* Patient Contact Details
  - Phone
  - Web
* Prescriber Contact Details
  - Phone
  - Fax
  - Email
* Location
  - Easting
  - Northing
* Opening Hours
  - 24/7 opening
  - Monday
    + Open _HH:MM format_
    + Close _HH:MM format_
  - ...
  - Sunday
    + Open
    + Close
  - Bank holiday
    + Open
    + Close
  - Specified dates
    + Date _YYYY-MM-DD format_
      - Open
      - Close

