---
title: Searching for Services
keywords: develop
tags: [develop]
sidebar: overview_sidebar
permalink: searching_for_service.html
summary: How to use the search resources and how the system finds matching dispensers
---


The API provides two search resources:

  * `/byServiceType/..` - used to find services of specific type(s)
  * `/byClinicalTerm/..` - used to find services which can meet a specific clinical need expressed in clinical terms


## Searching by Location & Opening Hours ##

The most common operation will be to find a dispenser which can dispense a prescription to the patient within the timeframe dictated by the patient disposition. Patients disposition is allocated by NHS Pathways and include values like `Dx85	- Repeat prescription required within 2 hours`.

Passing a number of hours to the API will ensure that all dispensers returned in results are open within at least a portion of that timeframe. Once open dispensers are identified the system orders by distance and returs the five nearest. If a maximum distance filter is included this is applied, otherwise the system will default to a maximum distance of 38km.

## Search Results ##

Searching by Location & Opening Hours results in an array of up to five Dispenser resources. Results include the distance to the patient location.

### Examples ###

```
TODO
````

## Searching by Name ##


### Examples ###

```
TODO
````

