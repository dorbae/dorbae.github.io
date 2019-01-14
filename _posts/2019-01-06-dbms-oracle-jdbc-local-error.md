---
layout: post
title: "[Oracle] JDBC 'locale not recognized' 오류 해결"
comments: true
author: dorbae
date: 2019-01-06 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-01-apache-rocketmq-quickstart_thumnail.png
categories : [DBMS,Oracle]
tags: [dbms,oracle,jdbc,java,troubleshooting]
sitemap :
  changefreq : weekly
---

# MAC OS 업데이트 후, Oracle JDBC 연결 할 때, 로케일 인식 오류 발생
![Error](/assets/images/posts/2019/01/2019-01-06-dbms-oracle-jdbc-local-error-001.png)


## 발생원인
* OS 업데이트 후, 시스템 로케일이 제대로 설정이 안되어 있어서 발생

## 해결방법
* 시스템 로케일 재설정    
  * 1. 시스템 환경설정 > 언어 및 지역    
![Error](/assets/images/posts/2019/01/2019-01-06-dbms-oracle-jdbc-local-error-002.png)    
    
  * 2. 지역을 대한민국이 아닌 다른 지역으로 설정    
![Error](/assets/images/posts/2019/01/2019-01-06-dbms-oracle-jdbc-local-error-003.png)    

  * 3. 지역을 다시 대한민국으로 설정    
![Error](/assets/images/posts/2019/01/2019-01-06-dbms-oracle-jdbc-local-error-004.png)    
