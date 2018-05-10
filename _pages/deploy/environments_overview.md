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
  * **Integration** - Used for end to end application integration and user testing
  * **UAT 2 / 3** - Used to support user acceptance testing of new releases before they are deployed to the Live environment

Other environments created to support specific testing may be used but may only be available over a fixed time period.

### Environment Details ###

This section provides details of the generally available environments. Other environments created to support specific testing may be used.

All environments require **https**.

#### Live ####

| **DNS Name**    | www.pathwaysdos.nhs.uk    |
| **Dataset**     | Live                      |
| **Release**     | Latest                    |


#### Pre-production ####

| **DNS Name**    | *Not externally accessible*  |
| **Dataset**     | Copy of live                 |
| **Release**     | Latest or next               |

#### Integration ####

| **DNS Name**    | uat.pathwaysdos.nhs.uk |
| **Dataset**     | Partial copy of live   |
| **Release**     | Latest                 |

#### UAT 2 ####

| **DNS Name**    | uat2.pathwaysdos.nhs.uk |
| **Dataset**     | Subset of live data     |
| **Release**     | Current Release         |

#### UAT 3 ####

| **DNS Name**    | uat3.pathwaysdos.nhs.uk |
| **Dataset**     | Subset of live data     |
| **Release**     | Next Release            |
