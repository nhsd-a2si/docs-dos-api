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


### Service Types ###
Most records within the DoS are a 'service' record of some type.

A complete list of the different service types can be found here: (https://github.com/nhsd-a2si-data/dos-reference-data){:target="_blank"}

Most service types behave in the same way, but there are a few which have special status or attributes. These are:

* Commissioning Organisation
* Region


### Disposition Codes ###
A disposition code is an indication of the needs of the patient encompassing both the general category of service required and the timeframe within which that service is required.

There are many hundreds of dispositions in the full list, but they tend to exist in groups. You may have several disposition codes representing a single category of service but covering a number of different timescales / urgencies.

Below is an example of some disposition codes:

| Disposition Code   | Descriptive Name                                      |
|--------------------|-------------------------------------------------------|
| Dx13               | Speak to a primary care service within 6 hours        |
| Dx17               | To contact a dental service within 1 hour             |
| Dx80               | Repeat prescription required within 6 hours           |
| Dx120              | Callback by Healthcare Professional within 4 hours    |


### Symptom Groups / Symptom Discriminators (SG/SD Codes)

This is a proprietary coding system developed to support the NHS Pathways triage product.

The codes are designed to be used in pairs to provide clinical context to a search. The Symptom Group (SG) describes the presenting issue and the Symptom Discriminator (SD) describes the clinical need. Each SD may be linked to one or more SGs.
e.g. (note: combinations which do not search the DoS are not shown here)

| SG ID  | SG Description                   |  SD ID   | SD Description                                              |
|------- | -------------------------------- | -------- | ------------------------------------------------------------|
| SG1011 |	Ankle or Foot Injury, Blunt   	| SD4003   |	PC full Primary Care assessment and prescribing capability |
| SG1011 |	Ankle or Foot Injury, Blunt   	| SD4010   |	ALL assault, sexual                                        |
| SG1011 |	Ankle or Foot Injury, Blunt	    | SD4052   |	ED full ED assessment and management capability            |
| SG1011 |	Ankle or Foot Injury, Blunt	    | SD4304   |	ED unable to weightbear                                    |
| SG1010 |  Allergic Reaction               | SD4003   |  PC full Primary Care assessment and prescribing capability |
| SG1010 |  Allergic Reaction               |	SD4020   |	PC assessment and management capability, minor condition   |
| SG1010 |  Allergic Reaction               |	SD4052   |	ED full ED assessment and management capability            |
