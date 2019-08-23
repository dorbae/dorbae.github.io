---
layout: post
title: "[Spring Boot] Spring Boot Tutorial #2 - Tomcat Deployment"
comments: true
author: dorbae
date: 2019-01-15 +0900
categories : [SpringBoot,Tutorial]
tags: [spring boot,spring,java,tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Spring Boot 어플리케이션을 이용하여 웹 서버에 war 배포 가능
* 어떻게 war 파일 형태로 만들고, 어떻게 Tomcat 웹서버에 Spring Boot 어플리케이션을 배포하는지 학습

<br/>

# Practice
## 1. Spring Boot Servlet Initializer
* Spring Boot 어플리케이션을 배포하기 위학 가장 전통적인 방법은 <span style:color="green">**SpringBootServletInitializer**</span> 클래스를 상속하는 것
* **SpringBootServletInitializer** 클래스는 Servlet Container에 의해 실행될 때, 어플리케이션을 구성할 수 있다.

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
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f92672">package</span> <span style="color: #f8f8f2">io</span><span style="color: #f92672">.</span><span style="color: #a6e22e">dorbae</span><span style="color: #f92672">.</span><span style="color: #a6e22e">springboot</span><span style="color: #f92672">.</span><span style="color: #a6e22e">tutorial</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.SpringApplication</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.autoconfigure.SpringBootApplication</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.builder.SpringApplicationBuilder</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.springframework.boot.web.servlet.support.SpringBootServletInitializer</span><span style="color: #f92672">;</span>

<span style="color: #75715e">/*****************************************************************</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * TutorialSpringbootApplication.java</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> *****************************************************************</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> * @version	0.1.0	2019-01-15 18:18:07	dorbae	WAR 배포로 수정</span>
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

<span style="color: #75715e">/*</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * JAR 형태로 배포</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> *	</span>
<span style="color: #75715e">@SpringBootApplication</span>
<span style="color: #75715e">public class TutorialSpringbootApplication {</span>
<span style="color: #75715e">	public static void main( String[] args) {</span>
<span style="color: #75715e">		SpringApplication.run( TutorialSpringbootApplication.class, args);</span>
<span style="color: #75715e">	}</span>
<span style="color: #75715e">}</span>

<span style="color: #75715e">*/</span>

<span style="color: #75715e">/*</span>
<span style="color: #75715e"> * WAR 형태로 배포</span>
<span style="color: #75715e"> */</span>
<span style="color: #a6e22e">@SpringBootApplication</span>
<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">class</span> <span style="color: #a6e22e">TutorialSpringbootApplication</span> <span style="color: #66d9ef">extends</span> <span style="color: #f8f8f2">SpringBootServletInitializer</span> <span style="color: #f92672">{</span>
	<span style="color: #a6e22e">@Override</span>
	<span style="color: #66d9ef">protected</span> <span style="color: #f8f8f2">SpringApplicationBuilder</span> <span style="color: #a6e22e">configure</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">SpringApplicationBuilder</span> <span style="color: #f8f8f2">application</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
		<span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">application</span><span style="color: #f92672">.</span><span style="color: #a6e22e">sources</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">TutorialSpringbootApplication</span><span style="color: #f92672">.</span><span style="color: #a6e22e">class</span><span style="color: #f92672">);</span>
	<span style="color: #f92672">}</span>

	<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">static</span> <span style="color: #66d9ef">void</span> <span style="color: #a6e22e">main</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">String</span><span style="color: #f92672">[]</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
		<span style="color: #f8f8f2">SpringApplication</span><span style="color: #f92672">.</span><span style="color: #a6e22e">run</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">TutorialSpringbootApplication</span><span style="color: #f92672">.</span><span style="color: #a6e22e">class</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">);</span>
	<span style="color: #f92672">}</span>
<span style="color: #f92672">}</span>
</pre></td></tr></table></div>    

<br/>

## 2. Main Class 설정
* 빌드 파일에 실행될 main class를 지정해줘야한다.
    * **Maven**: pom.xml에 추가

    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">&lt;start-class&gt;</span>io.dorbae.springboot.tutorial.TutorialSpringbootApplication<span style="color: #fb660a; font-weight: bold">&lt;/start-class&gt;</span>
    </pre></div>




    * **Gradle**: build.gradle에 추가
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">mainClassName=&quot;io.dorbae.springboot.tutorial.TutorialSpringbootApplication&quot;</span>
    </pre></div>

![screenshot001](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-001.png)

<br/>

## 3. paacking JAR를 WAR에 Update
* WAR 형태로 배포하기 위해서 아래 항목들을 추가해줘야한다.
    * **Maven**: pom.xml에 추가
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">&lt;packaging&gt;</span>war<span style="color: #fb660a; font-weight: bold">&lt;/packaging&gt;</span>
    </pre></div>


    * **Gradle**: build.gradle에 추가
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">apply plugin:</span> <span style="color: #ffffff">‘war’</span>
    <span style="color: #ffffff">apply plugin:</span> <span style="color: #ffffff">‘application’</span>
    </pre></div>


![screenshot002](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-002.png)

<br/>

## 4. REST Endpoint 사용을 위한 Dependencies 수정
* REST Endpoint를 사용하기 위해서는 **spring-boot-starter-web** 을 의존성에 추가해줘야한다.
    * **Maven**: pom.xml에 추가
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">&lt;dependency&gt;</span>
     <span style="color: #fb660a; font-weight: bold">&lt;groupId&gt;</span>org.springframework.boot<span style="color: #fb660a; font-weight: bold">&lt;/groupId&gt;</span>
     <span style="color: #fb660a; font-weight: bold">&lt;artifactId&gt;</span>spring-boot-starter-web<span style="color: #fb660a; font-weight: bold">&lt;/artifactId&gt;</span>
     <span style="color: #fb660a; font-weight: bold">&lt;/dependency&gt;</span>
    </pre></div>


    * **Gradle**: build.gradle에 추가
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">dependencies {</span>
    <span style="color: #ffffff">compile(&#39;org.springframework.boot:spring-boot-starter-web&#39;)</span>
    <span style="color: #ffffff">}</span>
    </pre></div>


![screenshot003](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-003.png)

<br/>

## 5. Packaging Application
* WAR 파일 Packaging
    * **Maven**:
    <div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">mvn package</span>
    </pre></div>


    * **Gradle**:
    <div style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">gradle clean build</span>
    </pre></div>


![screenshot004](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-004.png)

![screenshot005](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-005.png)

<br/>

## 6. Tomcat에 Deploy
* $TOMCAT_HOME/webapp에 war 복사

![screenshot006](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-006.png)

<br/>

## 7. 웹브라우저에서 확인
* http://localhost:8080/[WAR_NAME]/[PATH]

![screenshot007](/assets/images/posts/2019/01/2019-01-15-SpringBoot-Tutorial-002-007.png)

<br/>

## References
* [Tutorialspoint](https://www.tutorialspoint.com/spring_boot/spring_boot_tomcat_deployment.htm)