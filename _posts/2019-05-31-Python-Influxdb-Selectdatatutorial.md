---
layout: post
title: "[Python] SELECT data from InfluxDB"
comments: true
author: dorbae
date: 2019-05-31 +0900
categories : [Python,InfluxDB]
tags: [python,influxdb,influxdb]
sitemap :
  changefreq : weekly
---

# Goal
* To select data from InfluxDB

<br />

# Practice

## 1. Install InfluxDB module

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ pip install influxdb</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/05/2019-05-31-Python-Influxdb-Selectdatatutorial-001.png)

<br />

## 2. Select data

* Code

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
31</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic"># InfluxDB SELECT sample</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># Version   Date        Author          Description</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># 1.0.0     2019-05-31  dorbae          Initialize</span>
<span style="color: #999999; font-style: italic">############################################################</span>

<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">influxdb</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">InfluxDBClient</span>

<span style="color: #6ab825; font-weight: bold">def</span> <span style="color: #447fcf">main</span><span style="color: #d0d0d0">():</span>
    <span style="color: #ed9d13">&quot;&quot;&quot;Instantiate a connection to the InfluxDB.&quot;&quot;&quot;</span>
    <span style="color: #d0d0d0">host</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;localhost&#39;</span>
    <span style="color: #d0d0d0">port</span> <span style="color: #d0d0d0">=</span> <span style="color: #3677a9">8086</span>
    <span style="color: #d0d0d0">user</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;root&#39;</span>
    <span style="color: #d0d0d0">password</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;root&#39;</span>
    <span style="color: #d0d0d0">dbname</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;iotdb&#39;</span>
    <span style="color: #d0d0d0">query</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;SELECT mean(*) FROM &quot;iotseries&quot; WHERE time &gt; now() - 1d AND mGroupID = \&#39;sample\&#39;  and mDeviceID = \&#39;2435839\&#39; GROUP BY time(1h);&#39;</span>

    <span style="color: #d0d0d0">client</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">InfluxDBClient(host,</span> <span style="color: #d0d0d0">port,</span> <span style="color: #d0d0d0">user,</span> <span style="color: #d0d0d0">password,</span> <span style="color: #d0d0d0">dbname)</span>

    <span style="color: #24909d">print</span><span style="color: #d0d0d0">(</span><span style="color: #ed9d13">&quot;Querying data: &quot;</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">query)</span>
    <span style="color: #d0d0d0">result</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">client.query(query)</span>

    <span style="color: #6ab825; font-weight: bold">for</span> <span style="color: #d0d0d0">point</span> <span style="color: #6ab825; font-weight: bold">in</span> <span style="color: #d0d0d0">result.get_points():</span>
        <span style="color: #24909d">print</span><span style="color: #d0d0d0">(point)</span>

<span style="color: #6ab825; font-weight: bold">if</span> <span style="color: #d0d0d0">__name__</span> <span style="color: #d0d0d0">==</span> <span style="color: #ed9d13">&#39;__main__&#39;</span><span style="color: #d0d0d0">:</span>
    <span style="color: #d0d0d0">main()</span>
</pre></td></tr></table></div>

* Result

![screenshot002](/assets/images/posts/2019/05/2019-05-31-Python-Influxdb-Selectdatatutorial-002.png)

<br />

--------

## References

* [https://influxdb-python.readthedocs.io/en/latest/examples.html](https://influxdb-python.readthedocs.io/en/latest/examples.html)