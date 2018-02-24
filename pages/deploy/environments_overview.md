---
title: Environments Overview
keywords: deployment
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: environments_overview.html
summary: An overview of the DoS environments, and how they should be used
---

## API Deployment and Usage

This page will cover the environments that the API is available in inclding the the network configuration. It will also cover how releases are deployed into these environments.

### Test Environments ###
There are a number of test environments available for general use in order to allow API and application testing:

  * **Live** - The production environement only by assured prescribing systems
  * **NFT** - Used in non functional testing of both API and applications
  * **Int** - Used for end to end application integration teting
  * **Dev** - Used by applications under development

Other environments created to support specific testing may be used but may only be available over a fixed time period.

### Environment Details ###

This section provides details of the generally available environments. Other environments created to support specific testing may be used.

#### Live ####

| **DNS Name**    | www.pathwaysdos.nhs.uk    |
| **Port**        | TCP 443                   |
| **Dataset**     | Live                      |
| **Release**     | Latest                    |


#### Pre-production ####

Non Functional Test Environment. Infrastructure should directly reflect live, although may be scaled. Dataset should be the same as the live environment.

| **DNS Name**    | *Not externally addressable* |
| **Port**        | TCP 443                      |
| **Dataset**     | Latest or Next               |

#### UAT1 ####

Integration Test Environment. May be configured to have the same release as in Live to allow application testing, or the current release +1 to allow NFT of the new release. Test data will be configured at supplier request.

| **DNS Name**    | uat.pathwaysdos.nhs.uk |
| **Port**        | TCP 443                   |
| **Dataset**     | Test data                 |
| **Dataset**     | Latest                    |

#### UAT 2 ####

Integration Test Environment. May be configured to have the same release as in Live to allow application testing, or the current release +1 to allow NFT of the new release. Test data will be configured at supplier request.

| **DNS Name**    | uat2.pathwaysdos.nhs.uk |
| **Port**        | TCP 443                   |
| **Dataset**     | Test data                 |
| **Dataset**     | Next               |

#### UAT 3 ####

Integration Test Environment. May be configured to have the same release as in Live to allow application testing, or the current release +1 to allow NFT of the new release. Test data will be configured at supplier request.

| **DNS Name**    | uat3.pathwaysdos.nhs.uk |
| **Port**        | TCP 443                   |
| **Dataset**     | Test data                 |
| **Dataset**     | Next               |
