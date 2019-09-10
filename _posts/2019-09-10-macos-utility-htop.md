---
layout: post
title: "[MacOS] htop"
comments: true
author: dorbae
date: 2019-09-10 +0900
categories : [MacOS,Tool]
tags: [macos,mac,tool,htop]
sitemap :
  changefreq : weekly
---

# Goal
* What is **htop**?
* How to install

<br />

---------------

# Practice

### HTOP
* Process manager to monitor system processes
* It was developed to replace **top** which was UNIX basic process manager
* It illustrates whole processes which are running, while ***top*** displays only several processes that occupy large resources
* It enhances visual effect by colors and describes the status of processors, swap, memory and so on 
* It uses ***Ncurses*** libaray and is programmed by ***C language***

<br />

### 1. Install 

* Install using ***brew***

<pre code=SHELL>
$ brew install htop
</pre>

![screenshot001](/assets/images/posts/2019/09/2019-09-10-macos-utility-htop-001.png)

<br />

### 2. Run

<pre code=SHELL>
$ htop
</pre>

![screenshot002](/assets/images/posts/2019/09/2019-09-10-macos-utility-htop-002.png)

<br />

![screenshot004](/assets/images/posts/2019/09/2019-09-10-macos-utility-htop-004.gif)

<br />

* top

![screenshot003](/assets/images/posts/2019/09/2019-09-10-macos-utility-htop-003.png)

<br />

------------

## References
* [htop wiki](https://ko.wikipedia.org/wiki/Htop)