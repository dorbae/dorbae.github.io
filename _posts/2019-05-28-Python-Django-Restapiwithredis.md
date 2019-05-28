---
layout: post
title: "[Django] REST API server with Redis"
comments: true
author: dorbae
date: 2019-05-28 +0900
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
### 1.1. Install django 

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ pip install django</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-001.png)

<br />

### 1.2. Create Django project
* Avoid reserved word as project's name. eg. _django, _test
* And then, new directory'll be created and some files for Django Framework are also created.

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ cd [WORKSPACE]</span>
<span style="color: #d0d0d0">$ django-admin.py startproject [PROJECT_NAME]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-002.png)

> djago-admin.py :  Django's command-line utility for administrative tasks

<br />

### 1.3. Proejct directory structure

```bash
[PROJECT]
|-- [PROJECT_NAME_DIR]
|   |-- __init__.py
|   |-- settings.py
|   |-- urls.py
|   |-- wsgi.py
|-- manage.py

```

* manage.py
  * Django's command-line utility for administrative tasks
  * It is same thing as django-admin
  * It can set the DJANGO_SETTINGS_MODULE environment variable so that it points to your project's settings.py file
  * Generally, when working on a single Django project, it's easier to use manage.py than django-admin

* [PROJECT_NAME_DIR]
  * Python packages are stored in this directory.
  * You can import Python package by using this name
  * e.g. import [PROJECT_NAME_DIR].urls

* [PROJECT_NAME_DIR]/\_\_init.py\_\_.py
  * It is just empty file to announce parent directory is package.

* [PROJECT_NAME_DIR]/settings.py
  * Settings/configuration for this Django project.

* [PROJECT_NAME_DIR]/urls.py
  * The URL declarations for this Django project
  * It is similar to a “table of contents” of Django.

* [PROJECT_NAME_DIR]/wsgi.py
  * An entry-point for WSGI-compatible web servers to serve your project.
    
  > WSGI(Web Server Gateway Interface)

  > HTTP Request -> Web Server -> **WSGI Server(Middleware)** -> Web Application(Such as **Django**, flask)


## 2. Import project in PyCharm IDE
### 2.1. Open Project
* Execute PyCHarm IDE and click open button

![screenshot003](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-003.png)

### 2.2 Choose the Django project

![screenshot004](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-004.png)

![screenshot005](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-005.png)

<br />

## 3. Run application
### 3.1. Edit run configuration
* Menu > Run > Run

![screenshot006](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-006.png)

* Edit configurations

![screenshot007](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-007.png)

* Add new run configuration

![screenshot008](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-008.png)

* Setup configuration
    * Script path : Input path of manage.py file in Django project
    * Parameters : Input **'runserver'**

    > runserver host:port
    > e.g. runserver 0:8080 (0.0.0.0:8080)

![screenshot009](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-009.png)

<br />

### 3.2. Run
* Run application

![screenshot010](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-010.png)

![screenshot011](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-011.png)

* Check whether application start up or not

![screenshot012](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-012.png)

<br />

## 4. Install Module

* Install **redis** and **django-redis**

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(env) $ pip install redis</span>
<span style="color: #d0d0d0">(env) $ pip install django-redis</span>
</pre></div>

![screenshot014](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-014.png)

<br />

## 5. Make REST API app for getting Redis data

## 5.1. Create app

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(env) $ manage.py startapp [APP_NAME]</span>
</pre></div>

![screenshot013](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-013.png)

<br />

## 5.2. Create view in app

* New > Python File > view.py

![screenshot015](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-015.png)

* iot/view.py

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
38</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #447fcf; text-decoration: underline">redis</span>
<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.http</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">HttpResponse</span>

<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic"># Request for sensors</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># Version   Date        Author          Description</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># 1.0.0     2019-05-28  dorbae          Initialize</span>
<span style="color: #999999; font-style: italic">############################################################</span>

<span style="color: #999999; font-style: italic"># Redis Connection Pool</span>
<span style="color: #999999; font-style: italic"># db : db number (default : 0)</span>
<span style="color: #d0d0d0">REDIS_CONNECTION_POOL</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">redis.ConnectionPool(host=</span><span style="color: #ed9d13">&#39;${REDIS_HOST}&#39;</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">port=</span><span style="color: #3677a9">6379</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">db=</span><span style="color: #3677a9">1</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">decode_responses=</span><span style="color: #6ab825; font-weight: bold">False</span><span style="color: #d0d0d0">,</span>
                                             <span style="color: #d0d0d0">password=</span><span style="color: #ed9d13">&#39;${REDIS_PASSWORD}, max_connections=5)</span>
