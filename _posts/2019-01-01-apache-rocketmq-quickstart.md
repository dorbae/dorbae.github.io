---
layout: post
title: "[RocketMQ] Quick-Start"
comments: true
author: dorbae
date: 2019-01-01 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart_thumnail.png
categories : [Apache,RocketMQ]
tags: [RocketMQ, quick-start, alibaba, mq, messaging queue, 알리바바]
sitemap :
  changefreq : weekly
---

# Goal
* RocketMQ란 무엇인가
* RocketMQ 설치 및 간단한 테스트

<br/>

# RocketMQ
  
* 낮은 latency와 고성능으로 분산 메시징과 스트리밍 처리를 제공하는 플랫폼
* 메시지의 신뢰성을 보장하고, 조 단위의 처리량과 유연한 확장성을 자랑
* 알리바바가 2012년부터 다량의 메시지를 처리하기 위해서, Apache ActiveMQ 5.13 버전 기반에서 분산 아키텍처를 도입하여 개발하기 시작
* 2016년 11월에 알리바바가 Apache 재단에 danation 하고, 2017년 2월에 Apache Top-Level 프로젝트로 선정
  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-001.png)
  
---
  
## 1. Download install file and unzip
* Prerequisite : 

  * 64bit OS, Linux/Unix/Mac is recommended
  * 64bit JDK 1.8+
  * Maven 3.2.x
  * Git
  * 4g+ free disk for Broker server
  
<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ wget http://mirror.navercorp.com/apache/rocketmq/{version}/rocketmq-all-{version}-bin-release.zip</span>
<span style="color: #ffffff">$ unzip rocketmq-all-{version}-bin-realase.zip</span>
</pre></div>


  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-002.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-003.png)  

<br/>

## 2. Setup environment variables

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ vi ~/.profile</span>
<span style="color: #ffffff">[edit]</span>
<span style="color: #ffffff">$ . ~/.profile</span>
</pre></div>
    
 

![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-004.png)    
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-005.png)
  
**export ROCKETMQ_HOME=[installed_directory]**  
**export PATH=$PATH:$ROCEKTMQ_HOME/bin**  
**export NAMESRV_ADDR={host}:{port}**    # for Name server connector address  

<br/>

## 3. Startup Name Server
#### 3.1. Run Error -> Edit JVM Options

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ vi $ROCKETMQ_HOME/bin/runserver.sh</span>

<span style="color: #ffffff">[Edit</span> <span style="color: #ffffff">:</span> <span style="color: #ffffff">Optimize memory size in your system]</span>
</pre></div>



  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-006.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-007.png)  

<br/>  

#### 3.2 Start Name Server in background

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ nohup mqnamesrv &gt; $ROCKETMQ_HOME/log/mqnamesrv.log  2&gt;&amp;1 &amp;</span>
<span style="color: #ffffff">$ tail -f $ROCKETMQ_HOME/log/mqnamesrv.log</span>
</pre></div>
  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-008.png)  
  
<br/> 

## 4. Start Broker Server

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ nohup mqbroker &gt; $ROCKETMQ_HOME/log/mqbroker.log  2&gt;&amp;1 &amp;</span>
<span style="color: #ffffff">$ tail -f $ROCKETMQ_HOME/log/mqbroker.log</span>
</pre></div>
  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-009.png)  

<br/>

#### 4.1. Run Error -> Edit JVM Options

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ vi $ROCKETMQ_HOME/bin/runbroker.sh</span>
<span style="color: #ffffff">[Edit</span> <span style="color: #ffffff">:</span> <span style="color: #ffffff">Optimize memory size in your system]</span>
</pre></div>
    
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-010.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-011.png)  
  
<br/>

## 5. Test Message Produce/Consume
#### 5.1. Start Producer

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ sh $ROCKETMQ_HOME/bin/tools.sh org.apache.rocketmq.example.quickstart.Producer</span>
</pre></div>
 
<br/>

#### 5.2. Start Consumer

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ sh $ROCKETMQ_HOME/bin/tools.sh org.apache.rocketmq.example.quickstart.Consumer</span>
</pre></div>

 
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-013.png)  

<br/>

## 6. Shutdown

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-style: italic; background-color: #0f140f"># Shutdown Broker</span>
<span style="color: #ffffff">$ mqshutdown broker</span>
<span style="color: #ffffff"># Shutdown Name Server</span>
<span style="color: #ffffff"># mqshtudown namesrv</span>
</pre></div>

![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-014.png)  

<br/>

## References
* [RocketMQ Tutorial](https://rocketmq.apache.org/docs/quick-start/)
* [RocketMQ WiKi](https://en.wikipedia.org/wiki/Apache_RocketMQ)


