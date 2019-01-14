---
layout: post
title: "[Spring Boot] Spring Boot Tutorial 001 - Hello World"
comments: true
author: dorbae
date: 2019-01-14 +0900
categories : [Spring Boot,Tutorial]
tags: [spring boot,spring,java,tutorial]
---

# 들어가며
* 이 튜토리얼은 [Tutorialpoint Spring Boot](https://www.tutorialspoint.com/spring_boot/index.htm)을 기반으로 작
성
* 이 튜토리얼은 자바 개발자들이 제품화할 수 있는 스프링 어플리케이션을 최소한의 구성으로 개발할 수 있도록 하기 위해 작성
* 독자에게 Starters, Auto-configuration, Beans, Actuator 과 같은 Spring Boot의 주요 기능을 설명/실습하고 독자의 실력을 중급정도의 수준으로 끌어올리는 것을 목표로 한다.

<br/>

# Spring Boot란
* 마이크로서비스를 구성하기 위한 자바 기반의 오픈소스 프레임워크
* Spring Boot를 이용하여 단독 또는 완성도 있는 Spring 어플리케이션을 쉽게 만들 수 있다.
* 높은 개발 생산성
* 마이크로서비스를 개발하기 위한 쉬운 구조로 되어 있고, 엔터프라이즈 어플리케이션을 쉽게 개발할 수 있다.

### [개발목적]
    - Spring의 복잡한 XML 설정 생략
    - 쉽게 완성도 있는 Spring 어플리케이션을 개발하기 위해서
    - 어플리케이션을 쉽게 구축하기 위한 더 쉬운 방법을 제공
### [특장점]
    - Java Beans, XML 설정, 데이터베이스 트랜잭션 등을 유연하게 설정할 수 있다.
    - 강력한 배치 처리와 REST endpoints를 관리
    - 자동으로 설정. 복잡한 수동 설정 과정을 생략할 수 있다.
    - Spring 어플리케이션에서 지원하는 어노테이션을 제공
    - 쉬운 의존성 관리
    - 서블릿 컨테이너를 내장

### 마이크로 서비스란?
    - 개발자들이 독립적으로 서비스를 개발/배포하도록 해주는 아키텍처.
    - 각 서비스는 각자의 프로세스를 갖는다. 이 프로세스는 비지니스 어플리케이션을 지원하는 경량화된 모델을 구성한다.
    - 마이크로서비스는 아래와 같은 장점을 갖는다.
        * 쉬운 배포
        * 쉬운 확장성
        * 컨테이너와 호환 가능
        * 설정 최소화
        * 높은 생산성

<br/>

# Hello World 출력 Spring Boot 프로젝트
## 1. Eclipse Spring Boot 프로젝트 생성
* New -> Other... -> Spring Boot -> Spring Starter Project
![screenshot001](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-001.png)
![screenshot002](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-002.png)
![screenshot003](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-003.png)

<br/>

## 2. Maven Dependecies 추가

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #228B22">&lt;!-- Application 모니터링 및 관리에 필요 --&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;dependency&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #8B008B; font-weight: bold">&lt;/groupId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-actuator<span style="color: #8B008B; font-weight: bold">&lt;/artifactId&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;/dependency&gt;</span>
		<span style="color: #228B22">&lt;!-- 보안에 필요 --&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;dependency&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #8B008B; font-weight: bold">&lt;/groupId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-security<span style="color: #8B008B; font-weight: bold">&lt;/artifactId&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;/dependency&gt;</span>
		<span style="color: #228B22">&lt;!-- REST Endpoints 사용에 필요 --&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;dependency&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #8B008B; font-weight: bold">&lt;/groupId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-web<span style="color: #8B008B; font-weight: bold">&lt;/artifactId&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;/dependency&gt;</span>
		<span style="color: #228B22">&lt;!-- 웹 어플리케이션을 생성에 필요 --&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;dependency&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #8B008B; font-weight: bold">&lt;/groupId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-thymeleaf<span style="color: #8B008B; font-weight: bold">&lt;/artifactId&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;/dependency&gt;</span>
		<span style="color: #228B22">&lt;!--  테스트에 필요 --&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;dependency&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #8B008B; font-weight: bold">&lt;/groupId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-test<span style="color: #8B008B; font-weight: bold">&lt;/artifactId&gt;</span>
			<span style="color: #8B008B; font-weight: bold">&lt;scope&gt;</span>test<span style="color: #8B008B; font-weight: bold">&lt;/scope&gt;</span>
		<span style="color: #8B008B; font-weight: bold">&lt;/dependency&gt;</span>
</pre></div>

![screenshot004](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-004.png)

<br/>

## 3. Spring Boot Application 클래스 구현
* Spring Boot 프로젝트 생성 시, 자동으로 생성
* 반드시 메인 메소드 필요
* Spring Boot 구동 시, 가장 먼저 실행되는 Entry Point
* @SpringBootApplication 어노테이션 선언
    * @EnableAutoConfiguration, @ComponentScan, @SpringBootConfiguration Annotation을 포함
    * @EnableAutoConfiguration : JAR dependencies 기반으로 자동으로 application을 설정
    * @ComponentScan : 프로젝트에서 추가된 스캔될 컴포넌트를 지정

<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f92672">package</span> <span style="color: #f8f8f2">io</span><span style="color: #f92672">.</span><span style="color: #a6e22e">dorbae</span><span style="color: #f92672">.</span><span style="color: #a6e22e">springboot</span><span style="color: #f92672">.</span><span style="color: #a6e22e">tutorial</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.SpringApplication</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.autoconfigure.SpringBootApplication</span><span style="color: #f92672">;</span>

<span style="color: #75715e">/*****************************************************************</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * TutorialSpringbootApplication.java</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> *****************************************************************</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> * @version	0.0.0	2019-01-14 18:18:07	dorbae	최초생성</span>
<span style="color: #75715e"> * @since 1.0</span>
<span style="color: #75715e"> * @author dorbae(dorbae.io@gmail.com)</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> */</span>
<span style="color: #75715e">/*</span>
<span style="color: #75715e"> *  @SpringBootApplication Annotation</span>
<span style="color: #75715e"> *  	실행될 Spring Boot 어플리케이션의 시작 포인트</span>
<span style="color: #75715e"> *  	@EnableAutoConfiguration, @ComponentScan, @SpringBootConfiguration Annotation을 포함</span>
<span style="color: #75715e"> *  @EnableAutoConfiguration Annotation</span>
<span style="color: #75715e"> *  	JAR dependencies 기반으로 자동으로 application을 설정</span>
<span style="color: #75715e"> *  @ComponentScan Annotation</span>
<span style="color: #75715e"> *  	프로젝트에서 추가된 스캔될 컴포넌트를 지정</span>
<span style="color: #75715e"> */</span>
<span style="color: #a6e22e">@SpringBootApplication</span>
<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">class</span> <span style="color: #a6e22e">TutorialSpringbootApplication</span> <span style="color: #f92672">{</span>
	<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">static</span> <span style="color: #66d9ef">void</span> <span style="color: #a6e22e">main</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">String</span><span style="color: #f92672">[]</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
		<span style="color: #f8f8f2">SpringApplication</span><span style="color: #f92672">.</span><span style="color: #a6e22e">run</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">TutorialSpringbootApplication</span><span style="color: #f92672">.</span><span style="color: #a6e22e">class</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">);</span>
	<span style="color: #f92672">}</span>
	
	
	

