---
title: Catch-all Search
keywords: develop, validation, rules
tags: [testing,integration,deployment,rules]
sidebar: overview_sidebar
permalink: ccs_catch_all_v1_5.html
summary: Catch-all rules for the Check Capacity Summary search
published: true
---

## Catch-all Search

The Catch-all search is invoked if, following the filtering processes, there are no services that can be returned. This is in order to ensure that the patient is offered a service that they can go to. The following rules are applied:
*	If no services match, up to the nearest two services profiled with the Service Type ‘Emergency Department’ are returned.
*	The catch-all service(s) must be within the default 60km search distance; any distance passed in as a search parameter is ignored
*	The catch-all service must be Active
* The capacity status of the catch-all service is not taken into account
*	The Service Name is suffixed with ‘(Catch-all)’

