---
layout: post
title: "[Django] Djang Startup Tutorial 002"
comments: true
author: dorbae
date: 2019-01-06 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-thumnail.png
categories : [Python,Django]
tags: [python,django,tutorial]
---

* 앞선 [Tutorial 001]({{site.url}}/python/django/python-django-startup-tutorial-001/)에서는 Django 설치 및 환경 구성 과정을 실습
* 이 포스트에서는 앱을 구성하는 방법에 대해서 진행

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
  
## 1. App 생성

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> python manage.py startapp <span style="color: #666666">[</span>APP_NAME<span style="color: #666666">]</span>
</pre></div>    

![Tutorial001](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-001.png)

## 2. Project에 App 등록

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> <span style="color: #008000">cd</span> <span style="color: #666666">[</span>PROJECT_DIRECTORY<span style="color: #666666">]</span>
<span style="color: #000080; font-weight: bold">$</span> vi settings.py
</pre></div>     

![Tutorial002](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-002.png)

* Add app in installed_apps

![Tutorial003](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-003.png)


## 3. App View 생성

* View : 사이트의 특정 URL에 대해서 어떻게 보일지 구성

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> <span style="color: #008000">cd</span> <span style="color: #666666">[</span>APP_DIRECTORY<span style="color: #666666">]</span>
<span style="color: #000080; font-weight: bold">$</span> vi views.py
</pre></div>    

![Tutorial004](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-004.png)

* 'Hello World'를 출력하는 view
  * 수정 전

![Tutorial005](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-005.png)

  * 수정 후
  
![Tutorial006](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-006.png)

## 4. App View URL 매핑
* 특정 URL에 대해서 어떤 View를 보여줄지 설정

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> <span style="color: #008000">cd</span> <span style="color: #666666">[</span>PROJECT_DIRECTORY<span style="color: #666666">]</span>
<span style="color: #000080; font-weight: bold">$</span> vi urls.py
</pre></div>      

![Tutorial007](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-007.png)

  * 수정 전
  
![Tutorial008](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-008.png)

  * 수정 후
  
![Tutorial009](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-009.png)  

## 5. 서버 구동/재구동

<div markdown="1", style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">$</span> python manage.py runserver
</pre></div>      

![Tutorial010](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-010.png)  

## 6. 웹브라우저 확인
* http://localhost:8000/sayHello/ 접속

![Tutorial011](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-002-011.png)  



* Reference    
[CS Dojo Tutorial](https://www.youtube.com/watch?v=h7rvyDK70FA&list=PLBZBJbE_rGRXBhJNdKbN7IUy-ctlOFxA1&index=2)     

------------

### 관련 포스트
* [Django Startup Tutorial 001]({{site.url}}/python/django/python-django-startup-tutorial-001/)
* [Django Startup Tutorial 003]()
* [Django Startup Tutorial 004]()
* [Django Startup Tutorial 005]()
* [Django Startup Tutorial 006]()
* [Django Startup Tutorial 007]()

