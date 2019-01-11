---
layout: post
title: "[Distrubuted System] 로그: 실시간 데이터에서 의미를 만들기 위해서 S/W 엔지니어가 알아야할 것 - Part1. 로그란?"
comments: true
author: dorbae
date: 2019-01-11 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart_thumnail.png
categories : [Distributed System,Log]
tags: [distribute,sysstem,log]
---

* 다음 글은 링크드인 엔지니어링에 기재된 [The Log: What every software engineer should know about real-time data's unifying abstraction(Jay Kreps, December 16, 2013)](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying) 를 해석 및 재정리    
      

## 들어가며    
* 필자는 2007년 LinkedIn에 들어가, Monolithic, 중앙화된 데이터베이스의 한계를 뛰어넘어 분산 시스템으로 전환해왔다
![distibutedsystem](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-001.jpg)
* 필자는 분산 그래프 데이터베이스, 백엔드 분산 검색 엔진, 하둡 1/2 세대 Key/Value 저장소를 개발하고 구축/적용했다.
![distibutedsystemdo](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-002.jpg)
* 필자는 이런 일들을 진행하면서 느낀점은 <span style="color:red">**분산 시스템의 가장 중요한 핵심은 로그**</span>이다.
* Write-Ahead 로그는 컴퓨터만큼이나 오랜 시간동안 존재했으며, 많은 분산 데이터 시스템과 실시간 어플리케이션 구조의 핵심이다. 이 로그를 우리는 commit 로그 또는 transaction 로그라고도 부른다.
* 그러므로 로그에 대한 이해없이 데이터베이스, NoSQL, key/value 저장소, 복제, 네트워크 합의 알고리즘, 하둡, 버전 관리, 대부분의 S/W 시스템을 완벽하게 이해할 수 없다.
* 하지만 대부분의 S/W 엔지니어들은 로그에 관심을 갖지 않는다.
* 그래서 필자는 이런 로그에 대한 이해도를 높이고자 글을 쓰게 되었고, 글에서는 로그란 무엇이고, 데이터 통합, 실시간 처리, 시스템 구축에 있어서 로그는 어떻게 쓰이는지를 설명한다.

## Part 1. 로그란 무엇인가?
