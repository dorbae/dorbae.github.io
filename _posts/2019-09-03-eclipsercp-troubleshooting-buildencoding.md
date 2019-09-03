---
layout: post
title: "[Eclipse RCP] How to fix encoding problem when builing a progrma"
comments: true
author: dorbae
date: 2019-09-03 +0900
categories : [EclipseRCP]
tags: [eclipse rcp, rcp, eclipse, java, troubleshooting]
sitemap :
  changefreq : weekly
---

# Problem
* After building my application, text(Korean) in labels were cracked

![screenshoot001](/assets/images/posts/2019/09/2019-09-03-eclipsercp-troubleshooting-buildencoding-001.png)

<br />

# Cause
* My environment
  * Eclipse workspace encoding : UTF-8
  * System default encoding : MS949(Windows 10)
* When exporting RCP application, it was compiled by default text encoding which was used by the IDE

<br/>

# Solution
* At first, I tried to add **-Dfile.encoding=UTF8** vm option in [APPLICATION_LAUNCHER_NAME].int file. However, it didn't work well
* Because, text was already cracked when it was compiled

![screenshoot002](/assets/images/posts/2019/09/2019-09-03-eclipsercp-troubleshooting-buildencoding-002.png)

<br />

* So, I tried to add **javacDefaultEncoding.. = UTF-8** option in **build.properties** file

![screenshoot003](/assets/images/posts/2019/09/2019-09-03-eclipsercp-troubleshooting-buildencoding-003.png)

<br />

* After that, it did work well

![screenshoot004](/assets/images/posts/2019/09/2019-09-03-eclipsercp-troubleshooting-buildencoding-004.png)

<br />

---------------------------

## References
* [Stack Overflow](https://translate.google.com/translate?hl=ko&sl=en&tl=ko&u=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F6891079%2Feclipse-rcp-wrong-encoding-when-deploying-the-product&anno=2)