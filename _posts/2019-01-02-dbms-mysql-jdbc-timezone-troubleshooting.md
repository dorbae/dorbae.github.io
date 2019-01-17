---
layout: post
title: "[MariaDB/MySQL] JDBC Driver 'server time zone' 에러 해결방법"
comments: true
author: dorbae
date: 2019-01-02 +0900
image: /assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_thumnail.png
categories: [DBMS, MySQL]
tags: [MariaDB, MySQL, DBMS, trouble shooting, jdbc]
sitemap :
  changefreq : weekly 
---  

# Goal
* The server time zone value ‘KST’ is unrecognized or represents more than one time zone. 에러 해결

<br/>

# 발생 원인
* MySQL JDBC Driver 5.1.X 버전 이후 버전부터 'KST' 타임존을 인식불가로 인한 오류 발생.(기타 타임존도 발생)

<br/>

# 문제 해결
## 해결방법 1. JDBC URL에 타임존 명시
* jdbc:mysql://[HOST]:[PORT]/[DB]?**serverTimezone=UTC**    

또는    

<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f8f8f2">String</span> <span style="color: #f8f8f2">jdbcUrl</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;jdbc:mysql://[HOST]:[PORT]/[DB]&quot;</span><span style="color: #f92672">;</span>
<span style="color: #f8f8f2">Properties</span> <span style="color: #f8f8f2">connectionProps</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">Properties</span><span style="color: #f92672">();</span>
<span style="color: #f8f8f2">connectionProps</span><span style="color: #f92672">.</span><span style="color: #a6e22e">put</span><span style="color: #f92672">(</span> <span style="color: #e6db74">&quot;user&quot;</span><span style="color: #f92672">,</span> <span style="color: #f92672">[</span><span style="color: #f8f8f2">USER</span><span style="color: #f92672">]);</span>
<span style="color: #f8f8f2">connectionProps</span><span style="color: #f92672">.</span><span style="color: #a6e22e">put</span><span style="color: #f92672">(</span> <span style="color: #e6db74">&quot;password&quot;</span><span style="color: #f92672">,</span> <span style="color: #f92672">[</span><span style="color: #f8f8f2">PASSWORD</span><span style="color: #f92672">]);</span>
<span style="color: #f8f8f2">connectionProps</span><span style="color: #f92672">.</span><span style="color: #a6e22e">put</span><span style="color: #f92672">(</span> <span style="color: #e6db74">&quot;serverTimezone&quot;</span><span style="color: #f92672">,</span> <span style="color: #f92672">[</span><span style="color: #f8f8f2">TIMEZONE</span><span style="color: #f92672">]);</span>
<span style="color: #f8f8f2">Driver</span> <span style="color: #f8f8f2">driver</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">DriverManager</span><span style="color: #f92672">.</span><span style="color: #a6e22e">getDriver</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">jdbcUrl</span><span style="color: #f92672">);</span>
<span style="color: #f8f8f2">Connection</span> <span style="color: #f8f8f2">conn</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">driver</span><span style="color: #f92672">.</span><span style="color: #a6e22e">connect</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">jdbcUrl</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">connectionProps</span><span style="color: #f92672">);</span>
</pre></td></tr></table></div>
 
<br/>

## 해결방법 2. 서버 타임존 변경  
* 설정 파일 수정    

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-style: italic; background-color: #0f140f"># vi /etc/my.cnf</span>

<span style="color: #ffffff">[</span><span style="color: #fb660a">edit</span><span style="color: #ffffff">]</span>
</pre></div>


![edit_config](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_001.png)

  * default_time_zone 옵션 추가

  ![add_option](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_002.png)
  
* DB 서버 재가동    

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-style: italic; background-color: #0f140f"># systemctl restart mysqld</span>
</pre></div>


![restart_server](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_003.png)


