---
title: A Good Example Title
abstract: This is the text of the abstract. An abstract gives an overview of the survey (what we survey and why) as well as what the main contributions are. Check other computing surveys journal papers for the style.
author:
  name: Shiwei Weng
  email: weng@cs.jhu.edu
  affiliation: Johns Hopkins University
  country: USA

bibliography: references.bib
---

<!-- # Introduction -->
!include main-section-intro.md

# MMSN Protocol

TBD

## Frequency Assignment

TBD

### Exclusive Frequency Assignment

In exclusive frequency assignment, nodes first exchange their IDs
among two communication hops so that each node knows its two-hop
neighbors' IDs. In the second broadcast, each node beacons all
neighbors' IDs it has collected during the first broadcast period.

#### Eavesdropping

Even though the even selection scheme leads to even sharing of
available frequencies among any two-hop neighborhood, it involves a
number of two-hop broadcasts. To reduce the communication cost, we
propose a lightweight eavesdropping scheme.

# References