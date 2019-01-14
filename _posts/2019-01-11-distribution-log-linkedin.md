---
layout: post
title: "[Distrubuted System] 로그: 실시간 데이터에서 의미를 만들기 위해서 S/W 엔지니어가 알아야할 것 - Part1. 로그란?"
comments: true
author: dorbae
date: 2019-01-11 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart_thumnail.png
categories : [Distributed System,Log]
tags: [distribute,system,log,linkedin,Jay Kreps]
sitemap :
  changefreq : weekly
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

<br/>

## Part 1. 로그란 무엇인가?
* 로그는 시간 순으로 정렬된 레코드의 집합체이며, 추가만 가능
![logstructure](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-003.png)
* 시간으로 정렬된 데이터 => 분산 시스템을 이루는 본질 (bc, 물리적인 시간으로부터 decouple)
![logisenssential](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-004.png)
* 로그는 시간 순으로 정렬된 레코드들로 이뤄진 파일, 테이블의 한 종류
![logisrecord](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-005.png)
* 로그는 **언제, 무엇이 일어났는지**에 대한 기록
* 더 깊이 들어가기 전에, 명확히 해야할 것이 있다. 모든 프로그래머들은 어플리케이션에서 syslog나 log4j같은 로깅 프레임워크를 통하여 대부분 로컬에 쓰여지는 비정형화된 에러 메시지나 Trace만을 로그로 생각
* 필자는 이후부터 명확하게 하기 위해서 이러한 로그를 'application logging' 이라고 표현
* 'application logging'의 가장 큰 차이점은 사람이 주로 사람이 읽기 위해서, 'journal', 'data logs'를 위한 텍스트 로그라는 것

<br/>

### 데이터베이스에서의 로그
* 데이터베이스에서 로그는 여러 충돌이 일어날 수 있는 상황에서 다양하게 변화하는 데이터구조, 인덱스를 동기화 시킨다.
* 원자성과 지속성을 위해서 데이터베이스는 로그를 사용한다. 데이터베이스는 다양한 데이터구조를 변경하기 전에 변경할 레코드에 대한 정보를 로그로 쓴다.
* 즉, 로그는 무슨 일이 일어났는지에 대한 레코드이고, 데이터베이스의 테이블과 인덱스는 이 로그들 중의 유용한 데이터구조와 인덱스를 투영한다(나타낸다).
![logisprojection](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-006.jpeg)
* 또한 로그는 바로 지속 가능한 상태로 저장되기 때문에 문제가 생겼을 때, 다른 구조들을 복구하는데 중요하게 사용된다.
![datarestore](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-007.jpeg)
* 로그는 ACID를 충족하기 위해서 사용되기 시작해서 데이터베이스 간의 데이터 복제를 위해서 사용되고 있다. 이는 데이터베이스에서 일어난 변화의 순차적인 기록이 복제 데이터베이스 간의 동기화를 위해 필요하다는 것을 말한다.
![ideal](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-008.jpeg)
* 이러한 로그를 이용하는 방법은 데이터베이스 내부적으로만 사용되어 왔다. 하지만 이는 **모든 종류의 메시징, 데이터 흐름, 실시간 데이터 처리에 주요한 사상**이다.

<br/>

## 분산시스템에서의 로그
* 중앙화 로그에서 분산시스템으로의 접근은 State Machine Replication Principle의 관점에서 도래했다.
* **State Machine Replication Principle**이란 두 개의 의사결정을 할 수 있는 프로세스가 같은 상태에서 같은 입력과 같은 명령을 받으면, 같은 결과를 내고 결국에는 다시 같은 상태로 있게된다는 원리이다.
![smrp](/assets/images/posts/2019/01/2019-01-11-distribution-log-linkedin-009.jpeg)



--------     
## References
* [The Log: What every software engineer should know about real-time data's unifying abstraction(Jay Kreps, December 16, 2013)](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)
