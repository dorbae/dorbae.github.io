---
layout: post
title: "[Java] Java Thread States"
comments: true
author: dorbae
date: 2019-01-22 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-22-java-thread-diffentstatesofthread.jpg
categories : [Java,Thread]
tags: [java,thread]
sitemap :
  changefreq : weekly
---

# Goal
* Java Thread 상태의 종류를 알아보자
* Thread의 상태는 언제 변화하고 어떻게 변화하는지 알아보자

# Practice
## 1. Java Thread의 State
* **_NEW_**
    * Thread가 생성되었을 때, 기본 상태
    
* **_RUNNABLE_**
    * Thread가 start되면, RUNNABLE 상태로 변경
    * CPU를 점유하려고 대기 중인 상태. 즉, 실행할 수 있는 상태
    
* **_BLOCKED_**
    * 고유 락을 얻으려고 Block된 상태
    * 아래와 같은 두 가지 경우에 BLOCKED 상태가 된다.
        * synchronized block/method에 들어가기 위해서 lock을 기다릴 때
        * Object.wait() 메소드가 호출된 object의  고유 락을 다시 얻기 위해 기다릴 때
    
    > Java의 모든 객체는 Lock을 갖음. 이를 고유 락(Instrinsic Lock) 또는 모니터 락(Monitor Lock), 모니터(Monitor) 라고 한다.    

    > 원문에는 고유 락이라는 표현 대신 Monitor Lock이란 표현을 사용
        
* **_WAITING_**
    * Timout 없이 계속해서 대기하는 상태
    * 아래와 같은 메소드가 호출되면 WAITING 상태가 된다.
        * [Object.wait()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#wait())
        * [Thread.join()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Thread.html#join())
        * [LockSupport.park()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/locks/LockSupport.html#park())
     
* **_TIMED_WAITING_**
    * Timeout 시간동안 대기하는 상태
    * 아래와 같은 메소드가 호출되면 TIMED_WAITING 상태가 된다.
        * [Thread.spleep(milliseconds)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Thread.html#sleep(long))
        * [Object.wait(timeout), Object.wait(timeout, nanos)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#wait(long))
        * [Thread.join(timout), Thread.join(timeout, nanos)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Thread.html#join(long))
        * [LockSupport.partNanos(nanos)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/locks/LockSupport.html#parkNanos(long))
        * [LockSupport.parkUntil(deadline)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/locks/LockSupport.html#parkUntil(long))
        
* **_TERMINATED_**
    * Thread가 종료되었을 때, TERMINATED 상태가 된다.

<br/>

## 2. Java Thread State Transitions

![screenshot001](/assets/images/posts/2019/01/2019-01-22-java-thread-diffentstatesofthread-001.jpeg)

<br/>


------

## Refences
* [Java Code Geeks - Different State of Java Thread](https://www.javacodegeeks.com/2019/01/different-states-java-threads.html)