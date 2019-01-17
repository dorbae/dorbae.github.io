---
layout: post
title: "[Django] Invalid HTTP_HOST header 문제 해결"
comments: true
author: dorbae
image: /assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-thumbnail.png
date: 2019-01-17 +0900
categories : [Python,Django]
tags: [python,django,troubleshooting,invalid,host header]
sitemap :
  changefreq : weekly
---

# Goal
* 클라이언트에서 접속 시, 발생하는 **'Invalid HTTP_HOST header'** 문제 해결

<br/>

# 발생 원인
* Django에서 허용되지 않은 Host명으로 접속할 경우 발생.

    * 클라이언트(브라우저) 에러 메시지

![screenshot001](/assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-001.png)

    * 서버 에러 메시지

![screenshot002](/assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-002.png)

<br/>

# 해결 방법
* Django 프로젝트 설정에 있는 허용된 host 리스트에 해당 host를 추가

## 1. 프로젝트 설정 파일 수정
* 설정 파일 열기

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ vi [PROJECT_DIRECTORY]/setttings.py</span>

<span style="color: #ffffff">[Edit]</span>
</pre></div>

![screenshot003](/assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-003.png)

* ALLOWED_HOSTS 설정 추가 및 저장
    * **ALLOWED_HOSTS** = ['host1', 'host2', ...] # 해당 호스트 허용
    * **ALLOWED_HOSTS** = [*] # 모든 호스트 허용

![screenshot004](/assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-004.png)

## 2. 클라이언트 접속 확인
![screenshot005](/assets/images/posts/2019/01/2019-01-17-python-django-invalidhttphostheader-005.png)


<br/>

## References
* [Stack Overflow](https://stackoverflow.com/questions/40582423/invalid-http-host-header)