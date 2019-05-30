---
layout: post
title: "[Docker] Run MariaDB container and edit configuration"
comments: true
author: dorbae
date: 2019-05-30 +0900
categories : [Docker]
tags: [docker,mariadb,mysql]
sitemap :
  changefreq : weekly
---

# Goal
* To run MariaDB container
* To edit DB configuration including memory parameter and connector

<br />

# Intro
* Install MariaDB in IBM Linux using docker
* I already received docker image in advance.

<br />

# Practice

## 1. Run container

### 1.1 Check Docker images

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker images</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-001.png)

<br />

### 1.2. Create container from image

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker run --name [CONTAINER_NAME] -e MYSQL_ROOT_PASSWERD=[PASSWORD] -d [IMAGE_NAME{:TAG}]</span>

<span style="color: #999999; font-style: italic"># docker ps</span>
</pre></div>


> --name : Container's name

> -e, --env : Set environment variables

> -d, --detach : Run container in background and print container ID

![screenshot002](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-002.png)

<br />

### 1.3. Interface TTY with container

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker exec -it [CONTAINER_NAME] /bin/bash</span>
</pre></div>

> -i, --interactive : Keep STDIN open even if not attached

> -t, --tty : Allocate a pseudo-TTY

![screenshot003](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-003.png)

<br />

### 1.4. Install vim
* Update apt-get

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(container)# apt-get update</span>
</pre></div>

![screenshot004](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-004.png)


* Install vim

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(container)# apt-get install vim</span>
</pre></div>

![screenshot005](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-005.png)

<br />

### 1.5 Edit MariaDB configuration

![screenshot006](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-006.png)

![screenshot007](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-007.png)

![screenshot008](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-008.png)

![screenshot009](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-009.png)

<br />

### 1.6. Restart container

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># docker restart [CONTAINER_NAME]</span>
</pre></div>

![screenshot010](/assets/images/posts/2019/05/2019-05-30-Docker-Basic-Runmariadbandedit-010.png)

<br />

--------

## References

* [pyrasis.com](http://pyrasis.com/Docker/Docker-HOWTO)