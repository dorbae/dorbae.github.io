---
layout: post
title: "[Java] NIO DatagramChannel Tutorial"
comments: true
author: dorbae
date: 2019-01-07 +0900
categories : [Java,NIO]
tags: [java, nio, tutorial, datagram, channel, udp, socket]
---

## DatgramChannel Receiver

<div markdown="1" style="background: #272822; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<table><tbody>
<tr><td><pre style="line-height: 125%; margin: 0;"> 1
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
84</pre>
</td><td><pre style="line-height: 125%; margin: 0;"><span style="color: #75715e;">/**</span>
<span style="color: #75715e;"> *****************************************************************</span>
<span style="color: #75715e;"> * </span>
<span style="color: #75715e;"> * NIOUDPRecvTest.java</span>
<span style="color: #75715e;"> * </span>
<span style="color: #75715e;"> * NIO DatagramChannel Receiver</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> *****************************************************************</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> * @version 1.0.0 2017-10-11 dorbae 최초생성</span>
<span style="color: #75715e;"> * @since 1.0.0</span>
<span style="color: #75715e;"> * @author dorbae</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> */</span>
<span style="color: #f92672;">package</span> <span style="color: #f8f8f2;">test</span><span style="color: #f92672;">;</span>

<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.io.IOException</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.net.InetSocketAddress</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.nio.ByteBuffer</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.nio.channels.DatagramChannel</span><span style="color: #f92672;">;</span>

