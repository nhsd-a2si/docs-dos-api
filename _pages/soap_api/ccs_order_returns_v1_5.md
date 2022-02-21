---
title: Display Order of Returned Services
keywords: develop
tags: [testing,integration,deployment, display, search, result]
sidebar: overview_sidebar
permalink: ccs_order_returns_v1_5.html
summary: Details about the CheckCapacitySummary order of included services
published: true
---


## Calculate Display Order of Returned Services

If no services remain after the filtering processes, the Catch-all search is invoked. This is described separately.
If one or more services remain, these are ranked and ordered so that they are displayed in the most appropriate order. This is determined by the CCG that commissions the services and is known as the Ranking Strategy.


### Check Ranking Strategy
Each CCG (Clinical Commissioning Group) and LAD (Local Authority District) service in the DoS can be linked to a CCG or LAD organisation, against which the ranking strategies are stored. Ranking order is assigned to service types and not to individual services.

The DoS holds a list of each CCG/LAD and the postcodes for which they are responsible. The postcode in the request is matched against these lists and, if a match is found, the ranking strategy for that LAD is used. If there is no matching LAD with a ranking strategy, that of the CCG is used.

The postcode to organisations lists are updated quarterly on release of updated files from the Organisation Data Service (ODS).

The following rules are in place:
*	If the search postcode can be matched to a LAD Organisation, use the ranking strategy of that LAD
*	If the search postcode can be matched to a CCG Organisation, use the ranking strategy of that CCG
*	If the search postcode cannot be matched to a LAD or CCG Organisation, use the national ranking

### Place Services in Order According to Rank
This step uses the rank assigned to each service type – this is a number from 1-10, with 1 being the highest – and places the services in ranking order.
The following rules are in place:
*	Service Types with a higher rank are placed above those of a lower rank
*	Where there are Service Types included in the results which have the same rank, services are ordered within the ranking column based on the distance from patient value

### Place Services in Order According to linked Organisation
This step checks whether a service has been promoted to a particular CCG / LAD / LDA. If any services are promoted to an area other than that of the search location, they will return below those that either are not promoted or are promoted to the CCG of the search location. Each group is still ordered according to the service type ranking described above.

### Place Services in Order According to Service Referral
Once services have been placed in order according to their rank, a further sort is carried out which orders each service within its given ranking level. In addition, a label of (Home) is suffixed to the service name where appropriate. This takes into account the following information:
*	Whether the service is the patient’s home GP. This is determined by the fact that the ODS code of the service matches that used in the request. Where no ODS code is used in the request, neither the home GP nor the home Out of Hours GP will be recognised as such. 
*	Whether the service is the patient’s home Out of Hours GP provider. If the service has the service type of ‘Integrated Urgent Care (IUC) Treatment’ and is linked as a commissioned service (using the Service Referral section on the Clinical Details tab) to the patient’s home GP, then a label of (Home OOH) is added to the name. This does not affect the ordering for this service.
*	Whether or not the service is commissioned by the patient’s home GP, as these are ranked higher than those which are not.
When determining the order of services within each ranking level, the following rules are used. Note that the distance ordering applied in the earlier step is retained:
*	Within each ranking level (e.g. highest, high etc), place services in order: 
1.	Surgery (home GP)
2.	Commissioned Services (restricted)
3.	Commissioned Services (unrestricted)
4.	All others

### Remove Surplus Results
Once the services have been sorted according to the rules above, only the top two services for each service type is retained. For the following service types, only a single service is returned:
* Emergency National Response (ID: 138)
* GP Practice (ID: 100)
* Integrated Urgent Care (IUC) Clinical Assessment (ID: 133)
* Integrated Urgent Care (IUC) NHS 111 Call Handling (ID: 130)
* Integrated Urgent Care (IUC) Pharmacy Clinical Assessment (ID: 137)
* Integrated Urgent Care (IUC) Validation (ID: 139)

### Return Results
The web service response returns all the remaining services in the correct order, and includes the calculated distance from patient value, for information. The exact display of results is determined by the provider system, but they must be displayed in the given order.