<span style="color: #999999; font-style: italic"># Method for getting the information of devices in specific group</span>
<span style="color: #6ab825; font-weight: bold">def</span> <span style="color: #447fcf">get</span><span style="color: #d0d0d0">(request,</span> <span style="color: #d0d0d0">group_id):</span>
    <span style="color: #24909d">print</span><span style="color: #d0d0d0">(</span><span style="color: #ed9d13">&#39;[DEBUG] Search &#39;</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">group_id</span> <span style="color: #d0d0d0">+</span> <span style="color: #ed9d13">&#39;...&#39;</span><span style="color: #d0d0d0">)</span>

    <span style="color: #999999; font-style: italic"># Connect Redis through connect pool</span>
    <span style="color: #d0d0d0">_redisClient</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">redis.Redis(connection_pool=REDIS_CONNECTION_POOL)</span>

    <span style="color: #999999; font-style: italic"># Set client name</span>
    <span style="color: #d0d0d0">_redisClient.client_setname(</span><span style="color: #ed9d13">&#39;iot.rest.api&#39;</span><span style="color: #d0d0d0">)</span>

    <span style="color: #999999; font-style: italic"># Get values matched with group_id</span>
    <span style="color: #d0d0d0">_keys</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">_redisClient.keys(group_id</span> <span style="color: #d0d0d0">+</span> <span style="color: #ed9d13">&#39;|*&#39;</span><span style="color: #d0d0d0">)</span>

    <span style="color: #999999; font-style: italic"># Concat str result (likes csv)</span>
    <span style="color: #d0d0d0">_result</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;&#39;</span>
    <span style="color: #6ab825; font-weight: bold">for</span> <span style="color: #d0d0d0">k</span> <span style="color: #6ab825; font-weight: bold">in</span> <span style="color: #d0d0d0">_keys:</span>
        <span style="color: #d0d0d0">v</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">_redisClient.get(k)</span>
        <span style="color: #d0d0d0">_result</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">_result</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">v.decode(encoding=</span><span style="color: #ed9d13">&#39;utf-8&#39;</span><span style="color: #d0d0d0">)</span>

    <span style="color: #999999; font-style: italic"># return HTTP Response</span>
    <span style="color: #6ab825; font-weight: bold">return</span> <span style="color: #d0d0d0">HttpResponse(_result)</span>
</pre></td></tr></table></div>

<br />

## 5.3. Create url in app

* New > Python File > urls.py

* iot/urls.py

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.urls</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">path</span>

<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">.</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">views</span>

<span style="color: #d0d0d0">urlpatterns</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">[</span>
    <span style="color: #d0d0d0">path(</span><span style="color: #ed9d13">&#39;&lt;str:group_id&gt;/&#39;</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">views.get,</span> <span style="color: #d0d0d0">name=</span><span style="color: #ed9d13">&#39;get&#39;</span><span style="color: #d0d0d0">),</span>
<span style="color: #d0d0d0">]</span>
</pre></td></tr></table></div>

<br />

## 5.4. Edit [PROJECT]/urls.py and register [APP]/urls.py

* iotapisvr/urls.py

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.contrib</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">admin</span>
<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.urls</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">path,</span> <span style="color: #d0d0d0">include</span>

<span style="color: #d0d0d0">urlpatterns</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">[</span>
    <span style="color: #d0d0d0">path(</span><span style="color: #ed9d13">&#39;admin/&#39;</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">admin.site.urls),</span>
    <span style="color: #d0d0d0">path(</span><span style="color: #ed9d13">&#39;sensors/&#39;</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">include(</span><span style="color: #ed9d13">&#39;iot.urls&#39;</span><span style="color: #d0d0d0">)),</span>
<span style="color: #d0d0d0">]</span>
</pre></td></tr></table></div>


<br />

## 6. Run and test

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ RESP_BODY=$(curl -G [URL]); echo $RESP_BODY</span>
</pre></td></tr></table></div>

![screenshot016](/assets/images/posts/2019/05/2019-05-28-Python-Django-Restapiwithredis-016.png)

<br />

--------

## References
* [Django Tutorial](https://docs.djangoproject.com/ko/2.2/intro/tutorial01/)

* [DJango djang-admin and manage.py](https://docs.djangoproject.com/ko/2.2/ref/django-admin/)

* [bono's blog](https://blueshw.github.io/2016/02/02/django-setting-for-pycharm-community/)