---
layout: post
title: "[ActiveMQ] Scheduled Message Tutorial"
comments: true
author: dorbae
date: 2019-02-06 +0900
categories : [Apache,ActiveMQ]
tags: [apache,activemq,mq,jms,broker,scheduled message]
sitemap :
  changefreq : weekly
---

# Goal
* Scheduled Message를 위한 브로커 서버 설정
* Scheduled Message 전송 클라이언트 코드 작성

<br/>

# 들어가며
* ActiveMQ는 5.4버전부터 persistent scheduler를 설정할 수 있다.
* Broker XML 설정을 통해서 이를 활성/비활성화 할 수 있다.
 
<br/>

# Practice
## 1. Broker 설정
* Broker 설정 파일 ($ACITVEMQ_HOME/conf/activemq.xml) 파일에 _**schedulerSupport="true"**_ 옵션 추가

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #6ab825; font-weight: bold">&lt;broker</span> <span style="color: #bbbbbb">xmlns=</span><span style="color: #ed9d13">&quot;http://activemq.apache.org/schema/core&quot;</span> <span style="color: #bbbbbb">brokerName=</span><span style="color: #ed9d13">&quot;DorbaeBroker&quot;</span> <span style="color: #bbbbbb">useJmx=</span><span style="color: #ed9d13">&quot;true&quot;</span> <span style="color: #bbbbbb">schedulerSupport=</span><span style="color: #ed9d13">&quot;true&quot;</span><span style="color: #6ab825; font-weight: bold">&gt;</span>

.
.
.

<span style="color: #6ab825; font-weight: bold">&lt;/broker&gt;</span>
</pre></div>

> Message property 중 **scheduledJobId** Job Scheduler가 사용하기 위해서 지정된 값이다. 메시지가 전송하기 전에 설정되는데, 메시지가 즉시 전송되거나 스케줄이 적용이 안 될 수도 있다.    
[Message Expiration(Time to Live) Confusion](/assets/posts/2019/01/2019-01-16-Apache-ActiveMQ-MessageExpirationConfusion.md) 참조

> 메시지를 수신했을 때, scheduledJobId를 사용할 경우, Camel Route를 적용할 때 message properties도 복사 후에 라우팅 시키도록 적용해야한다.
<br/>

## 2. Scheduled Message 전송
### 2.1. Scheduled Message 관련 설정
| **Property Name** | **Type** | **Description** |
| :---: | :---: | :--- |
| AMQ_SCHEDULED_DELAY | long | Broker가 메시지를 전달 받은 후 전송하기까지 대기 시간. 단위는 millisecond |
| AMQ_SCHEDULED_PERIOD | long | 메시지가 처음 전송된 후 반복적으로 다시 메시지를 보낼 때 대기 시간. 단위는 millisecond |
| AMQ_SCHEDULED_REPEAT | int | 메시지가 몇 번 반복적으로 전송할지 |
| AMQ_SCHEDULED_CRON | String | Cron 패턴에 따라서 메시지 전송 |

> AMQ_SCHEDULED_PERIOD, AMQ_SCHEDULED_REPEAT를 설정했을 때, 총 전송되는 메시지 건수는 AMQ_SCHEDULED_REPEAT를 + 1 (최초 전송)

> AMQ_SCHEDULED_CRON, AMQ_SCHEDULED_REPEAT를 설정할 경우, AMQ_SCHEDULED_REPEAT 횟수는 스케줄 때마다 적용된다.    
AMQ_SCHEDULED_REPEAT = 5    
AMQ_SCHEDULED_CRON = * * * * *    
와 같이 설정할 경우, 매 분마다 (AMQ_SCHEDULED_REPEAT + 1) 건이 전송. 60분동안 (60 * (5+1)) = 360건 전송


### 2.2. Client Java 코드

<div style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69
 70
 71
 72
 73
 74
 75
 76
 77
 78
 79
 80
 81
 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95
 96
 97
 98
 99
100
101
102</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f92672">package</span> <span style="color: #f8f8f2">io</span><span style="color: #f92672">.</span><span style="color: #a6e22e">dorbae</span><span style="color: #f92672">.</span><span style="color: #a6e22e">test</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">activemq</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">java.util.Properties</span><span style="color: #f92672">;</span>

