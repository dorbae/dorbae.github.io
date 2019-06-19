---
layout: post
title: "[Django] Invalid HTTP_HOST header: '[HOST]'. You may need add '[HOST]' to ALLOWED_HOSTS"
comments: true
author: dorbae
date: 2019-06-19 +0900
categories : [Python,Django]
tags: [python,django,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* To solve "Invalid HTTP_HOST header: '[HOST]'. You may need add '[HOST]' to ALLOWED_HOSTS"' problem.

<br/>

# Intro
* When I connected my Django REST server by domain likes this 'http://iot.dorbae.kr:8000/~', this error occured and I wasn't able to connect the server.

![screenshot001](/assets/images/posts/2019/06/2019-06-19-Python-Django-Youmayneedtoaddtoallowedhosts-001.png)

<br />

# Practice

## 1. Add allowed host

### 1.1. Open setting.py file in your djang project

### 1.2. Add allowed hosts
* ['*'] : Allow all
* ['localhost'] or ['localhost', 'iot.dorbae.kr', '10.12.33.55'] : Allow specific hosts

![screenshot002](/assets/images/posts/2019/06/2019-06-19-Python-Django-Youmayneedtoaddtoallowedhosts-002.gif)

<br />

--------

## References

* [https://programmers.co.kr/learn/questions/1025](https://programmers.co.kr/learn/questions/1025)

