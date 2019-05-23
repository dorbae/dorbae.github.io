---
layout: post
title: "[PyCharm] 'Python version 2.7 does not support this syntax.' Troubleshooting"
comments: true
author: dorbae
date: 2019-05-23 +0900
categories : [Python,PyCharm]
tags: [python,pycharm,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* To find the cause of 'Python version 2.7 does not support this syntax.' problem and solve it.
* To change another python intepreter in PyCharm

<br/>

# Intro
* I'm writing some posts about how to make Django project.
* I used Python just liitle bit on CLi or Jupyter. However, I've never used PyCharm.
* So, I faced a lot of problem by using PyCharm and I want to talk about setting Python intepreter.

<br />

# Practice

## Problem
* Python version below 3.x not support the syntax that was used in my Django project.

![screentshot001](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-001.png)

<br />

## Solution
* Replace 2.7 interpreter with 3.x one

    * Preferences

    ![screentshot002](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-002.png)

    * Project -> Project Interpreter

    ![screentshot003](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-003.png)

    * Change interpreter

    ![screentshot004](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-004.png)

    ![screentshot005](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-005.png)

    ![screentshot006](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-006.png)

    * Solved
    ![screentshot007](/assets/images/posts/2019/05/2019-05-23-Python-Pycharm-python27doesnotsupport-007.png)


<br />

--------

## References

[JetBrain Support](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360000027564-pyCharm-writes-python-version-2-7-doesn-t-have-module-pathlib-while-project-interpreter-is-set-to-3-5-2-mac-os-high-sierra-)

