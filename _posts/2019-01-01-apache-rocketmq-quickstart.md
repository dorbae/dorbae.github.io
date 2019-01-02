---
layout: posts
title: \[RocketMQ\] Quick-Start
comments: true
categories : [Apache,RocketMQ]
tags: [RocketMQ, quick-start, alibaba, mq, messaging queue, 알리바바]
---

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
  
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> wget http://mirror.navercorp.com/apache/rocketmq/<span style="color: #666666">{</span>version<span style="color: #666666">}</span>/rocketmq-all-<span style="color: #666666">{</span>version<span style="color: #666666">}</span>-bin-release.zip
<span style="color: #000080; font-weight: bold">$</span> unzip rocketmq-all-<span style="color: #666666">{</span>version<span style="color: #666666">}</span>-bin-realase.zip
</pre></div>  

  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-002.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-003.png)  
  
## 2. Setup environment variables
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> vi ~/.profile
<span style="color: #888888">[edit]</span>


<span style="color: #000080; font-weight: bold">$</span> . ~/.profile
</pre></div>    
 

![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-004.png)    
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-005.png)
  
**export ROCKETMQ_HOME=[installed_directory]**  
**export PATH=$PATH:$ROCEKTMQ_HOME/bin**  
**export NAMESRV_ADDR={host}:{port}**    # for Name server connector address  

  
## 3. Startup Name Server
#### 3.1. Run Error -> Edit JVM Options

<!-- HTML generated using hilite.me --><div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> vi <span style="color: #19177C">$ROCKETMQ_HOME</span>/bin/runserver.sh
<span style="color: #888888">[Edit : Optimize memory size in your system]</span>
</pre></div>  

  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-006.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-007.png)  
  
#### 3.2 Start Name Server in background

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> nohup mqnamesrv &gt; <span style="color: #19177C">$ROCKETMQ_HOME</span>/log/mqnamesrv.log  2&gt;&amp;1 &amp;
<span style="color: #000080; font-weight: bold">$</span> tail -f <span style="color: #19177C">$ROCKETMQ_HOME</span>/log/mqnamesrv.log
</pre></div>  

  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-008.png)  
  
## 4. Start Broker Server

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> nohup mqbroker &gt; <span style="color: #19177C">$ROCKETMQ_HOME</span>/log/mqbroker.log  2&gt;&amp;1 &amp;
<span style="color: #000080; font-weight: bold">$</span> tail -f <span style="color: #19177C">$ROCKETMQ_HOME</span>/log/mqbroker.log
</pre></div>  

  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-009.png)  
  
#### 4.1. Run Error -> Edit JVM Options

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> vi <span style="color: #19177C">$ROCKETMQ_HOME</span>/bin/runbroker.sh
<span style="color: #888888">[Edit : Optimize memory size in your system]</span>
</pre></div>  

    
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-010.png)  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-011.png)  
  
## 5. Test Message Produce/Consume
#### 5.1. Start Producer

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> sh <span style="color: #19177C">$ROCKETMQ_HOME</span>/bin/tools.sh org.apache.rocketmq.example.quickstart.Producer
</pre></div>  
<!-- HTML generated using hilite.me --><div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> sh <span style="color: #19177C">$ROCKETMQ_HOME</span>/bin/tools.sh org.apache.rocketmq.example.quickstart.Consumer
</pre></div>  

    
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-013.png)  
  
## 6. Shutdown

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">#</span> Shutdown Broker
<span style="color: #000080; font-weight: bold">$</span> mqshutdown broker
<span style="color: #000080; font-weight: bold">#</span> Shutdown Name Server
<span style="color: #000080; font-weight: bold">#</span> mqshtudown namesrv
</pre></div>  

  
![RocketMQ Architecture](/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart-014.png)  
* References  
  * [RocketMQ Tutorial](https://rocketmq.apache.org/docs/quick-start/)
  * [RocketMQ WiKi](https://en.wikipedia.org/wiki/Apache_RocketMQ)


