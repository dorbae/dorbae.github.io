---
layout: post
title: MariaDB/MySQL JDBC Driver 'server time zone' 에러 해결방법
comments: true
categories : 
 - DBMS
 - MariaDB
 - MySQL
 - JDBC
 - java
tags: [MariaDB, MySQL, DBMS, trouble shooting, jdbc]  
---  


# The server time zone value ‘KST’ is unrecognized or represents more than one time zone. 에러 해결

* MySQL JDBC Driver 5.1.X 버전 이후 버전부터 'KST' 타임존을 인식불가로 인한 오류 발생.(기타 타임존도 발생)

## 해결방법 1. JDBC URL에 타임존 명시
jdbc:mysql://[HOST]:[PORT]/[DB]?**serverTimezone=UTC**    

또는    

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">String jdbcUrl <span style="color: #666666">=</span> <span style="color: #BA2121">&quot;jdbc:mysql://[HOST]:[PORT]/[DB]&quot;</span><span style="color: #666666">;</span>
Properties connectionProps <span style="color: #666666">=</span> <span style="color: #008000; font-weight: bold">new</span> Properties<span style="color: #666666">();</span>
connectionProps<span style="color: #666666">.</span><span style="color: #7D9029">put</span><span style="color: #666666">(</span> <span style="color: #BA2121">&quot;user&quot;</span><span style="color: #666666">,</span> <span style="color: #666666">[</span>USER<span style="color: #666666">]);</span>
connectionProps<span style="color: #666666">.</span><span style="color: #7D9029">put</span><span style="color: #666666">(</span> <span style="color: #BA2121">&quot;password&quot;</span><span style="color: #666666">,</span> <span style="color: #666666">[</span>PASSWORD<span style="color: #666666">]);</span>
connectionProps<span style="color: #666666">.</span><span style="color: #7D9029">put</span><span style="color: #666666">(</span> <span style="color: #BA2121">&quot;serverTimezone&quot;</span><span style="color: #666666">,</span> <span style="color: #666666">[</span>TIMEZONE<span style="color: #666666">]);</span>
Driver driver <span style="color: #666666">=</span> DriverManager<span style="color: #666666">.</span><span style="color: #7D9029">getDriver</span><span style="color: #666666">(</span> jdbcUrl<span style="color: #666666">);</span>
Connection conn <span style="color: #666666">=</span> driver<span style="color: #666666">.</span><span style="color: #7D9029">connect</span><span style="color: #666666">(</span> jdbcUrl<span style="color: #666666">,</span> connectionProps<span style="color: #666666">);</span>
</pre></div>    




## 해결방법 2. 서버 타임존 변경  
* 설정 파일 수정    
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">#</span> vi /etc/my.cnf

<span style="color: #888888">[edit]</span>
</pre></div>    

![edit_config](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_001.png)

  * default_time_zone 옵션 추가

  ![add_option](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_002.png)
  
* DB 서버 재가동    
<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #000080; font-weight: bold">#</span> systemctl restart mysqld
</pre></div>  

![restart_server](/assets/images/posts/2019/01/2019-01-02-dbms-mysql-jdbc-timezone-troubleshooting_003.png)