<span style="color: #66d9ef;">public</span> <span style="color: #66d9ef;">class</span> <span style="color: #a6e22e;">NIOUDPRecvTest</span> <span style="color: #f92672;">{</span>

 <span style="color: #75715e;">/**</span>
<span style="color: #75715e;">  *</span>
<span style="color: #75715e;">  * @version 1.0.0 2017-10-11 dorbae 최초생성</span>
<span style="color: #75715e;">  * @since 1.0.0</span>
<span style="color: #75715e;">  * @author dorbae</span>
<span style="color: #75715e;">  *</span>
<span style="color: #75715e;">  * @param args</span>
<span style="color: #75715e;">  */</span>
 <span style="color: #66d9ef;">public</span> <span style="color: #66d9ef;">static</span> <span style="color: #66d9ef;">void</span> <span style="color: #a6e22e;">main</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">String</span><span style="color: #f92672;">[]</span> <span style="color: #f8f8f2;">args</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{</span>
  <span style="color: #f8f8f2;">DatagramChannel</span> <span style="color: #f8f8f2;">channel</span> <span style="color: #f92672;">=</span> <span style="color: #66d9ef;">null</span><span style="color: #f92672;">;</span>
  <span style="color: #66d9ef;">try</span> <span style="color: #f92672;">{</span>
   <span style="color: #f8f8f2;">channel</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">DatagramChannel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">open</span><span style="color: #f92672;">();</span>
   <span style="color: #f8f8f2;">channel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">socket</span><span style="color: #f92672;">().</span><span style="color: #a6e22e;">bind</span><span style="color: #f92672;">(</span><span style="color: #66d9ef;">new</span> <span style="color: #f8f8f2;">InetSocketAddress</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"localhost"</span><span style="color: #f92672;">,</span> <span style="color: #ae81ff;">9000</span><span style="color: #f92672;">));</span>

  <span style="color: #f92672;">}</span> <span style="color: #66d9ef;">catch</span> <span style="color: #f92672;">(</span><span style="color: #f8f8f2;">IOException</span> <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{</span>
   <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">printStackTrace</span><span style="color: #f92672;">();</span>
   <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">exit</span><span style="color: #f92672;">(</span><span style="color: #ae81ff;">1</span><span style="color: #f92672;">);</span>
  <span style="color: #f92672;">}</span>
  
  <span style="color: #f8f8f2;">ByteBuffer</span> <span style="color: #f8f8f2;">buf</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">ByteBuffer</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">allocate</span><span style="color: #f92672;">(</span><span style="color: #ae81ff;">256</span><span style="color: #f92672;">);</span>
  <span style="color: #66d9ef;">byte</span><span style="color: #f92672;">[]</span> <span style="color: #f8f8f2;">buffer</span> <span style="color: #f92672;">=</span> <span style="color: #66d9ef;">new</span> <span style="color: #66d9ef;">byte</span><span style="color: #f92672;">[</span><span style="color: #ae81ff;">256</span><span style="color: #f92672;">];</span>
  <span style="color: #66d9ef;">int</span> <span style="color: #f8f8f2;">limit</span> <span style="color: #f92672;">=</span> <span style="color: #ae81ff;">0</span><span style="color: #f92672;">;</span>
  <span style="color: #66d9ef;">try</span> <span style="color: #f92672;">{</span>
   <span style="color: #66d9ef;">while</span> <span style="color: #f92672;">(</span><span style="color: #66d9ef;">true</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{</span>
    <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">clear</span><span style="color: #f92672;">();</span>
    <span style="color: #66d9ef;">try</span> <span style="color: #f92672;">{</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"\nWaiting..."</span><span style="color: #f92672;">);</span>
     <span style="color: #f8f8f2;">channel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">receive</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">);</span>
     <span style="color: #f8f8f2;">limit</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">limit</span><span style="color: #f92672;">();</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"buf.limit()="</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">limit</span><span style="color: #f92672;">);</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"buf.capacity()="</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">capacity</span><span style="color: #f92672;">());</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"buf.position()="</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">position</span><span style="color: #f92672;">());</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"buf.arrayOffset()="</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">arrayOffset</span><span style="color: #f92672;">());</span>

     <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">flip</span><span style="color: #f92672;">();</span>
     <span style="color: #f8f8f2;">limit</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">limit</span><span style="color: #f92672;">();</span>
     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"buf.limit()="</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">limit</span><span style="color: #f92672;">);</span>

     <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">get</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">buffer</span><span style="color: #f92672;">,</span> <span style="color: #ae81ff;">0</span><span style="color: #f92672;">,</span> <span style="color: #f8f8f2;">limit</span><span style="color: #f92672;">);</span>

     <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">out</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">println</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"data="</span> <span style="color: #f92672;">+</span> <span style="color: #66d9ef;">new</span> <span style="color: #f8f8f2;">String</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">buffer</span><span style="color: #f92672;">,</span> <span style="color: #ae81ff;">0</span><span style="color: #f92672;">,</span> <span style="color: #f8f8f2;">limit</span><span style="color: #f92672;">,</span> <span style="color: #e6db74;">"utf8"</span><span style="color: #f92672;">));</span>

    <span style="color: #f92672;">}</span> <span style="color: #66d9ef;">catch</span> <span style="color: #f92672;">(</span><span style="color: #f8f8f2;">IOException</span> <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{</span>
     <span style="color: #66d9ef;">break</span><span style="color: #f92672;">;</span>
    <span style="color: #f92672;">}</span>

   <span style="color: #f92672;">}</span>

  <span style="color: #f92672;">}</span> <span style="color: #66d9ef;">catch</span> <span style="color: #f92672;">(</span><span style="color: #f8f8f2;">Exception</span> <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{</span>
   <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">printStackTrace</span><span style="color: #f92672;">();</span>
  
  <span style="color: #f92672;">}</span> <span style="color: #66d9ef;">finally</span> <span style="color: #f92672;">{</span>
   <span style="color: #66d9ef;">if</span> <span style="color: #f92672;">(</span><span style="color: #f8f8f2;">channel</span> <span style="color: #f92672;">!=</span> <span style="color: #66d9ef;">null</span><span style="color: #f92672;">)</span>
    <span style="color: #66d9ef;">try</span> <span style="color: #f92672;">{</span>
     <span style="color: #f8f8f2;">channel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">close</span><span style="color: #f92672;">();</span>
    <span style="color: #f92672;">}</span> <span style="color: #66d9ef;">catch</span> <span style="color: #f92672;">(</span><span style="color: #f8f8f2;">IOException</span> <span style="color: #f8f8f2;">e</span><span style="color: #f92672;">)</span> <span style="color: #f92672;">{}</span>
  <span style="color: #f92672;">}</span>
  
 <span style="color: #f92672;">}</span> 

<span style="color: #f92672;">}</span>
</pre>
</td></tr>
</tbody></table>
</div>
     
        
    
## DatagramChannel Sender     
    
