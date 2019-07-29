---
layout: post
title: "[Linux] How to remove unnecessary backup files periodically"
comments: true
author: dorbae
date: 2019-07-29 +0900
categories : [Linux, Shellscript]
tags: [linux,shellscript]
sitemap :
  changefreq : weekly
---

# Goal
* Remove unnecessary MariaDB backup files which were modified more 6 days ago

<br/>

# Intro
* I have created the backup file from MariaDB once a week
* [How to dump the backup file from MariaDB](/posts/2019-07-29-dbms-mariadb-backupscript.md)

<br />

# Practice

## 1. Create old files
* I have to create files which have a similar name pattern and were modified more 6 days ago
* You can use **___touch___** command

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #888888">touch -t [[CC]YY]MMDDhhmm[.ss]</span>
</pre></div>

<br />

<div style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #555555">$</span>&gt; touch -t 201907150700 backup_mariadb_agriculture_19.07.15.0700.sql
<span style="color: #555555">$</span>&gt; touch -t 201907220700 backup_mariadb_agriculture_19.07.22.0700.sql
</pre></div>

<br />

![screenshoot001](2019-07-29-linux-shellscript-howtoremovebackupfileperiodically-001.png)

<br />

## 2. Remove old files
* You can find only the files that you want and execute a specific command to them by **___find___** command

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #555555">$</span>&gt; find [DIRECTORY] -name [FILE_NAME] -mtime +[DAYS] -exec rm -f {} <span style="color: #CD5555">\;</span>
</pre></div>

<br />

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #555555">$</span>&gt; find ~/ -name <span style="color: #CD5555">&#39;backup_mariadb_agriculture_*.sql&#39;</span> -mtime +6 -exec rm -f {} <span style="color: #CD5555">\;</span>
</pre></div>

<br />

![screenshoot002](2019-07-29-linux-shellscript-howtoremovebackupfileperiodically-002.png)

<br />

## 3. Register in Cron

### 3.1. Edit the cron table

<div style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #555555">#</span>&gt; crontab -e
</pre></div>

<br />

### 3.2. Register the schedule

* Cron pattern

```
[MINUTE] [HOUR] [DAY] [MONTH] [DAY OF WEEK] [COMMAND]
```

<br />

* I tried to execute backup script at 7 O'clock every day

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #888888">0 7 * * * find ~/ -name &#39;backup_mariadb_agriculture_*.sql&#39; -mtime +6 -exec rm -f {} \;</span>
</pre></div>

<br />

----------

## References
* [ZetaWiki](https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_%EB%82%A0%EC%A7%9C_%EA%B8%B0%EC%A4%80%EC%9C%BC%EB%A1%9C_%ED%8C%8C%EC%9D%BC_%EC%82%AD%EC%A0%9C%ED%95%98%EA%B8%B0)
* [Toward the Developer](https://joont.tistory.com/129)