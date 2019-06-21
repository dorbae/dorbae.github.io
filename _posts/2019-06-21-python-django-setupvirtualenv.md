---
layout: post
title: "[Django] Setup virtual enviroment"
comments: true
author: dorbae
date: 2019-06-21 +0900
categories : [Python, Django]
tags: [python,virtual,django]
sitemap :
  changefreq : weekly
---

# Goal
* How to setup Python virtual environment

<br/>

# Intro
* I had a plan to deploy my Django project on server
* However, there were already a lot of Python programs
* So, I wanted to make a special python environment containing packages which will be used in only my project

<br />

# Practice

## 1. Install venv
* venv : the module used to create and manage virtual environments

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># apt-get install python3-venv</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-001.png)

<br />

## 2. Setup virtual environment
### 2.1. Create virtual 

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ python3 -m venv [VENV_DIRECTORY]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-002.png)

### 2.2. Activate virtual environment

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ source [VENV_DIRECTORY/bin/activate</span>
</pre></div>

![screenshot003](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-003.png)

<br />

![screenshot004](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-004.png)

![screenshot005](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-005.png)

![screenshot006](/assets/images/posts/2019/06/2019-06-21-python-django-setupvirtualenv-006.png)

<br />

----------

## References
* [https://docs.python.org/ko/3/tutorial/venv.html](https://docs.python.org/ko/3/tutorial/venv.html)