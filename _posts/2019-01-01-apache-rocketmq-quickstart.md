# RocketMQ
  
* 낮은 latency와 고성능으로 분산 메시징과 스트리밍 처리를 제공하는 플랫폼
* 메시지의 신뢰성을 보장하고, 조 단위의 처리량과 유연한 확장성을 자랑
* 알리바바가 2012년부터 다량의 메시지를 처리하기 위해서, Apache ActiveMQ 5.13 버전 기반에서 분산 아키텍처를 도입하여 개발하기 시작
* 2016년 11월에 알리바바가 Apache 재단에 danation 하고, 2017년 2월에 Apache Top-Level 프로젝트로 선정
---
  
## 1. Download install file and unzip
* Prerequisite : 

  * 64bit OS, Linux/Unix/Mac is recommended
  * 64bit JDK 1.8+
  * Maven 3.2.x
  * Git
  * 4g+ free disk for Broker server
  
<div markdown="1" style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> wget http://mirror.navercorp.com/apache/rocketmq/<span style="color: #ce5c00; font-weight: bold;">{</span>version<span style="color: #ce5c00; font-weight: bold;">}</span>/rocketmq-all-<span style="color: #ce5c00; font-weight: bold;">{</span>version<span style="color: #ce5c00; font-weight: bold;">}</span>-bin-release.zip
<span style="color: #8f5902;">$</span> unzip rocketmq-all-<span style="color: #ce5c00; font-weight: bold;">{</span>version<span style="color: #ce5c00; font-weight: bold;">}</span>-bin-realase.zip
</pre>
</div>
  
## 2. Setup environment variables
<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> vi ~/.profile

<span style="color: black; font-style: italic;">[edit]</span>

<span style="color: #8f5902;">$</span> . ~/.profile
</pre>
</div>

**export ROCKETMQ_HOME=[installed_directory]**  
**export PATH=$PATH:$ROCEKTMQ_HOME/bin**  
**export NAMESRV_ADDR={host}:{port}**    # for Name server connector address  

  
## 3. Startup Name Server
#### 3.1. Run Error -> Edit JVM Options

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> vi <span style="color: black;">$ROCKETMQ_HOME</span>/bin/runserver.sh
<span style="color: black; font-style: italic;">[Edit : Optimize memory size in your system]</span>
</pre>
</div>

#### 3.2 Start Name Server in background

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> nohup mqnamesrv &gt; <span style="color: black;">$ROCKETMQ_HOME</span>/log/mqnamesrv.log  2&gt;&amp;1 &amp;
<span style="color: #8f5902;">$</span> tail -f <span style="color: black;">$ROCKETMQ_HOME</span>/log/mqnamesrv.log
</pre>
</div>
  
  
## 4. Start Broker Server

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> nohup mqbroker &gt; <span style="color: black;">$ROCKETMQ_HOME</span>/log/mqbroker.log  2&gt;&amp;1 &amp;
<span style="color: #8f5902;">$</span> tail -f <span style="color: black;">$ROCKETMQ_HOME</span>/log/mqbroker.log
</pre>
</div>

#### 4.1. Run Error -> Edit JVM Options

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> vi <span style="color: black;">$ROCKETMQ_HOME</span>/bin/runbroker.sh

<span style="color: black; font-style: italic;">[Edit : Optimize memory size in your system]</span>
</pre>
</div>
  
    
## 5. Test Message Produce/Consume
#### 5.1. Start Producer

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> sh <span style="color: black;">$ROCKETMQ_HOME</span>/bin/tools.sh org.apache.rocketmq.example.quickstart.Producer
</pre>
</div>

#### 5.2. Start Consumer

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">$</span> sh <span style="color: black;">$ROCKETMQ_HOME</span>/bin/tools.sh org.apache.rocketmq.example.quickstart.Consumer
</pre>
</div>
  
    
## 6. Shutdown

<div style="background: #f8f8f8; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<pre style="line-height: 125%; margin: 0;"><span style="color: #8f5902;">#</span> Shutdown Broker
<span style="color: #8f5902;">$</span> mqshutdown broker

<span style="color: #8f5902;">#</span> Shutdown Name Server
<span style="color: #8f5902;">#</span> mqshtudown namesrv
</pre>
</div>

* References  
  * [RocketMQ Tutorial](https://rocketmq.apache.org/docs/quick-start/)
  * [RocketMQ WiKi] \(https://en.wikipedia.org/wiki/Apache_RocketMQ)


