---
layout: post
title: "[Django] Djang Startup Tutorial #1 - Install Django & Create Project"
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
* Django 설치 및 프로젝트 생성

<br/>

# Django
  
* 파이썬으로 작성된 오픈 소스 웹 애플리케이션 프레임워크
* 콤포넌트의 재사용성(reusability)과 플러그인화 가능성(pluggability), 빠른 개발 등을 강조
* 인스타그램, NASA, 빗버켓, Disqus, 모질라 등에서 사용
* 2016년 11월에 알리바바가 Apache 재단에 danation 하고, 2017년 2월에 Apache Top-Level 프로젝트로 선정
  
<br/>

## 1. 파이썬 설치     

* 버전은 3.6 이상으로 설치. 세부 버전은 동일하지 않아도 됨    

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ brew install python3</span>
<span style="color: #ffffff">$ python --version</span>
</pre></div>
   
     
![Tutorial001](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-001.png)

<br/>

## 2. pipenv 설치

* pipenv는 파이썬을 위한 가상 환경을 구성해 줌
* pip는 파이썬 패키지 관리자

| Type | Package Manager |
|---:|:---|
| Linux | yum |
| Mac | brew |
| Python | pip |

   
<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ pip3 install pipenv</span>
</pre></div>
      
![Tutorial002](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-002.png)

<br/>

## 3. 워크스페이스 디렉터리 생성     

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ mkdir [DIRECTORY]</span>
<span style="color: #ffffff">$ cd [DIRECTORY_PATH]</span>
</pre></div>
 

![Tutorial003](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-003.png)    

<br/>

## 4. Django 설치

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ pipenv install django==[VERSION]</span>
</pre></div> 

![Tutorial042](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-004.png)    

<br/>

## 5. 가상환경 활성화

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ cd [WORKSPACE]</span>
<span style="color: #ffffff">$ pipenv shell</span>
</pre></div>  

![Tutorial005](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-005.png)    

<br/>

## 6. Djang 프로젝트 생성

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ django-admin startproject [PROJECT_NAME] [DIRECTORY_WILL_BE_PROJECT_CREATED]</span>
</pre></div>

![Tutorial006](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-006.png)    

<br/>

## 7. Django 서버 구동

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ python manage.py runserver</span>
</pre></div> 

![Tutorial007](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-007.png)    

<br/>

## 8. 웹브라우저로 접속

* http://localhost:8000 으로 접속

![Tutorial008](/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-008.png)  

<br/>

## References    
* [CS Dojo Tutorial](https://www.youtube.com/watch?v=UyQn0BhVqNU&index=1&list=PLBZBJbE_rGRXBhJNdKbN7IUy-ctlOFxA1)     
* [WiKi](https://ko.wikipedia.org/wiki/%EC%9E%A5%EA%B3%A0_(%EC%9B%B9_%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC))      


------------

### 관련 포스트
* [Django Startup Tutorial 002]({{site.url}}//python/django/python-django-startup-tutorial-002/)
* [Django Startup Tutorial 003]()
* [Django Startup Tutorial 004]()
* [Django Startup Tutorial 005]()
* [Django Startup Tutorial 006]()
* [Django Startup Tutorial 007]()

