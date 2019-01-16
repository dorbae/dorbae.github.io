---
layout: post
title: "[ActiveMQ] Message Expiration(Time to Live) Confusion"
comments: true
author: dorbae
date: 2019-01-16 +0900
categories : [Apache,ActiveMQ]
tags: [apache,activemq,mq,expriation,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* 설정한 Expiration Time과 다르게 작동하거나, 메시지가 바로 파기 되는 문제를 해결하고자 한다.

<br/>

# 들어가며
* ActiveMQ에서는 메시지 속성 중 Expration Time이 있다.
* Producer는 메시지를 전송하기 전에 
* 설정한 시간동안 메시지가 빠져나가지 않을 경우, 해당 메시지는 파기된다.

<br/>

# 발생원인
* JMS Header의 **JMS Timestamp** 는 메시지를 전송하는 클라이언트 시스템 시간에 종속된다.
* JMS Expiration은 JMS Timestamp 시간을 기준으로 한다.
  * 예를 들어, Producer 클라이언트의 시스템 시간이 2016-03-04 11:00:00.000 이라고 가정.
  * TTL(Time To Live)를 60000L(60초)로 설정
  * JMS Timestamp : 2016-03-04 11:00:00.000
  * JMS Expiration : 2016-03-04 11:01:00.000
  * 참조 코드

![screenshot001](/assets/images/posts/2019/01/2019-01-16-Apache-ActiveMQ-MessageExpirationConfusion-001.jpg)

* 실제 메시지를 파기 시키는건 ActiveMQ 서버
* ActiveMQ 서버는 서버 시스템 시간 기준으로 JMS Expiration이 시스템 시간을 초과하면 메시지를 파기
* 클라이언트와 서버의 시스템 시간이 상이해서 설정한 TTL과 다르게 작동

![screenshot002](/assets/images/posts/2019/01/2019-01-16-Apache-ActiveMQ-MessageExpirationConfusion-002.jpg)

<br/>

# 해결방법
* 클라이언트와 서버 모두 NTP 동기화를 통해서 시스템 시간을 동기화 시켜준다.
* [[Linux] NTP 설정]() 참조