# Introduction

As a new technology, Wireless Sensor Networks (WSNs) has a wide
range of applications [@Culler-01; @Bahl-02; @Akyildiz-01], including
environment monitoring, smart buildings, medical care, industrial and
military applications. Among them, a recent trend is to develop
commercial sensor networks that require pervasive sensing of both
environment and human beings, for example, assisted living
[@Akyildiz-02; @Harvard-01; @CROSSBOW] and smart homes
[@Harvard-01; @CROSSBOW].

For example, assisted living
While collecting all these multimedia information
channel: 19.2,Kbps in MICA2 [@Bahl-02] and 250,Kbps in MICAz.


> For these applications, sensor devices are incorporated into human
> cloths [@Natarajan-01; @Zhou-06; @Bahl-02] for monitoring
> health related information like EKG readings, fall detection, and
> voice recognition'.


While collecting all these multimedia information
[@Akyildiz-02] requires a high network throughput, off-the-shelf
sensor devices only provide very limited bandwidth in a single
channel: 19.2Kbps in MICA2 [@Bahl-02] and 250Kbps in MICAz.

In this article, we propose MMSN, abbreviation for Multifrequency
Media access control for wireless Sensor Networks. The main
contributions of this work can be summarized as follows.

- To the best of our knowledge, the MMSN protocol is the first
  multifrequency MAC protocol especially designed for WSNs, in which
  each device is equipped with a single radio transceiver and
  the MAC layer packet size is very small.
- Instead of using pairwise RTS/CTS frequency negotiation
  [@Adya-01; @Culler-01; @Tzamaloukas-01; @Zhou-06],
  we propose lightweight frequency assignments, which are good choices
  for many deployed comparatively static WSNs.
- We develop new toggle transmission and snooping techniques to
  enable a single radio transceiver in a sensor device to achieve
  scalable performance, avoiding the nonscalable "one
  control channel + multiple data channels'' design [@Natarajan-01].