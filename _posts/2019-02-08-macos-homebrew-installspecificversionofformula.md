---
layout: post
title: "[MacOS] Homebrew로 특정 OpenCV 설치"
comments: true
author: dorbae
date: 2019-02-08 +0900
categories : [MacOS,Homebrew]
tags: [mac,macos,osx,homebrew,brew,맥,opencv]
sitemap :
  changefreq : weekly
---

# Goal
* Homebrew를 이용하여 특정 OpenCV 버전을 설치

<br />

# 들어가며
* Hombrew를 이용하여 OpenCV를 설치하니 OpenCV 4.0.1(최신) 버전이 설치되었다.
* 특정 버전(3.4.5)를 이용해야해서 Homebrew를 이용해 OpenCV를 설치하고자 한다.

<br />

# Practice
## 1. 설치 가능한 버전 확인
* Homebrew 레파지토리 테이블에 어떤 버전이 있는지 확인

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ brew search opencv</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/02/2019-02-08-macos-homebrew-installspecificversionofformula-001.png)

<br />

## 2. 특정 버전 설치
* opencv@3 설치

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ brew install opencv@3</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/02/2019-02-08-macos-homebrew-installspecificversionofformula-002.png)

<br />

-----

## References
* [StackOverflow](https://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula)