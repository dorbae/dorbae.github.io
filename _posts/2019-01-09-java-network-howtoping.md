---
layout: post
title: "[Java] How to ping in Java"
comments: true
author: dorbae
date: 2019-01-09 +0900
categories : [Java,Network]
tags: [java, network, ping, icmp]
sitemap :
  changefreq : weekly
---

# Goal
* Java에서 Ping 구현

<br/>

# Practice
* Java에서는 ICMP 프로토콜을 지원하지 않는다. 따라서 아래와 같은 방법으로 네트워크가 닿을 수 있는지 구현 가능      
      
<div markdown="1" style="background: #272822; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<table><tbody>
<tr><td><pre style="line-height: 125%; margin: 0;">1
2
3
4
5</pre>
</td><td><pre style="line-height: 125%; margin: 0;"><span style="color: #66d9ef;">public</span> <span style="color: #66d9ef;">static</span> <span style="color: #66d9ef;">boolean</span> <span style="color: #a6e22e;">ping</span><span style="color: #f92672;">(</span> <span style="color: #f8f8f2;">String</span> <span style="color: #f8f8f2;">host</span><span style="color: #f92672;">,</span> <span style="color: #66d9ef;">int</span> <span style="color: #f8f8f2;">milisecondTimeout</span><span style="color: #f92672;">)</span> <span style="color: #66d9ef;">throws</span> <span style="color: #f8f8f2;">UnknownHostException</span><span style="color: #f92672;">,</span> <span style="color: #f8f8f2;">IOException</span> <span style="color: #f92672;">{</span>
  <span style="color: #f8f8f2;">java</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">net</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">InetAddress</span> <span style="color: #f8f8f2;">address</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">InetAddress</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">getByName</span><span style="color: #f92672;">(</span> <span style="color: #f8f8f2;">host</span><span style="color: #f92672;">);</span>
  <span style="color: #66d9ef;">return</span> <span style="color: #f8f8f2;">address</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">isReachable</span><span style="color: #f92672;">(</span> <span style="color: #f8f8f2;">milisecondTimeout</span><span style="color: #f92672;">);</span>
  
<span style="color: #f92672;">}</span>
</pre>
</td></tr>
</tbody></table>
</div>
