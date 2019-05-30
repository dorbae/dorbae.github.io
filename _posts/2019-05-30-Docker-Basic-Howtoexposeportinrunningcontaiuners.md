---
layout: post
title: "[Docker] How to expose ports on live containers"
comments: true
author: dorbae
date: 2019-05-30 +0900
categories : [Docker]
tags: [docker,port]
sitemap :
  changefreq : weekly
---

# Goal
* To add port exposure on running container

<br />

# Intro
* I intalled MariaDB container and it was running
* However, it was not bound on host

<br />

# Practice

## 1. Check bining ports

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker port [CONTAINER_NAME] [PORT_NUMBER]</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-001.png)

<br />

## 2. Create new container from running container

### 2.1. Stop running container

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker stop  [CONTAINER_NAME]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-002.png)

<br />

### 2.2. Create container from running container

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker commit [RUNNING_CONTAINER_NAME] [NEW_CONTAINER_NAME]</span>
</pre></div>

![screenshot003](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-003.png)

<br />

### 2.3. Remove original container and create container which is applied exposure port again

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker rm [RUNNING_CONTAINER_NAME]</span>

<span style="color: #999999; font-style: italic"># docker run -p {HOST_IP}:{[HOST_PORT]}:[CONTAINER_PORT] [OPTIONS] [CONTAINER_NAME] [CREATED_CONTAINER_NAME]</span>
</pre></div>

> -p, --publish : Publish a container's port(s) to the host

> ::[CONTAINER_PORT] : HOST_RANDOM_PORT <-> CONTAINER_PORT

> [HOST_PORT]:[CONTAINER_PORT] : HOST_PORT <-> CONTAINER_PORT

> [HOST_IP]:[CONTAINER_PORT] : HOST_IP:RANDOM_PORT <-> CONTAINER_PORT

> [HOST_IP]:[HOST_PORT]:[CONTAINER_PORT] : HOST_ID:HOST_PORT <-> CONTAINER_PORT


![screenshot004](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-004.png)

<br />

## 3. Check port binding

### 3.1. Check exposure port

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker ps</span>
</pre></div>

![screenshot005](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-005.png)

<br />

### 3.2. Connection test by Telnet

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ telnet [HOST_IP] [PORT]</span>
</pre></div>

 ![screenshot006](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-006.png)

<br />

------

## References
* [ongamedev blog](https://ongamedev.tistory.com/entry/%EC%8B%A4%ED%96%89%EC%A4%91%EC%9D%B8-%EB%8F%84%EC%BB%A4-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%EC%97%90-%EC%B6%94%EA%B0%80-%ED%8F%AC%ED%8A%B8-%EC%98%A4%ED%94%88%ED%95%98%EA%B8%B0)