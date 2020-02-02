---
layout: post
title: "[Data Analysis] SQL Recipe for Data Analysis Tutorial #1 - Setup the environment"
comments: true
author: dorbae
date: 2020-01-23 +0900
categories : [BigData,DataAnalysis]
tags: [bigdata,sql,analyze,data,tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Studying SQL for data analysis
* Install PostgreSQL docker for buildiing testing environment

<br />

---------------

# Practice

### Book for studying

| Title | 데이터 분석을 위한 SQL 레시피 | 
| --- | --- |
| Author | Nagato Kasaki, Naoto Tamiya |
| Translator | 윤인성 |
| Publisher | 한빛미디어 |

<br >

* I'm gonna study SQL syntax and functions for data analysis
* I'm gonna try to load test data on PostgreSQL and execute queries in the book
* First of all, I have to install PostgreSQL for testing and I'll build the environment by using docker image
* And docker is already installed in my system

<br />

### 1. Install 
#### 1.1. Check local docker images

```shell
$ docker image ls
```

![screenshot001](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-001.png)

<br />

#### 1.2. Download docker image
* Search docker image on DockerHub

```shell
$ docker search [IMAGE]
```

![screenshot002](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-002.png)

<br />

* Download PostgreSQL image
> I downloaded 12.1 version

```shell
$ docker pull [IMAGE][{:TAG}]
$ docker image ls
```

![screenshot003](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-003.png)

![screenshot004](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-004.png)

<br />

### 2. Run PostgreSQL instance
#### 2.1. Create data directory
* I'm gonna set data directory on my local directory not on docker image

```shell
$ mkdir [DATA_DIRECTORY]
```

![screenshot005](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-005.png)

<br />

#### 2.2. Run instance
* Options
    * Environment variables

| Variable | Comment |
| ---- | ---- |
| POSTGRES_PASSWORD | Sets the superuser password for PostgreSQL |
| POSTGRES_USER | Create the specified user with superuser power and a database with the same name. If it is not specified, then the default user of postgres will be used |
| POSTGRES_DB | ㅇefine a different name for the default database that is created when the image is first started. If it is not specified, then the value of **POSTGRES_USER** will be used |
| PGDATA | The default is /var/lib/postgresql/data, but if the data volume you're using is a filesystem mountpoint (like with GCE persistent disks), Postgres initdb recommends a subdirectory (for example /var/lib/postgresql/data/pgdata ) be created to contain the data |

<br />

* Run

```shell
$ docker run --name [CONTAINER_NAME] -e POSTGRES_PASSWORD=[MY_PASSWORD] -d postgres
```

![screenshot006](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-006.png)

<br />

* Check running process

```shell
$ docker ps
```

![screenshot007](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-007.png)

<br />

### 3. Connection Test

#### 3.1. Connect PostgreSQL by DB tool
* I used DBeaver which is open-source database tool

![screenshot008](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-008.png)

![screenshot009](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-009.png)

![screenshot010](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-010.png)

![screenshot011](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-011.png)

<br />

#### 3.2. Create table test

![screenshot012](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-012.png)

![screenshot013](/assets/images/posts/2020/01/2020-01-23-bigdata-sql-sqlrecipeforanalysis-001-013.png)
docker start -i -p 5432:5432/tcp postgres-da

<br />

------------

## References
* 데이터 분석을 위한 SQL 레시피 - 한빛미디어
* [DockerHub PostgreSQL](https://hub.docker.com/_/postgres){:target="_blank"}