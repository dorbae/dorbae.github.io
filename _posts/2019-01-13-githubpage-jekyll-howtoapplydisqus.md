---
layout: post
title: "[GitHub Page] Jekyll에 Disqus 적용하기"
comments: true
author: dorbae
date: 2019-01-13 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-thumnail.png
categories : [GitHub Page,Jekyll]
tags: [github page,jekyll,disqus]
---

# Disqus
* 댓글을 직접 구현하지 않고 위젯의 형태로 서비스에 삽입할 수 있는 댓글 전문 서비스
* Disqus를 이용하여 자신의 웹사이트에 다양한 기능의 소셜네트워크 통합 기능을 적용 가능
* 소셜네트워크의 향상된 관리 기능과 커뮤니티를 위한 다양한 기능을 제공
* [공식사이트](disqus.com )

## Disqus를 사용하는 이유
* 다양한 기능
    * Looks good
        - 자동으로 적용하는 사이트의 디자인, 색상에 맞춰 외관을 바꿔준다. 사용자가 원하는 형태로 바꿀 수도 있다.
    * Works everywhere
        - 데스크탑부터 모바일까지 다양한 기기를 지원
    * Used across the world
        - 70여개 국의 언어를 지원

<br/>

* 광고 효과
    * 이용자와 관련된 광고를 표시
    * 관련 광고를 통해 광고 수익 창출 가능

-------

## Disqus Jekyll에 적용하기
### 1. Disqus 가입
* [Disqus 홈페이지](https://disqus.com/) 접속

<br/>

### 2. Disqus 사이트 설정
* Disqus 타입 설정
![type](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-001.png)

<br/>

* Disqus 사이트 설정
![join](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-002.png)

<br/>

* Disqus 적용할 블로그 타입 설정
![blogtype](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-003.png)

<br/>

### 3. Disqus 코드 적용하기
* GitHub Page에 적용할 코드 복사
![code](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-004.png)
![codecopy](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-005.png)

<br/>

* GitHub Page _includes/comment-providers/disqus.html에 적용
    - 적용하는 파일은 GitHub Page 구조에 따라 다름
![applycode](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-006.png)

<br/>

* Disqus 사이트 설정 완료
![finishsite](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-008.png)

<br/>

* GitHub Page _config.yml 파일에 Disqus 설정
![editconfig](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-009.png)

<br/>

* 설정 적용 후 포스트
![screenshot](/assets/images/posts/2019/01/2019-01-13-githubpage-jekyll-howtoapplydisqus-010.png)

<br/>

**작성 중...**

## Reference
* [Discus 홈페이지](https://help.disqus.com/what-is-disqus/what-is-disqus)
* [생활코딩](https://opentutorials.org/course/2473/13865)
* [Jihun's Development Blog](https://cjh5414.github.io/Disqus/)
