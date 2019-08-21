---
layout: post
title: "[Linux] How to remove specific files and directories"
comments: true
author: dorbae
date: 2019-07-31 +0900
categories : [Linux, Shellscript]
tags: [linux,shellscript,shell]
sitemap :
  changefreq : weekly
---

# Goal
* Remove old video, data, log files in my CCTV server

<br/>

# Intro
* My CCTV server directory tree

<pre>

CCTV_HOME
|
|__ bin
|__ cctv
|   |__ cam01
|   |   |__ data
|   |   |   |__ <b>201905</b>
|   |   |   |__ <b>201906</b>
|   |   |   |__ <b>201907</b>
|   |   |   |   |__ <b>20190701</b>
|   |   |   |   |__ <b>20190702</b>
|   |   |   |   |__ <b>...</b>
|   |   |   |   |__ <b>20190730</b>
|   |   |   |   |__ <b>20190731</b>
|   |   |   |   |   |   <b>cctv_20190731001231123.avi</b>
|   |   |   |   |   |   <b>cctv_20190731001431145.avi</b>
|   |   |   |   |   |   <b>...</b>
|__ log
|   |   <b>cctv_20190415212234567.log</b>
|   |   <b>cctv_20190613112834139.log</b>
|   |   <b>cctv_20190711082932345.log</b>
|   |   <b>...</b>
|__ tmp
|   |   <b>temp_20190415212234567.dat</b>
|   |   <b>temp_20190613112834139.dat</b>
|   |   <b>temp_20190711082932345.dat</b>
|   |   <b>...</b>

</pre>

<br />

# Practice

* script

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
57</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #228B22">#!/bin/bash</span>

<span style="color: #228B22">###########################################################################</span>
<span style="color: #228B22">#</span>
<span style="color: #228B22"># Remove old files including .avi, .dat, .ini, .log and temporary files</span>
<span style="color: #228B22">#</span>
<span style="color: #228B22">###########################################################################</span>
<span style="color: #228B22"># 1.0.0  2019-07-31  dorbae    Initialize</span>
<span style="color: #228B22">###########################################################################</span>

<span style="color: #228B22"># Home directory</span>
<span style="color: #00688B">MY_CAMERA_HOME</span>=/home/dorbae/cctvhome
<span style="color: #228B22"># Define how many days you keep the files</span>
<span style="color: #00688B">KEEP_DAYS</span>=7

<span style="color: #228B22"># Remove old temporary files which were modified more than a day ago</span>
find <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/tmp/ -name <span style="color: #CD5555">&#39;temp_*&#39;</span> -mtime +1 -exec rm -f {} <span style="color: #CD5555">\;</span>

<span style="color: #228B22"># Remove old log files which were modified more than n days ago</span>
find <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/log/ -name <span style="color: #CD5555">&#39;*.log&#39;</span> -mtime +<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">KEEP_DAYS</span><span style="color: #8B008B; font-weight: bold">}</span> -exec rm -f {} <span style="color: #CD5555">\;</span>

<span style="color: #228B22"># Remove old video and data files which were modified more than n days ago</span>
find <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/cctv/ -name <span style="color: #CD5555">&#39;cctv_*&#39;</span> -mtime +<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">KEEP_DAYS</span><span style="color: #8B008B; font-weight: bold">}</span> -exec rm -f {} <span style="color: #CD5555">\;</span>

<span style="color: #228B22"># Remove old YYYYMMDD(daily) directory</span>
<span style="color: #228B22"># eg. if today is 2019-07-31, remove ${MY_CAMERA_HOME}/cctv/*/data/201907/20190724</span>
<span style="color: #00688B">OLD_DAILY_DIRECTORY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y%m%d&#39;</span> -d <span style="color: #CD5555">&quot;${KEEP_DAYS} day ago&quot;`</span>
<span style="color: #00688B">OLD_MONTH_DIRECTORY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y%m&#39;</span> -d <span style="color: #CD5555">&quot;${KEEP_DAYS} day ago&quot;`</span>
rm -rf <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/cctv/*/data/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">OLD_MONTH_DIRECTORY</span><span style="color: #8B008B; font-weight: bold">}</span>/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">OLD_DAILY_DIRECTORY</span><span style="color: #8B008B; font-weight: bold">}</span>

<span style="color: #228B22"># Remove old YYYYMM(monthly) directory</span>
<span style="color: #228B22"># Also, remove directory which were created 2 month ago.</span>
<span style="color: #228B22"># Because I want to remove unnecessary directories certainly if it was not deleted accidently by any reason.</span>

<span style="color: #228B22"># - option : remove a padding(0)</span>
<span style="color: #228B22"># eg. %d -&gt; 07, 08, 11 / %-d -&gt; 7, 8, 11</span>
<span style="color: #00688B">TODAY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%-d&#39;`</span>
<span style="color: #8B008B; font-weight: bold">if</span> [ <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">TODAY</span><span style="color: #8B008B; font-weight: bold">}</span> -gt <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">KEEP_DAYS</span><span style="color: #8B008B; font-weight: bold">}</span> ]; <span style="color: #8B008B; font-weight: bold">then</span>
<span style="color: #8B008B; font-weight: bold">    </span><span style="color: #00688B">MONTH_AGO_1_DIRECTORY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y%m&#39;</span> -d <span style="color: #CD5555">&quot;1 month ago&quot;`</span>
    <span style="color: #00688B">MONTH_AGO_1_YYYY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y&#39;</span> -d <span style="color: #CD5555">&quot;1 month ago&quot;`</span>
    <span style="color: #00688B">CURRENT_YYYY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y&#39;`</span>
    <span style="color: #228B22"># I don&#39;t know why it works like that exactly</span>
    <span style="color: #228B22"># When I execute `date &#39;+%Y%m&#39; -d &quot;1 month ago&quot;` command on 31th July </span>
    <span style="color: #228B22"># It returns not 06 but 07</span>
    <span style="color: #228B22"># I think it maybe depends on Timezone</span>
    <span style="color: #228B22"># So, check the month again manually</span>
    <span style="color: #8B008B; font-weight: bold">if</span> [ <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">CURRENT_YYYY</span><span style="color: #8B008B; font-weight: bold">}</span> -ne <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MONTH_AGO_1_YYYY</span><span style="color: #8B008B; font-weight: bold">}</span> ]; <span style="color: #8B008B; font-weight: bold">then</span>
        <span style="color: #228B22"># Remove YYYYMMDD directory</span>
        rm -rf <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/cctv/*/data/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MONTH_AGO_1_DIRECTORY</span><span style="color: #8B008B; font-weight: bold">}</span>
    <span style="color: #8B008B; font-weight: bold">fi</span>
    
    <span style="color: #228B22"># Remove the directory which were created 2 month ago</span>
    <span style="color: #00688B">MONTH_AGO_2_DIRECTORY</span>=<span style="color: #CD5555">`</span>date <span style="color: #CD5555">&#39;+%Y%m&#39;</span> -d <span style="color: #CD5555">&quot;2 month ago&quot;`</span>
    rm -rf <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MY_CAMERA_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/cctv/*/data/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">MONTH_AGO_2_DIRECTORY</span><span style="color: #8B008B; font-weight: bold">}</span>
<span style="color: #8B008B; font-weight: bold">fi</span>

<span style="color: #658b00">exit </span>0
</pre></td></tr></table></div>

