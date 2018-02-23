---
title: API Deployment Overview
keywords: deployment
tags: [testing,integration,deployment]
sidebar: overview_sidebar
permalink: deploy_overview.html
summary: An overview of how the API is deployed, and how to connect to it
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

| **DNS Name**    | dos.eps.digital.nhs.uk    | 
| **Virtual IP**  | TBC                       |
| **Port**        | TCP 443                   |
| **Dataset**     | Live                      |


#### NFT ####

Non Functional Test Environment. Infrastructure should directly reflect live, although may be scaled. Dataset should be the same as the live environment.

| **DNS Name**    | dos-NFT.eps.digital.nhs.uk | 
| **Virtual IP**  | TBC                       |
| **Port**        | TCP 443                   |
| **Dataset**     | Live                      |

#### Int ####

Integration Test Environment. May be configured to have the same release as in Live to allow application testing, or the current release +1 to allow NFT of the new release. Test data will be configured at supplier request.

| **DNS Name**    | dos-int.eps.digital.nhs.uk | 
| **Virtual IP**  | TBC                       |
| **Port**        | TCP 443                   |
| **Dataset**     | Test data                 |

#### Dev ####

Development and Test Environment. Test data may be configured directly by suppliers.

| **DNS Name**    | dos-dev.eps.digital.nhs.uk | 
| **Virtual IP**  | TBC                       |
| **Port**        | TCP 443                   |
| **Dataset**     | Test data                 |