---
title: Introduction to Directory of Services API suite
keywords: homepage
tags: [getting_started]
sidebar: overview_sidebar
permalink: index.html
toc: true
summary: An introduction to the Directory of Services API suite
---

## Introduction ##

The Directory of Service (DoS) contains information a wide range of health and care services across England. It is a core part of the Urgent & Emergency Care system workflow, and is responsible for directing patients to appropriate services 24 x 7 x 365.

This site provides some information on the APIs available for the DoS, and technical details on how to use them.

{% include warning.html content="This site is provided for information only and is intended for those engaged with NHS Digital wishing to develop against the DoS APIs. We would also advise speaking with a member of the DoS team before investing any significant time in developing against these specifications." %}


## Purpose ##

The Directory of Services (DoS) provides APIs to allow third-party systems to retrieve service information. Currently, a combination of search functions and individual record retrieval is supported.

The search functions will return a list of recommended services based on a combination of search parameters - there are a couple of different combinations that can be used to do this.

The search functions return an ordered list of health & care services that are deemed approprioate for parameters that were supplied. The search algorithm considers a number of aspects including (but not limited to) patient's age, sex, and current location; the patient's clinical need expressed via clinical terminology; and the timeframe within which the patient needs a service. It is also possible to search for services of specific type(s) using those similar parameters.

{% include note.html content="At present, access to the DoS APIs is granted on a case by case basis in order to ensure the appropriate level of governance and traceability around use of the data within." %}