<span style="color: #75715e">/*</span>
<span style="color: #75715e"> * ************************************************************************************</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> * ScheduledMessage.java</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * ************************************************************************************</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * @version 1.0.00 2016-07-22 dorbae Initialize</span>
<span style="color: #75715e"> * @since 2016-07-22</span>
<span style="color: #75715e"> * @author dorbae</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * ************************************************************************************</span>
<span style="color: #75715e"> */</span>
<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">class</span> <span style="color: #a6e22e">TestScheduledMessage</span> <span style="color: #f92672">{</span>

 <span style="color: #66d9ef">public</span> <span style="color: #a6e22e">TestScheduledMessage</span><span style="color: #f92672">()</span> <span style="color: #f92672">{</span>
  <span style="color: #75715e">// TODO Auto-generated constructor stub</span>
 <span style="color: #f92672">}</span>

 <span style="color: #66d9ef">public</span> <span style="color: #66d9ef">static</span> <span style="color: #66d9ef">void</span> <span style="color: #a6e22e">main</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">String</span><span style="color: #f92672">[]</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
  <span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">jmsFactory</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;org.apache.activemq.jndi.ActiveMQInitialContextFactory&quot;</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">connectionFactoryName</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;ConnectionFactory&quot;</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">jmsUrl</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;tcp://localhost:61616&quot;</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">clientId</span><span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;Test.ScheduledMessage&quot;</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">queueName</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;DORBAE.TEST&quot;</span><span style="color: #f92672">;</span>

  <span style="color: #f8f8f2">Properties</span> <span style="color: #f8f8f2">jmsProps</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">Properties</span><span style="color: #f92672">();</span>
  <span style="color: #f8f8f2">jmsProps</span><span style="color: #f92672">.</span><span style="color: #a6e22e">put</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">naming</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Context</span><span style="color: #f92672">.</span><span style="color: #a6e22e">INITIAL_CONTEXT_FACTORY</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">jmsFactory</span><span style="color: #f92672">);</span> 
  <span style="color: #f8f8f2">jmsProps</span><span style="color: #f92672">.</span><span style="color: #a6e22e">put</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">naming</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Context</span><span style="color: #f92672">.</span><span style="color: #a6e22e">PROVIDER_URL</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">jmsUrl</span><span style="color: #f92672">);</span>
  
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">naming</span><span style="color: #f92672">.</span><span style="color: #a6e22e">InitialContext</span> <span style="color: #f8f8f2">jndi</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ConnectionFactory</span> <span style="color: #f8f8f2">connectionFactory</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Connection</span> <span style="color: #f8f8f2">conn</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Session</span> <span style="color: #f8f8f2">session</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Destination</span> <span style="color: #f8f8f2">destination</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Message</span> <span style="color: #f8f8f2">message</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">MessageProducer</span> <span style="color: #f8f8f2">producer</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">;</span>
  
  <span style="color: #66d9ef">try</span> <span style="color: #f92672">{</span>
   <span style="color: #f8f8f2">jndi</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">naming</span><span style="color: #f92672">.</span><span style="color: #a6e22e">InitialContext</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">jmsProps</span><span style="color: #f92672">);</span>
   <span style="color: #f8f8f2">connectionFactory</span> <span style="color: #f92672">=</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ConnectionFactory</span><span style="color: #f92672">)</span><span style="color: #f8f8f2">jndi</span><span style="color: #f92672">.</span><span style="color: #a6e22e">lookup</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">connectionFactoryName</span><span style="color: #f92672">);</span>
   <span style="color: #f8f8f2">conn</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">connectionFactory</span><span style="color: #f92672">.</span><span style="color: #a6e22e">createConnection</span><span style="color: #f92672">();</span>
   <span style="color: #f8f8f2">conn</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setClientID</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">clientId</span><span style="color: #f92672">);</span>
   <span style="color: #f8f8f2">session</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">conn</span><span style="color: #f92672">.</span><span style="color: #a6e22e">createSession</span><span style="color: #f92672">(</span> <span style="color: #66d9ef">false</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">javax</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jms</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Session</span><span style="color: #f92672">.</span><span style="color: #a6e22e">AUTO_ACKNOWLEDGE</span><span style="color: #f92672">);</span> <span style="color: #75715e">// Not Transacted</span>
   <span style="color: #f8f8f2">destination</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">session</span><span style="color: #f92672">.</span><span style="color: #a6e22e">createQueue</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">queueName</span><span style="color: #f92672">);</span>
   <span style="color: #f8f8f2">producer</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">session</span><span style="color: #f92672">.</span><span style="color: #a6e22e">createProducer</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">destination</span><span style="color: #f92672">);</span>
   <span style="color: #f8f8f2">message</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">session</span><span style="color: #f92672">.</span><span style="color: #a6e22e">createTextMessage</span><span style="color: #f92672">(</span> <span style="color: #e6db74">&quot;http://dorbae.blogspot.com&quot;</span><span style="color: #f92672">);</span>
   
   <span style="color: #75715e">/*</span>
<span style="color: #75715e">    * For Delay Message</span>
<span style="color: #75715e">    * </span>
<span style="color: #75715e">    * Message will be sent to destination after delay times</span>
<span style="color: #75715e">    *  </span>
<span style="color: #75715e">    * </span>
<span style="color: #75715e">   long delayTime = 60L * 1000L; // 1 Minute</span>
<span style="color: #75715e">   message.setLongProperty( org.apache.activemq.ScheduledMessage.AMQ_SCHEDULED_DELAY, delayTime);</span>
<span style="color: #75715e">    *</span>
<span style="color: #75715e">    */</span>
   
   <span style="color: #75715e">/*</span>
<span style="color: #75715e">    * For Period Repeat</span>
<span style="color: #75715e">    * </span>
<span style="color: #75715e">    * Repeated messages will be sent to destination waiting period times between each re-delivery </span>
<span style="color: #75715e">    * </span>
<span style="color: #75715e">   long period = 10L * 1000L;</span>
<span style="color: #75715e">   int repeat = 5;</span>
<span style="color: #75715e">   message.setLongProperty( org.apache.activemq.ScheduledMessage.AMQ_SCHEDULED_PERIOD, period);</span>
<span style="color: #75715e">   message.setIntProperty( org.apache.activemq.ScheduledMessage.AMQ_SCHEDULED_REPEAT, repeat);</span>
<span style="color: #75715e">    *</span>
<span style="color: #75715e">    */</span>
   
   <span style="color: #75715e">/*</span>
<span style="color: #75715e">    * For Cron</span>
<span style="color: #75715e">    * </span>
<span style="color: #75715e">    * Message will be sent to destination according as cron pattern </span>
<span style="color: #75715e">    *</span>
<span style="color: #75715e">    */</span>
   <span style="color: #f8f8f2">message</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setStringProperty</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">org</span><span style="color: #f92672">.</span><span style="color: #a6e22e">apache</span><span style="color: #f92672">.</span><span style="color: #a6e22e">activemq</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ScheduledMessage</span><span style="color: #f92672">.</span><span style="color: #a6e22e">AMQ_SCHEDULED_CRON</span><span style="color: #f92672">,</span> <span style="color: #e6db74">&quot;0 * * * *&quot;</span><span style="color: #f92672">);</span>
   
   <span style="color: #f8f8f2">producer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">send</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">message</span><span style="color: #f92672">);</span>
   
  <span style="color: #f92672">}</span> <span style="color: #66d9ef">catch</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">Exception</span> <span style="color: #f8f8f2">e</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
   <span style="color: #f8f8f2">e</span><span style="color: #f92672">.</span><span style="color: #a6e22e">printStackTrace</span><span style="color: #f92672">();</span>
   
  <span style="color: #f92672">}</span> <span style="color: #66d9ef">finally</span> <span style="color: #f92672">{</span>
   <span style="color: #66d9ef">if</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">session</span> <span style="color: #f92672">!=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">)</span>
    <span style="color: #66d9ef">try</span> <span style="color: #f92672">{</span>
     <span style="color: #f8f8f2">session</span><span style="color: #f92672">.</span><span style="color: #a6e22e">close</span><span style="color: #f92672">();</span>
    <span style="color: #f92672">}</span> <span style="color: #66d9ef">catch</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">Exception</span> <span style="color: #f8f8f2">e</span><span style="color: #f92672">)</span> <span style="color: #f92672">{}</span>
   
   <span style="color: #66d9ef">if</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">conn</span> <span style="color: #f92672">!=</span> <span style="color: #66d9ef">null</span><span style="color: #f92672">)</span>
    <span style="color: #66d9ef">try</span> <span style="color: #f92672">{</span>
     <span style="color: #f8f8f2">conn</span><span style="color: #f92672">.</span><span style="color: #a6e22e">close</span><span style="color: #f92672">();</span>
    <span style="color: #f92672">}</span> <span style="color: #66d9ef">catch</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">Exception</span> <span style="color: #f8f8f2">e</span><span style="color: #f92672">)</span> <span style="color: #f92672">{}</span>
  <span style="color: #f92672">}</span>
 <span style="color: #f92672">}</span>

