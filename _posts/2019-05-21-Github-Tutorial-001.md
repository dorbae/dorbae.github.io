---
layout: post
title: "[GitHub] GitHub Tutorial - #001 What is Git/GitHub?"
comments: true
author: dorbae
date: 2019-05-21 +0900
categories : [GitHub, Tutorial]
tags: [github, git, tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Git/GitHub는 무엇인가?
* Git/GitHub에서 사용되는 기본적인 개념 파악

<br/>

# 들어가기 전에
* GitHub를 통해서 다양한 오픈소스를 접하고, 이용하고 있다. 그럼에도 불구하고 GitHub의 사용 방법을 정확히 숙지하지 못한채로 사용하고 있다는 생각이 들었다.
* 특히, DBeaver 오픈소스에 기여하고 싶어 프로젝트를 살펴보면서, GitHub 사용에 서툴러 어려움을 많이 겪었다. 그래서 우선, GitHub의 사용법을 공부하고자 한다.

<br />

# Practice
* Git
    * 분산 버전 관리 시스템

    * Git를 사용하는 이유
        * 변경 이력과 변경 이유 기록
            * 과거 이력을 통해서 변경 내역을 확인할 수 있고, Commit 메시지를 통해서 변경 이유를 쉽게 파악
        * 변경 취소 기능
            * 이력을 통해서 과거 버전으로 복구 가능
        * 여러 갈래의 이력 (Branch)
            * 콘텐츠의 변경 내용 테스트나 다른 기능을 독립적으로 실험할 때, 별도의 Branch를 생성 가능
            * 분리된 Branch를 Master Branch로 병합하거나 삭제 가능
        * 충돌 해결 능력
            * 자동으로 변경 사항 병합. 충돌이 발생할 경우, 충돌이유를 쉽게 파악
        
* GitHub
    * Git Repository를 업로드 할 수 있는 웹사이트
    * 웹 기반 인터페이스트를 통해서 Git의 기능 외에 forking, pull requests, issues, wikis와 같은 기능을 통하여 협업에 필요한 다양한 기능을 제공

    * GitHub를 사용하는 이유
        * Issue
            * Issue를 이용하여 버그를 기록하거나 개발할 새로운 기능을 구체화
        * Pull Requests
            * Branch와 Pull requests를 통하여 별도 개발/병합 가능
            * Pull Requests 목록을 통하여 현재 무슨 작업이 진행되고 있는지, 최근 변경 내용 사항에 대한 논의 내용을 확인
        * 팀 작업 진척 상황 확인
            * Pulse, Commit History 기능을 통하여 팀의 작업 진척 상황 파악

* 주요 개념
    * Commit
        * 하나 이상의 파일 변경 내용을 저장할 때마다 새로운 Commit 생성
    * Commit Message
        * Commit 생성 시, 변경 이유/내용 등을 명시
    * Branch
        * 테스트 또는 새 기능 개발 시, 독립적인 Commit을 수행
    * Master Branch
        * Git 프로젝트 생성 시, 기본 Branch
        * 배포 시, 작업이 최종적으로 마무리되는 Branch
    * Feature(Topic) Branch
        * 새로운 기능을 개발할 때 작업하는 Branch
    * Release Branch
        * 직접 QA 작업하거나 고객의 요구로 구 버전의 소프트웨어를 지원해야할 경우, 모든 수정이나 업데이트를 위한 Branch
        * Feature Branch와 기술적으로 다르지 않지만, 업무적으로 구분에 용이
    * Merge
        * 한 Branch에서 완성된 작업을 다른 Branch에 포함하는 방법
    * Tag
        * 특정 이력이 있는 Commit에 대한 참조. 어떤 버전의 코드가 언제 배포되었는지 정확히 알 수 있도록 제품 배포 기록에 자주 사용
    * Check Out
        * 프로젝트 History의 다른 버전으로 이동해 해당 시점의 파일을 보기 위해 check out
    * Pull Request
        * Branch에서 완료된 작업을 다른 사람이 리뷰하고 마스터로 병합하도록 요청
    * Issue
        * 기능 노의나 버그 추적에 사용
    * Wiki
        * 링크들을 연결해 간단한 웹 페이지 만드는 방법
        * GitHub는 문서 작성에 Wiki를 자주 사용
    * Clone
        * Repository를 사용자 컴퓨터로 복사하는 과정
        * 로컬로 작업하기 위해 프로젝트 본사본을 다운로드
    * Fork
        * 프로젝트 직접 변경 권한이 없을 경우, Repository를 자신의 Repository로 복사
        * Fork된 프로젝트를 수정한 후, 원본 프로젝트에 Pull Request 요청

<br />

-------------

## References
* GitHub 사용 설명서 - (주)교학사