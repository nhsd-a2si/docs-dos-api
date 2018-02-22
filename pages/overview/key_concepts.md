---
title: Key Concepts
keywords: usecases
tags: [engagement,getting_started]
sidebar: overview_sidebar
permalink: key_concepts.html
summary: An overview of the main objects used in the API.
---

## Key Concepts ###

### Services ###
A service represents some kind of health or care service that is provided by a healthcare provider. Services can be defined at a high level (e.g. High Street Pharmacy) or at a granular level (e.g. High Street Pharmacy - Flu Vaccination Service).

Although a service may be created to represent an organisation, or a physical location - it is important to remember that services are not automatically equivalent to organisations and physical locations.

You may see references to 'profiling' when working with the DoS; the word 'profiling' is often used to describe the process of defining and configuring a service with detailed information about ranging from administrative details (e.g. name, address, phone number) to clinical capabilities (by way of clinical terminology).

### Disposition Codes ###
A disposition code is an indication of the needs of the patient encompassing both the general category of service required and the timeframe within which that service is required.

There are many hundreds of dispositions in the full list, but they tend to exist in groups. You may have several disposition codes representing a single category of service but covering a number of different timescales / urgencies. Below is an example of some Repeat Prescription disposition codes:

| Disposition Code   | Descriptive Name                             |
|--------------------|----------------------------------------------|
| Dx85               | Repeat prescription required within 2 hours  |
| Dx86               | Repeat prescription required within 12 hours |
| Dx87               | Repeat prescription required within 24 hours |
| Dx80               | Repeat prescription required within 6 hour   |

### Dispenser Types ###

There are a number of types of dispensing contractor who can dispense prescriptions. Dispensers are often a part of a chain - these are often termed 'multiples'. However, presriptions must be sent to and dispensed by a specific dispensing site. These are all individually identified by an ODS code; these have historically started with an 'F' and so are often termed 'F-codes'.

#### Community Pharmacy ####
Community pharmacies are probably the most familiar dispenser as these are often seen on high streets. Community Pharmacies _must_ dispense all items on a prescription regardless of cost, but may not have all items immediately available without ordering in.

#### Dispensing Applicance Contractors ####
Dispensing Applicance Contractors (DACs) can only dispense applicances listed in part XXX of the NHS Drug Tarrif, and so are unable to dispense medications or reagents. DAcs are only obliged to dispense items they carry in the normal course of their business and many are quite specialised in only dealing with ostomy bags or foodstuffs for example. Many work on the basis of providing a delivery service so can't be attended in person by a patient.

#### Internet Pharmacies ####
Internet pharmacies work on the same contract as Community Pharmacies, and as such can dispense both medications and applicances but they operate on a delivery-only model and like many DACs do not have a dispensary that can be attended in person by a patient.

#### EPS-enabled dispensers ####

Any of the dispenser types above can be enabled to dispense EPS Release 2 prescriptions, and the vast majority can do.

#### Dispensing Doctors ####

Dispensing doctors can dispense for their own dispensing patients but are not included in the EPS DoS API.

<br>
<hr>

## Further Reading ##