<span style="color: #f92672">}</span>
</pre></td></tr></table></div>

* Scheduled Message Properties

| **Property Name** | **Description** |
| :--- | :--- |
| ScheduledMessage.AMQ_SCHEDULED_CRON | AMQ_SCHEDULED_CRON |
| ScheduledMessage.AMQ_SCHEDULED_DELAY | AMQ_SCHEDULED_DELAY |
| ScheduledMessage.AMQ_SCHEDULED_ID	| scheduledJobId |
| ScheduledMessage.AMQ_SCHEDULED_PERIOD	| AMQ_SCHEDULED_PERIOD |
| ScheduledMessage.AMQ_SCHEDULED_REPEAT	| AMQ_SCHEDULED_REPEAT |
| ScheduledMessage.AMQ_SCHEDULER_ACTION	| AMQ_SCHEDULER_ACTION |
| ScheduledMessage.AMQ_SCHEDULER_ACTION_BROWSE	| BROWSE |
| ScheduledMessage.AMQ_SCHEDULER_ACTION_END_TIME |  ACTION_END_TIME |
| ScheduledMessage.AMQ_SCHEDULER_ACTION_REMOVE | REMOVE |
| ScheduledMessage.AMQ_SCHEDULER_ACTION_REMOVEALL | REMOVEALL |
| ScheduledMessage.AMQ_SCHEDULER_ACTION_START_TIME | ACTION_START_TIME |
| ScheduledMessage.AMQ_SCHEDULER_MANAGEMENT_DESTINATION|  ActiveMQ.Scheduler.Management |

<br/>

-------

## References
* [ActiveMQ > Features > Message Features > Delay and Schedule Message Delivery](http://activemq.apache.org/delay-and-schedule-message-delivery.html)
* [ActiveMQ Site](http://activemq.apache.org/schema/core/activemq-core-5.15.3-schema.html)