<div markdown="1" style="background: #272822; border-width: 0.1em 0.1em 0.1em 0.8em; border: solid gray; overflow: auto; padding: 0.2em 0.6em; width: auto;">
<table><tbody>
<tr><td><pre style="line-height: 125%; margin: 0;"> 1
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
49</pre>
</td><td><pre style="line-height: 125%; margin: 0;"><span style="color: #75715e;">/**</span>
<span style="color: #75715e;"> *****************************************************************</span>
<span style="color: #75715e;"> * </span>
<span style="color: #75715e;"> * NIOUDPSendTest.java</span>
<span style="color: #75715e;"> * </span>
<span style="color: #75715e;"> * NIO DatagramChannel Sender</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> *****************************************************************</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> * @version 1.0.0 2017-10-11 dorbae 최초생성</span>
<span style="color: #75715e;"> * @since 1.0.0</span>
<span style="color: #75715e;"> * @author dorbae</span>
<span style="color: #75715e;"> *</span>
<span style="color: #75715e;"> */</span>
<span style="color: #f92672;">package</span> <span style="color: #f8f8f2;">test</span><span style="color: #f92672;">;</span>

<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.io.IOException</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.net.InetSocketAddress</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.nio.ByteBuffer</span><span style="color: #f92672;">;</span>
<span style="color: #f92672;">import</span> <span style="color: #f8f8f2;">java.nio.channels.DatagramChannel</span><span style="color: #f92672;">;</span>

<span style="color: #66d9ef;">public</span> <span style="color: #66d9ef;">class</span> <span style="color: #a6e22e;">NIOUDPSendTest</span> <span style="color: #f92672;">{</span>

 <span style="color: #75715e;">/**</span>
<span style="color: #75715e;">  *</span>
<span style="color: #75715e;">  * @version 1.0.0 2017-10-11 dorbae 최초생성</span>
<span style="color: #75715e;">  * @since 1.0.0</span>
<span style="color: #75715e;">  * @author dorbae</span>
<span style="color: #75715e;">  *</span>
<span style="color: #75715e;">  * @param args</span>
<span style="color: #75715e;">  * @throws IOException </span>
<span style="color: #75715e;">  */</span>
 <span style="color: #66d9ef;">public</span> <span style="color: #66d9ef;">static</span> <span style="color: #66d9ef;">void</span> <span style="color: #a6e22e;">main</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">String</span><span style="color: #f92672;">[]</span> <span style="color: #f8f8f2;">args</span><span style="color: #f92672;">)</span> <span style="color: #66d9ef;">throws</span> <span style="color: #f8f8f2;">IOException</span> <span style="color: #f92672;">{</span>
  <span style="color: #f8f8f2;">String</span> <span style="color: #f8f8f2;">message</span> <span style="color: #f92672;">=</span> <span style="color: #e6db74;">"한글 String to write to file..."</span> <span style="color: #f92672;">+</span> <span style="color: #f8f8f2;">System</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">currentTimeMillis</span><span style="color: #f92672;">();</span>

  
  <span style="color: #f8f8f2;">DatagramChannel</span> <span style="color: #f8f8f2;">channel</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">DatagramChannel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">open</span><span style="color: #f92672;">();</span>
  
  
  <span style="color: #f8f8f2;">ByteBuffer</span> <span style="color: #f8f8f2;">buf</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">ByteBuffer</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">allocate</span><span style="color: #f92672;">(</span><span style="color: #ae81ff;">256</span><span style="color: #f92672;">);</span>
  <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">clear</span><span style="color: #f92672;">();</span>
  <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">put</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">message</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">getBytes</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"utf8"</span><span style="color: #f92672;">));</span>
  <span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">flip</span><span style="color: #f92672;">();</span>

  <span style="color: #66d9ef;">int</span> <span style="color: #f8f8f2;">bytesSent</span> <span style="color: #f92672;">=</span> <span style="color: #f8f8f2;">channel</span><span style="color: #f92672;">.</span><span style="color: #a6e22e;">send</span><span style="color: #f92672;">(</span><span style="color: #f8f8f2;">buf</span><span style="color: #f92672;">,</span> <span style="color: #66d9ef;">new</span> <span style="color: #f8f8f2;">InetSocketAddress</span><span style="color: #f92672;">(</span><span style="color: #e6db74;">"localhost"</span><span style="color: #f92672;">,</span> <span style="color: #ae81ff;">9000</span><span style="color: #f92672;">));</span>

 <span style="color: #f92672;">}</span>

<span style="color: #f92672;">}</span>
</pre>
</td></tr>
</tbody></table>
</div>
