---
layout: post
title: "[Eclipse] Eclipse 실행 JVM 변경하기"
comments: true
author: dorbae
date: 2019-01-14 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-14-Tool-Eclipse-SetupVM-thumnail.png
categories : [Tool,Eclipse]
tags: [tool,eclipse,ide,vm,jdk9,jdk10,jdk11]
---

## 문제
* OpenJDK 11 설치 후에 잘 실행되던 Eclipse에서 아래와 같은 에러 발생
* org.eclipse.e4.core.di.InjectionException: java.lang.NoClassDefFoundError: javax/annotation/PostConstruct
![Error](/assets/images/posts/2019/01/2019-01-14-Tool-Eclipse-SetupVM-001.png)


### 실행환경
* OS X Mohave 10.14.2
* Eclipse Oxygen
* OpenJDK 11.0.1, Oracle JDK 1.8.0_162

<br/>

## 해결방법
### 1. eclipse.ini에 모듈 옵션 추가
* eclipse.ini 파일에 **--add-modules=ALL-SYSTEM** 옵션 추가
![screenshot001](/assets/images/posts/2019/01/2019-01-14-Tool-Eclipse-SetupVM-002.png)

<br/>

### 2. eclipse 실행 vm 변경
* 1번에서 말한 옵션이 기존에 추가되어 있음에도 에러 발생
* 그래서 Eclipse 실행하는 VM을 기존의 Oracle JDK8 로 변경
* eclipse.ini 파일에 아래와 같은 옵션 추가
![screenshot002](/assets/images/posts/2019/01/2019-01-14-Tool-Eclipse-SetupVM-003.png)

<br/>

## References
* [IOTINFRA'S BLOG](http://blog.iotinfra.net/?p=256)