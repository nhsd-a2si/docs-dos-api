---
title: Environments Overview
keywords: deployment
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: environments_overview.html
summary: An overview of the DoS environments, and how they should be used
---

### Environments ###
There are a number of environments available, some of which are available for general use in order to allow API and application testing:

  * **Live** - The production environment for use only by assured prescribing systems
  * **Pre-production** - Used for interanl non-functional testing of both API and applications
  * **Production User Testing** - Used for end to end application integration and user testing
  * **UAT** - Used to support user acceptance testing of new releases before they are deployed to the Live environment - these will be made available 

Other environments created to support specific testing may be used but may only be available over a fixed time period.

### Environment Details ###

This section provides details of the generally available environments. Other environments created to support specific testing may be used.

All environments require **https**.

#### Live ####


| **Item** | **Description**                                                                                             |
|-----------------|-------------------------------------------------------------------------------------------------------|
| **DNS Name**    | www.directoryofservices.nhs.uk for UI users and www.webservices.directoryofservices.nhs.uk for API users |
| **Dataset**     | Live                                                                                                     |
| **Release**     | Latest                                                                                                   |


#### Pre-production ####

| **Item** | **Description**                   |
|-----------------|------------------------------|
| **DNS Name**    | *Not externally accessible*  |
| **Dataset**     | Copy of live                 |
| **Release**     | Latest or next               |

#### Production User Testing ####


| **Item** | **Description**                    |
|-----------------|------------------------------|
| **DNS Name**    | usertest.directoryofservices.nhs.uk |
| **Dataset**     | Partial copy of live           | 
| **Release**     | Latest                         | 

#### UAT ####

 UAT environments will be made available as and when required and the URL will be provided 

| **Item** | **Description**                     |
|-----------------|------------------------------|
| **DNS Name**    | xxx.directoryofservices.nhs.uk        |
| **Dataset**     | Subset of live data                   |
| **Release**     | Current Release or previous release   |


| **Description** | **Notes**                    |
