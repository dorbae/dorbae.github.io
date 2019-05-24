---
layout: post
title: "[Django] REST API server with Redis"
comments: true
author: dorbae
date: 2019-05-23 +0900
categories : [Python,Django]
tags: [python,django,redis]
sitemap :
  changefreq : weekly
---

# Goal
* To make REST API server for IoT
* To interface with Redis

<br/>

# Intro

<br />

# Practice

## 1. Make Django Project
* Install django 

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ pip install django</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/05/2019-05-23-Python-Django-Restapiwithredis-001.png)

<br />

* Create Django project
    * Avoid reserved word as project's name. eg. _django, _test
    * And then, new directory'll be created and some files for Django Framework are also created.

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ cd [WORKSPACE]</span>
<span style="color: #d0d0d0">$ django-admin.py startproject [PROJECT_NAME]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/05/2019-05-23-Python-Django-Restapiwithredis-002.png)

<br />

* Proejct directory structure

```bash
.
|-- _Project
|   |-- manage.py
|   |-- \_\_init\_\_.py
|   |-- settings.py
|   |-- urls.py
|   |-- wsgi.py

```

.
+-- _Project
|   +-- manage.py
|   +-- \_\_init\_\_.py
|   +-- settings.py
|   +-- urls.py
|   +-- wsgi.py




#
--------

## References

[Django Tutorial](https://docs.djangoproject.com/ko/2.2/intro/tutorial01/)

