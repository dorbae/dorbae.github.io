---
layout: post
title: "[IoT] What is MQ2?"
comments: true
author: dorbae
date: 2019-09-04 +0900
categories : [IoT,Sensor]
tags: [iot, sensor, mq2]
sitemap :
  changefreq : weekly
---

# Goal
* What is MQ2
* How to operate

<br />

# Practice
### What is MQ2
* MOS(Metal Oxide Semiconductor) type gas sensor
* Can detect LPG, Smoke, Alcohol, Propane, Hydrogen, Methan, Carbon Monoxide(CO)
* Detects gas using the change of resistance of the sensing material

<br />

### Specification

| | |
| --- | --- |
| Operating Voltage | 5V |
| Load Resistance | 20 KΩ |
| Heater Resistance | 33Ω ± 5% |
| Heating Consumption | < 800mw |
| Sensing Resistance | 10 KΩ - 60 KΩ |
| Concentration Scope | ~~200~~ 300 - 10,000 ppm) |
| Preheat Time | Over 24 hours |

<br />

> What is **ppm(Parts-per-million)**
> * Describe the amount of gas by volume in the air
> * The ratio of one gas to another
>
> ![screenshot001](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-001.png)

<br />

### Internal Structure

![screenshot002](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-002.png)

* MQ2 is enclosed in two layers of fine stainless steel mesh. It called **Anti-explosion network**
* It prevents an explosion by heater element which is inside the sensor
  * MQ2 is sensing flammable gases such as LPG, Propane and so on
* It leads only gaseous elements to pass inside the chamber

<br />

![screenshot003](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-003.png)

* The star-shaped structure
* **H**
  * Heats the sensing element and are connected through **Nickel-Chrominum coil(conductive alloy)
* **A & B**
  * Output signals to platinum wires
  * It is connected to the body of the sensing element
  * Conveys small changes in the current

<br />

![screenshot004](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-004.png)

![screenshot005](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-005.png)

* The Tin Dioxide(SnO<sub>2</sub>) is the most important material being sensitive towards combustible gases
* The ceramic substrate merely increases heating efficiency and ensures the sensor area is heated to a working temperature constantly

<br />

### How deos it work?
* 1. The tin dioxide is heated in air at high temperature

![screenshot006](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-006.png)

<br />

* 2. Oxygen is adsorbed on the surface
  * Donor electrons in the tin dioxide are attracted toward oxygen
  * This situation prevents electric current flow and the voltage goes down

![screenshot007](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-007.png)

![screenshot008](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-008.png)

<br />

* 3. Oxygen decreased as it reacts with gases
  * Eletrons are then released into the tin dioxide
  * Then, it allows current to flow freely through the snesor and the voltage goes up

![screenshot009](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-009.png)

![screenshot010](/assets/images/posts/2019/09/2019-09-04-iot-sensor-mq2-010.png)

<br />

* **i.e.** Cencentration of gases ∝ Voltage
  * Cencentration of gases ↑ -> Voltage ↑
  * Cencentration of gases ↓ -> Voltage ↓



<br />

--------------

## References
* [How MQ2 Gas/Smoke Sensor Works?](https://lastminuteengineers.com/mq2-gas-senser-arduino-tutorial/)