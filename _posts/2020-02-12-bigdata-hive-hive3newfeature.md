---
layout: post
title: "[Hive] New features on Hive 3.0"
comments: true
author: dorbae
date: 2020-02-12 +0900
categories : [BigData,Hive]
tags: [bigdata,hive,feature,apache,data]
sitemap :
  changefreq : weekly
---

# Goal
* The new features of Apache Hive 3.0

<br />

---------------

# Practice

## What's new in this release: Apache Hive
* Apache Hive 3.0.0 was released on 21 May 2018 and the recent version is 3.1.2(based on 18 Feb 2020).
* One of the noticeable features is that Hive 3.0 supportㄴ seamless **ACID**(Atomicity, Consistency, Isolation, Durability) and you have to consider serveral thing about the transactional tables created by a Hive version prior to Hive 3.
* Futhermore, several SQL features and useful connectors were added.
* And also, it enhance the performance through improved LLAP and Apache Spark.

<br />

## Hive3 New Features
### ACID v2
* Originally Hive supported write only by adding partitions or loading new file into existing partitions because HDFS Hive already has not allowed file replaced or edited.
* Hive had supported the trasactinons and INSERT, UPDATE, DELETE since 0.13 version was released. But it had several drawbacks like these.
    * Transactional tables had to be stored in ORC and and bucketed
    * Reading transactional tables was significnatly slower than non-transactional ones
    * No support for MERGE or UPSERT funcionality



### Materialized views (MV)
* It can improve the performance by serveral ways
    #### Storage for intermediate results
    * Materialized views results are stored, allowing mutualizing computing costs.
    #### Incremental rebuilding
    * Updating an materialized view only computes the data that was inserted in its sources tables since the last update.
    ##### Query rewriting
    * When appropriate, the cost-based optimizer uses existing materialized views to plan queries instead of the sources tables, without the user being aware of it.

<br />

------------

## References
* [ADALTAS](https://www.adaltas.com/en/2019/07/25/hive-3-features-tips-tricks/)
* [DataWorks](https://www.slideshare.net/Hadoop_Summit/what-is-new-in-apache-hive-30)
* [Hive 2.0 - bitn!ne](https://bitnine.net/blog-computing/about-hive-3-hive-2-0/)
* [Hive Release Notes](https://hive.apache.org/downloads.html)
* [Hive Transactions - Hive Wiki](https://cwiki.apache.org/confluence/display/Hive/Hive+Transactions)