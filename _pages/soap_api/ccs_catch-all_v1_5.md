---
title: Catch-all Search
keywords: develop, validation, rules
tags: [testing,integration,deployment,rules]
sidebar: overview_sidebar
permalink: ccs_catch_all.html
summary: Catch-all rules for the Check Capacity Summary search
published: true
---

## Catch-all Search

The Catch-all search is invoked if, following the filtering processes, there are fewer than two remaining services that can be returned. This is in order to provide the patient with a choice of services. The following rules are applied:
*	If 1 or fewer services match, up to the nearest two services profiled with the Service Type ‘Emergency Department’ are returned.
*	The catch-all service(s) must be within the default 60km search distance; any distance passed in as a search parameter is ignored
*	The catch-all service must be Active
*	Where there is one matching service, if one of the catch-all services is a duplicate of this return, it will not be included
*	Where there is one matching service, this is displayed before the catch-all return(s) and the catch-all services are displayed in ascending distance order
*	The Service Name is suffixed with ‘(Catch-all)’