<span style="color: #f92672">}</span>
</pre></td></tr></table></div>

<br/>

## 4. REST Endpoint 클래스 구현
* @RestController 어노테이션 선언
* @RequstMapping 어노테이션으로 Requset URI 매핑

![screenshot005](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-005.png)


<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f92672">package</span> <span style="color: #f8f8f2">io</span><span style="color: #f92672">.</span><span style="color: #a6e22e">dorbae</span><span style="color: #f92672">.</span><span style="color: #a6e22e">springboot</span><span style="color: #f92672">.</span><span style="color: #a6e22e">tutorial</span><span style="color: #f92672">.</span><span style="color: #a6e22e">controller</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.web.bind.annotation.RequestMapping</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.web.bind.annotation.RestController</span><span style="color: #f92672">;</span>

<span style="color: #75715e">/*****************************************************************</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * HelloController.java</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> *****************************************************************</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> * @version	0.0.0	2019-01-14 18:28:07	dorbae	최초생성</span>
<span style="color: #75715e"> * @since 1.0</span>
<span style="color: #75715e"> * @author dorbae(dorbae.io@gmail.com)</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> */</span>
<span style="color: #a6e22e">@RestController</span>
<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">class</span> <span style="color: #a6e22e">HelloController</span> <span style="color: #f92672">{</span>
	<span style="color: #75715e">// Request URI 매핑</span>
	<span style="color: #a6e22e">@RequestMapping</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">value</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;/hello&quot;</span><span style="color: #f92672">)</span>
	<span style="color: #66d9ef">public</span> <span style="color: #f8f8f2">String</span> <span style="color: #a6e22e">hello</span><span style="color: #f92672">()</span> <span style="color: #f92672">{</span>
		<span style="color: #75715e">// 내용 출력</span>
		<span style="color: #66d9ef">return</span> <span style="color: #e6db74">&quot;Hello World&quot;</span><span style="color: #f92672">;</span>
	<span style="color: #f92672">}</span>
<span style="color: #f92672">}</span>
</pre></td></tr></table></div>

<br/>

## 5. 빌드
* mvn clean install

![screenshot006](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-006.png)

<br/>

## 6. 실행

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #888888">java -jar [JAR_NAME]</span>
</pre></td></tr></table></div>    

![screenshot007](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-007.png)

<br/>

## 7. 브라우저에서 확인
* http://localhost:8080/hello 로 접속

![screenshot010](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-010.png)


### 7.1. 로그인 페이지
* Dependecies에 **spring-boot-starter-security**이 포함되어 있으면 서버 접속 시, 로그인 필요
* Default user는 **user**, password는 서버 구동 시 출력

![screenshot008](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-008.png)

![screenshot009](/assets/images/posts/2019/01/2019-01-14-SpringBoot-Tutorial-001-009.png)


## References
* [Tutorialpoint Spring Boot](https://www.tutorialspoint.com/spring_boot/index.htm)