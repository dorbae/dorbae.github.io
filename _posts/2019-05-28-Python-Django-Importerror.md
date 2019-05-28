---
layout: post
title: "[Django] ImportError: Couldn't import Django. Are you sure it's installed and available on your PYTHONPATH envrionment variables? Did you forget to activate a virtual environment?"
comments: true
author: dorbae
date: 2019-05-28 +0900
categories : [Python,Django]
tags: [python,django,pycharm,importerror,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* To know why this problem occurs
* To solve this problem

<br/>

# Problem
* When I ran Djang application in PyCharm IDE, this error occured.
* I used Anaconda virtual env for my project.
* I installed Django in my default Python. However I didn't install it in virtual env.

![screenshot001](/assets/images/posts/2019/05/2019-05-28-Python-Django-Importerror-001.png)

<br />

# Solution
## 1. Activate virtual env and install Django
### 1.1. Check virtual env name and path

![screenshot002](/assets/images/posts/2019/05/2019-05-28-Python-Django-Importerror-002.png)

### 1.2. Activate virtual env which is used in my project

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ conda activate [ENV_NAME]</span>
</pre></div>

### 1.3. Install Django

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(env) $ pip install django</span>
</pre></div>

![screenshot003](/assets/images/posts/2019/05/2019-05-28-Python-Django-Importerror-003.png)

<br />

## 2. Run Django application

![screenshot004](/assets/images/posts/2019/05/2019-05-28-Python-Django-Importerror-004.png)

![screenshot005](/assets/images/posts/2019/05/2019-05-28-Python-Django-Importerror-005.png)

<br />

--------

## References
* [Stackoverflow](https://askubuntu.com/questions/250442/django-installed-but-cant-import-django-in-python)
* [Dev Notes](https://niceman.tistory.com/90?category=940952)
