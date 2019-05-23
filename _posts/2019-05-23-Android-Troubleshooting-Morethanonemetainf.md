---
layout: post
title: "[Android] More than one file was found with OS independent path 'META-INF/XXXX' Troubleshooting"
comments: true
author: dorbae
date: 2019-05-23 +0900
categories : [Android,Troubleshooting]
tags: [android,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* To solve More than one file was found with OS independent path 'META-INF/XXXX' error

<br/>

# Practice

## Problem
* When I built my Android project, I saw this error message.

![screenshot001](/assets/images/posts/2019/05/2019-05-23-Android-Troubleshooting-Morethanonemetainf-001.png)


<br />

## Solution
* Add option in your project's build.gradle
    * in android { ... }
    
![screenshot002](/assets/images/posts/2019/05/2019-05-23-Android-Troubleshooting-Morethanonemetainf-002.png)

<br />

--------

## References

[StackOverflow](https://stackoverflow.com/questions/46956341/on-gradle3-0-0-more-than-one-file-was-found-with-os-independent-path-meta-inf?rq=1&utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)

