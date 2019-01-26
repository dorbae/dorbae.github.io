---
layout: post
title: "[Java] Java System Properties"
comments: true
author: dorbae
date: 2019-01-26 +0900
categories : [Java,Common]
tags: [java,system,properties,property]
sitemap :
  changefreq : weekly
---

# Goal
* Java System Properties의 사용용도 알아보기
* 기본 시스템 Properties의 항목들을 알아보기

# Practice

* System 클래스에 있는 getProperty( String key) 메소드를 이용하여 시스템 정보를 8 가져올 수 있다.

    * 주요 Properties

| KEY | VALUE |
| :---- | :---- |
| java.version       | Java 버전 |
| java.vendor        | Java 공급자 |
| java.vendor.url    | Java 공급자 URL |
| java.home          | Java가 위치한 디렉터리 |
| java.class.version | Java 클래스의 버전 ( 48(1.4), 49(1.5), 50(1.6), 51(1.7), 52(1.8) ... |
| java.class.path    | App ClassLoader에 로딩된 클래스 경로 |
| java.ext.dir       | Ext ClassLoader에 로드할 클래스가 위치한 경로 |
| os.name            | OS명 의 이름 |
| os.arch            | OS 아키텍처 |
| os.version         | OS 버전 |
| file.separator     | 파일 구분자 /(Unix계열), \(Windows) ※ File 클래스의  |separator변수(String) 을 사용해도 된다. |
| path.separator     | 경로 구분자. |(Unix계열), ;(Windows) ※ File 클래스의 separator변수(String) 을 사용해도 된다. |
| line.separator     | 개행 문자 0x0A(LF, Unix계열), 0x0D0x0A(CR/LF, Windows) ※ Unix 계열은 개행문자가 1Byte, Windows는 2Bytes 명심 |
| user.name          | 사용자 계정명 |
| user.home          | 사용자 홈 디렉토리 |
| user.dir           | 현재 작업 디렉토리 |

<br/>

* Java 실행 시 JVM 옵션으로 -D[key]=[value] 와 같이 key와 value를 Define해주면
System.getProperty( key)로 정의된 값을 불러 올 수 있다.
실행 시마다 동적으로 바뀌는 값을 구현하는데 용이하다.

![screenshot001](/assets/images/posts/2019/01/2019-01-26-java-common-javasystemproperties-001.jpg)

    * 다음과 같은 클래스를 실행시키면
    java -Dmy.name=dorbae Hello

![screenshot002](/assets/images/posts/2019/01/2019-01-26-java-common-javasystemproperties-002.jpg)

    * 아래는 기본적인 Java 프로그램에 있는 시스템 환경 값 출력 결과

awt.toolkit                   = sun.awt.windows.WToolkit    
file.encoding                 = MS949    
file.encoding.pkg             = sun.io     
file.separator                = \     
java.awt.graphicsenv          = sun.awt.Win32GraphicsEnvironment    
java.awt.printerjob           = sun.awt.windows.WPrinterJob     
java.class.path               = D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util\bin;D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util\lib\logger\log4j-1.2.16.jar;D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util\lib\logger\slf4j-api-1.7.5.jar;D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util\lib\logger\slf4j-log4j12-1.7.5.jar;D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util\lib\sap\sapjco3.jar      
java.class.version            = 50.0       
java.endorsed.dirs            = C:\Program Files\Java\jre6\lib\endorsed    
java.ext.dirs                 = C:\Program Files\Java\jre6\lib\ext;C:\Windows\Sun\Java\lib\ext       
java.home                     = C:\Program Files\Java\jre6     
java.io.tmpdir                = C:\Users\ADMINI~1\AppData\Local\Temp\     
java.library.path             = C:\Program Files\Java\jre6\bin;C:\Windows\Sun\Java\bin;C:\Windows\system32;C:\Windows;C:/Program Files/Java/jdk1.7.0_45/bin/../jre/bin/server;C:/Program Files/Java/jdk1.7.0_45/bin/../jre/bin;C:/Program Files/Java/jdk1.7.0_45/bin/../jre/lib/amd64;C:\Program iles\Java\jdk1.7.0_45\bin;C:\Program Files\Java\jdk1.6.0_33\bin;C:\Program Files (x86)\Wizvera\Delfino;C:\Windows\system32;C:\Windows;C:\Windows\system32\wbem;C:\Windows\system32\windowspowershell\v1.0\;c:\program files\tortoisesvn\bin;c:\program files\ibm\gsk8\lib64;c:\program files (x86)\ibm\gsk8\lib;C:\PROGRA~1\IBM\SQLLIB\BIN;C:\PROGRA~1\IBM\SQLLIB\FUNCTION;C:\PROGRA~1\IBM\SQLLIB\SAMPLES\REPL;D:\Eclipse\Eclipse_Android\sdk\tools;C:\Program Files (x86)\IDM Computer Solutions\UltraEdit\;D:\Eclipse\Eclipse-Luna_iScheduler\eclipse;;.     
java.runtime.name             = Java(TM) SE Runtime Environment     
java.runtime.version          = 1.6.0_33-b05     
java.specification.name       = Java Platform API Specification     
java.specification.vendor     = Sun Microsystems Inc.      
java.specification.version    = 1.6      
java.vendor                   = Sun Microsystems Inc.      
java.vendor.url               = http://java.sun.com/      
java.vendor.url.bug           = http://java.sun.com/cgi-bin/bugreport.cgi      
java.version                  = 1.6.0_33      
java.vm.info                  = mixed mode      
java.vm.name                  = Java HotSpot(TM) 64-Bit Server VM     
java.vm.specification.name    = Java Virtual Machine Specification      
java.vm.specification.vendor  = Sun Microsystems Inc.      
java.vm.specification.version = 1.0       
java.vm.vendor                = Sun Microsystems Inc.      
java.vm.version               = 20.8-b03      
line.separator                =         

os.arch                       = amd64      
os.name                       = Windows 7       
os.version                    = 6.1       
path.separator                = ;       
sun.arch.data.model           = 64      
sun.boot.class.path           = C:\Program Files\Java\jre6\lib\resources.jar;C:\Program Files\Java\jre6\lib\rt.jar;C:\Program Files\Java\jre6\lib\sunrsasign.jar;C:\Program Files\Java\jre6\lib\jsse.jar;C:\Program Files\Java\jre6\lib\jce.jar;C:\Program Files\Java\jre6\lib\charsets.jar;C:\Program Files\Java\jre6\lib\modules\jdk.boot.jar;C:\Program Files\Java\jre6\classes       
sun.boot.library.path         = C:\Program Files\Java\jre6\bin       
sun.cpu.endian                = little      
sun.cpu.isalist               = amd64       
sun.desktop                   = windows      
sun.io.unicode.encoding       = UnicodeLittle        
sun.java.command              = com.dorbae.util.DorbaeSystemUtil     
sun.java.launcher             = SUN_STANDARD       
sun.jnu.encoding              = MS949      
sun.management.compiler       = HotSpot 64-Bit Tiered Compilers      
sun.os.patch.level            = Service Pack 1     
user.country                  = KR      
user.dir                      = D:\Eclipse\Eclipse-Luna_iScheduler\workspace\pe.dorbae.util      
user.home                     = C:\Users\Administrator      
user.language                 = ko      
user.name                     = Administrator      
user.timezone                 =       
user.variant                  =       
