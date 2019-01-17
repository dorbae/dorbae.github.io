---
layout: post
title: "[Django] Djang Startup Tutorial #2 - App 생성 View / Mapping"
comments: true
author: dorbae
date: 2019-01-06 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-thumnail.png
categories : [Python,Django]
tags: [python,django,tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Django Framework를 사용법 숙지
* Django App 생성
* App View 작성 & URI 매핑

<br/>

# 들어가며
* 앞선 [Tutorial 001]({{site.url}}/python/django/python-django-startup-tutorial-001/)에서는 Django 설치 및 환경 구성 과정을 실습
* 이 포스트에서는 앱을 구성하는 방법에 대해서 진행

<br/>

## App과 Project
* Project    
  * 한 사이트를 구성 (1 Project => 1 Site)     
  * 여러 개의 app을 가질 수 있음     
* App     
  * 각각의 app은 특정 aspect에 집중
* Example (쇼핑 사이트/프로젝트)
  * 권한관련 app
  * 결제관련 app
  * 상품관련 app

<br/>

# Practice

## 1. App 생성

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ python manage.py startapp [APP_NAME]</span>
</pre></div> 

![Tutorial001](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-001.png)

<br/>

## 2. Project에 App 등록

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ cd [PROJECT_DIRECTORY]</span>
<span style="color: #ffffff">$ vi settings.py</span>
</pre></div>   

![Tutorial002](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-002.png)

* Add app in installed_apps

![Tutorial003](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-003.png)

<br/>

## 3. App View 생성

* View : 사이트의 특정 URL에 대해서 어떻게 보일지 구성

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ cd [APP_DIRECTORY]</span>
<span style="color: #ffffff">$ vi views.py</span>
</pre></div>
 

![Tutorial004](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-004.png)

* 'Hello World'를 출력하는 view
  * 수정 전

![Tutorial005](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-005.png)

  * 수정 후
  
![Tutorial006](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-006.png)

<br/>

## 4. App View URL 매핑
* 특정 URL에 대해서 어떤 View를 보여줄지 설정

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ cd [PROJECT_DIRECTORY]</span>
<span style="color: #ffffff">$ vi urls.py</span>
</pre></div>
      

![Tutorial007](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-007.png)

  * 수정 전
  
![Tutorial008](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-008.png)

  * 수정 후
  
![Tutorial009](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-009.png)  

<br/>

## 5. 서버 구동/재구동

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ python manage.py runserver</span>
</pre></div>     

![Tutorial010](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-010.png)  

<br/>

## 6. 웹브라우저 확인
* http://localhost:8000/sayHello/ 접속

![Tutorial011](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-011.png)  

<br/>

## References  
* [CS Dojo Tutorial](https://www.youtube.com/watch?v=h7rvyDK70FA&list=PLBZBJbE_rGRXBhJNdKbN7IUy-ctlOFxA1&index=2)     

------------

### 관련 포스트
* [Django Startup Tutorial 001]({{site.url}}/python/django/python-django-startup-tutorial-001/)
* [Django Startup Tutorial 003]()
* [Django Startup Tutorial 004]()
* [Django Startup Tutorial 005]()
* [Django Startup Tutorial 006]()
* [Django Startup Tutorial 007]()

