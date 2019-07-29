---
layout: post
title: "[MariaDB/MySQL] How to backup the data weekly"
comments: true
author: dorbae
date: 2019-07-29 +0900
categories : [DBMS, MariaDB]
tags: [dbms,mariadb,mysql,backup]
sitemap :
  changefreq : weekly
---

# Goal
* Creat MariaDB backup shell script
* Register in Cron

<br/>

# Intro
* I wanted to dump the data which was in MariaDB for stability

<br />

# Practice

## 1. Dump shell script

* Script

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
26</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #228B22">#####################################################################</span>
<span style="color: #228B22"># Date          Name            Desc</span>
<span style="color: #228B22">#####################################################################</span>
<span style="color: #228B22"># 2019-07-29    SeongbaeChang   Initialize</span>
<span style="color: #228B22"># 2018-07-17    SeongbaeChang   Initialize</span>
<span style="color: #228B22">#####################################################################</span>
<span style="color: #228B22">#!/bin/bash</span>

<span style="color: #228B22"># Set current datetime</span>
<span style="color: #00688B">TIMESTAMP</span>=<span style="color: #CD5555">`</span>date +<span style="color: #CD5555">&quot;%y.%m.%d.%H%M&quot;`</span>
<span style="color: #00688B">BACKUP_FILENAME</span>=backup_mariadb_agriculture_<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">TIMESTAMP</span><span style="color: #8B008B; font-weight: bold">}</span>.sql
<span style="color: #00688B">ROOT_HOME</span>=<span style="color: #CD5555">&quot;/root&quot;</span>
<span style="color: #00688B">QUBICS_HOME</span>=<span style="color: #CD5555">&quot;/home/qubics&quot;</span>

<span style="color: #658b00">echo</span> <span style="color: #CD5555">&quot;[`date +&quot;</span>%Y-%m-%d %H:%M:%S<span style="color: #CD5555">&quot;`] Start Backup...&quot;</span>
<span style="color: #658b00">echo</span> <span style="color: #CD5555">&quot;[`date +&quot;</span>%Y-%m-%d %H:%M:%S<span style="color: #CD5555">&quot;`] Backup File Name = ${BACKUP_FILENAME}&quot;</span>
<span style="color: #228B22"># Backup MariaDB data as SQL format</span>
mysqldump -uagric -pagriculture agriculture &gt; <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">ROOT_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">BACKUP_FILENAME</span><span style="color: #8B008B; font-weight: bold">}</span>

<span style="color: #658b00">echo</span> <span style="color: #CD5555">&quot;[`date +&quot;</span>%Y-%m-%d %H:%M:%S<span style="color: #CD5555">&quot;`] Moving file ${ROOT_HOME} to ${QUBICS_HOME}&quot;</span>
<span style="color: #228B22"># Move to another user home directory</span>
mv <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">ROOT_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">BACKUP_FILENAME</span><span style="color: #8B008B; font-weight: bold">}</span> <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">QUBICS_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">BACKUP_FILENAME</span><span style="color: #8B008B; font-weight: bold">}</span>
<span style="color: #228B22"># Change the owner managing the backup file</span>
chown qubics:qubics <span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">QUBICS_HOME</span><span style="color: #8B008B; font-weight: bold">}</span>/<span style="color: #8B008B; font-weight: bold">${</span><span style="color: #00688B">BACKUP_FILENAME</span><span style="color: #8B008B; font-weight: bold">}</span>

<span style="color: #658b00">echo</span> <span style="color: #CD5555">&quot;[`date +&quot;</span>%Y-%m-%d %H:%M:%S<span style="color: #CD5555">&quot;`] Finished Backup.&quot;</span>
</pre></td></tr></table></div>

<br />

## 2. Register in Cron

### 2.1. Edit the cron table

<div style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #555555">#</span>&gt; crontab -e
</pre></div>

<br />

### 2.2. Register the schedule

* Cron pattern

```
[MINUTE] [HOUR] [DAY] [MONTH] [DAY OF WEEK] [COMMAND]
```

<br />

* I tried to execute backup script at 7 O'clock every day

![screenshot001](/assets/images/posts/2019/07/2019-07-29-dbms-mariadb-backupscript-001.png)

<br />

## 3. Result

![screenshot002](/assets/images/posts/2019/07/2019-07-29-dbms-mariadb-backupscript-002.png)

<br />

----------

## References
