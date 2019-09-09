---
layout: post
title: "[Java] Jackson JSON 'Unrecognized token ***"
comments: true
author: dorbae
date: 2019-09-09 +0900
categories : [Java,Json]
tags: [java,json,troubleshooting]
sitemap :
  changefreq : weekly
---

# Problem
* I receive JSON data from Django REST Server
* However, it caused 'Unrecognized token' error
* In my case, this error occured by 'True' and 'None'

<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
14</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #ae81ff">2019</span><span style="color: #f92672">-</span><span style="color: #ae81ff">09</span><span style="color: #f92672">-</span><span style="color: #ae81ff">06</span> <span style="color: #ae81ff">17</span><span style="color: #f92672">:</span><span style="color: #ae81ff">20</span><span style="color: #f92672">:</span><span style="color: #ae81ff">57.019</span> <span style="color: #ae81ff">28853</span><span style="color: #f92672">-</span><span style="color: #ae81ff">28945</span><span style="color: #f92672">/***</span> <span style="color: #f8f8f2">E</span><span style="color: #f92672">/</span><span style="color: #f8f8f2">dorbae:</span> <span style="color: #f8f8f2">Failed</span> <span style="color: #f8f8f2">to</span> <span style="color: #f8f8f2">get</span> <span style="color: #f8f8f2">DB</span> <span style="color: #f8f8f2">data</span><span style="color: #f92672">.</span>
    <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">JsonParseException</span><span style="color: #f92672">:</span> <span style="color: #f8f8f2">Unrecognized</span> <span style="color: #f8f8f2">token</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f8f8f2">True</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">:</span> <span style="color: #f8f8f2">was</span> <span style="color: #f8f8f2">expecting</span> <span style="color: #f92672">(</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">true</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">,</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">false</span><span style="color: #960050; background-color: #1e0010">&#39;</span> <span style="color: #f8f8f2">or</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">null</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">)</span>
     <span style="color: #f8f8f2">at</span> <span style="color: #f92672">[</span><span style="color: #f8f8f2">Source:</span> <span style="color: #f92672">(</span><span style="color: #66d9ef">byte</span><span style="color: #f92672">[])</span><span style="color: #e6db74">&quot;{&#39;name&#39;: &#39;WFS&#39;, &#39;columns&#39;: [&#39;time&#39;, &#39;current&#39;], &#39;values&#39;: [[&#39;2019-08-24T15:20:31+09:00&#39;, 7], [&#39;2019-08-24T11:28:41+09:00&#39;, 6], [&#39;2019-08-24T06:29:02+09:00&#39;, 4], [&#39;2019-08-24T05:50:00+09:00&#39;, 4], [&#39;2019-08-24T02:15:17+09:00&#39;, 2], [&#39;2019-08-24T02:15:12+09:00&#39;, 2], [&#39;2019-08-23T18:05:16+09:00&#39;, 2], [&#39;2019-08-23T17:24:44+09:00&#39;, 4], [&#39;2019-08-23T17:22:04+09:00&#39;, 2], [&#39;2019-08-23T17:21:59+09:00&#39;, 2], [&#39;2019-08-23T06:36:24+09:00&#39;, 4], [&#39;2019-08-23T03:45:43+09:00&#39;, 2], [&#39;2019-08-23T03:45:38+09:00&#39;, 2],&quot;</span><span style="color: #f92672">[</span><span style="color: #f8f8f2">truncated</span> <span style="color: #ae81ff">1953313</span> <span style="color: #f8f8f2">bytes</span><span style="color: #f92672">];</span> <span style="color: #f8f8f2">line:</span> <span style="color: #ae81ff">1</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">column:</span> <span style="color: #ae81ff">1953814</span><span style="color: #f92672">]</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">JsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_constructError</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">JsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">1804</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">base</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ParserMinimalBase</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_reportError</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ParserMinimalBase</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">703</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">json</span><span style="color: #f92672">.</span><span style="color: #a6e22e">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_reportInvalidToken</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">3532</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">json</span><span style="color: #f92672">.</span><span style="color: #a6e22e">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_handleUnexpectedValue</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">2627</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">json</span><span style="color: #f92672">.</span><span style="color: #a6e22e">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">nextFieldName</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">UTF8StreamJsonParser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">1053</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">vanillaDeserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">295</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">151</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_readMapAndClose</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">4013</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">readValue</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">3091</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> 
<span style="color: #f92672">...</span>
</pre></td></tr></table></div>

<br />

<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
12</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #ae81ff">2019</span><span style="color: #f92672">-</span><span style="color: #ae81ff">09</span><span style="color: #f92672">-</span><span style="color: #ae81ff">06</span> <span style="color: #ae81ff">17</span><span style="color: #f92672">:</span><span style="color: #ae81ff">30</span><span style="color: #f92672">:</span><span style="color: #ae81ff">03.244</span> <span style="color: #ae81ff">29666</span><span style="color: #f92672">-</span><span style="color: #ae81ff">29758</span><span style="color: #f92672">/***</span> <span style="color: #f8f8f2">E</span><span style="color: #f92672">/</span><span style="color: #f8f8f2">dorbae:</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">JsonMappingException</span><span style="color: #f92672">:</span> <span style="color: #f8f8f2">Unrecognized</span> <span style="color: #f8f8f2">token</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f8f8f2">None</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">:</span> <span style="color: #f8f8f2">was</span> <span style="color: #f8f8f2">expecting</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">null</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">,</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">true</span><span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #f92672">,</span> <span style="color: #960050; background-color: #1e0010">&#39;</span><span style="color: #66d9ef">false</span><span style="color: #960050; background-color: #1e0010">&#39;</span> <span style="color: #f8f8f2">or</span> <span style="color: #f8f8f2">NaN</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f92672">[</span><span style="color: #f8f8f2">Source:</span> <span style="color: #f92672">(</span><span style="color: #66d9ef">byte</span><span style="color: #f92672">[])</span><span style="color: #e6db74">&quot;{&#39;name&#39;: &#39;qbsiotseries&#39;, &#39;columns&#39;: [&#39;time&#39;, &#39;TEMPERATURE&#39;, &#39;HUMIDITY&#39;, &#39;CO2PPM&#39;, &#39;ILLUMINANCE&#39;, &#39;VALUE00&#39;, &#39;VALUE01&#39;, &#39;VALUE02&#39;, &#39;VALUE03&#39;], &#39;values&#39;: [[&#39;2019-08-23T08:00:00Z&#39;, None, None, None, None, None, None, None, None], [&#39;2019-08-23T09:00:00Z&#39;, None, None, None, None, None, None, None, None], [&#39;2019-08-23T10:00:00Z&#39;, None, None, None, None, None, None, None, None], [&#39;2019-08-23T11:00:00Z&#39;, None, None, None, None, None, None, None, None], [&#39;2019-08-23T12:00:00Z&#39;, None, None, None, None, No&quot;</span><span style="color: #f92672">[</span><span style="color: #f8f8f2">truncated</span> <span style="color: #ae81ff">25509</span> <span style="color: #f8f8f2">bytes</span><span style="color: #f92672">];</span> <span style="color: #f8f8f2">line:</span> <span style="color: #ae81ff">1</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">column:</span> <span style="color: #ae81ff">179</span><span style="color: #f92672">]</span> <span style="color: #f92672">(</span><span style="color: #f8f8f2">through</span> <span style="color: #f8f8f2">reference</span> <span style="color: #f8f8f2">chain:</span> <span style="color: #f92672">***.</span><span style="color: #a6e22e">InfluxDBResultSet</span><span style="color: #f92672">[</span><span style="color: #e6db74">&quot;values&quot;</span><span style="color: #f92672">]-&gt;</span><span style="color: #f8f8f2">java</span><span style="color: #f92672">.</span><span style="color: #a6e22e">lang</span><span style="color: #f92672">.</span><span style="color: #a6e22e">Object</span><span style="color: #f92672">[][</span><span style="color: #ae81ff">0</span><span style="color: #f92672">])</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">std</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectArrayDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectArrayDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">206</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">std</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectArrayDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectArrayDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">21</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">impl</span><span style="color: #f92672">.</span><span style="color: #a6e22e">MethodProperty</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deserializeAndSet</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">MethodProperty</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">127</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">vanillaDeserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">288</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deser</span><span style="color: #f92672">.</span><span style="color: #a6e22e">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">deserialize</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">BeanDeserializer</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">151</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">_readMapAndClose</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">4013</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> <span style="color: #f8f8f2">com</span><span style="color: #f92672">.</span><span style="color: #a6e22e">fasterxml</span><span style="color: #f92672">.</span><span style="color: #a6e22e">jackson</span><span style="color: #f92672">.</span><span style="color: #a6e22e">databind</span><span style="color: #f92672">.</span><span style="color: #a6e22e">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">readValue</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ObjectMapper</span><span style="color: #f92672">.</span><span style="color: #a6e22e">java</span><span style="color: #f92672">:</span><span style="color: #ae81ff">3091</span><span style="color: #f92672">)</span>
        <span style="color: #f8f8f2">at</span> 
 
 <span style="color: #f92672">...</span>
</pre></td></tr></table></div>


<br />

# Cause
* My architecture

![screenshot001](/assets/images/posts/2019/09/2019-09-09-java-json-unrecognizedtoken-001.png)

<br />

* Jaskcon libarary was not able to recognize the tokens such as 'True', 'None' and my django server didn't nomalize json data

<br />

# Solution
### 1. Nomalize JSON data in Django server
* **json.dumps** method nomalizes JSON data followed by [ECMA-404]([http://www.ecma-international.org/publications/standards/Ecma-404.htm)
* True -> true & None -> null
* Add this code

```
import json

...

json.dumps(jsonObject)

...

```

<br />

<div markdown="1" style="background: #090707; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
12</pre></td><td><pre style="margin: 0; line-height: 125%"> client = InfluxDBClient(host, port, user, password, db_name)
    result = client.query(query)
    _value = <span style="color: #CD5555">&#39;&#39;</span>

    _series = result.raw.get(<span style="color: #CD5555">&#39;series&#39;</span>)

    <span style="color: #8B008B; font-weight: bold">if</span> _series <span style="color: #8B008B">is</span> <span style="color: #8B008B">not</span> <span style="color: #8B008B; font-weight: bold">None</span>:
        <span style="color: #228B22"># None -&gt; Null &amp; Object -&gt; Object[]</span>
        _value = json.dumps(_series)
        <span style="color: #8B008B; font-weight: bold">return</span> HttpResponse(_value, status=<span style="color: #B452CD">200</span>)
    <span style="color: #228B22"># return HTTP Response</span>
    <span style="color: #8B008B; font-weight: bold">return</span> HttpResponse(_value, status=<span style="color: #B452CD">404</span>)
</pre></td></tr></table></div>

<br />

### 2. Skip null data in Android
* Add this code

```
...

ObjectMapper mapper = new ObjectMapper();

...

mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

...

```

2
3
4</pre></td><td><pre style="margin: 0; line-height: 125%; color: #090707">ObjectMapper mapper = <span style="color: #8B008B; font-weight: bold">new</span> ObjectMapper();
mapper.<span style="color: #658b00">configure</span>(JsonParser.<span style="color: #658b00">Feature</span>.<span style="color: #658b00">ALLOW_SINGLE_QUOTES</span>, <span style="color: #8B008B; font-weight: bold">true</span>); <span style="color: #228B22">// 싱글 쿼테이션 허용</span>
mapper.<span style="color: #658b00">setSerializationInclusion</span>(JsonInclude.<span style="color: #658b00">Include</span>.<span style="color: #658b00">NON_NULL</span>);
InfluxDBResultSet[] influxDBResultSetArray = mapper.<span style="color: #658b00">readValue</span>(data, InfluxDBResultSet[].<span style="color: #658b00">class</span>);
</pre></td></tr></table></div>



<br />

------------

## References
* [JSON encoder and decoder](https://docs.python.org/3/library/json.html)
* [Standard ECMA-404](http://www.ecma-international.org/publications/standards/Ecma-404.htm)
