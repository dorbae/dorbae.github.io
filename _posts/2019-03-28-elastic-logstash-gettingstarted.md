---
layout: post
title: "[Logstash] Getting started with Logstash"
comments: true
author: dorbae
date: 2019-03-28 +0900
categories : [Elastic, Logstash]
tags: [elastic, logstash, getting started, tutorial, elasticsearch, troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* Learn about Logstash and install in Linux.
* Move data from MariaDB to Elasticsearch.

<br/>

# Practice

## What is Logstash
* Logstash is an open source data collection engine with real-time pipelining capabilities.

<br />

## Install Logstash

* Download install file
    * https://www.elastic.co/kr/downloads/past-releases
    * Download Logstash which is matched to version of installed Elasticsearch.

* Upload install file and unzip
    * Upload file by FTP/SFTP

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ tar xvf logstah-[x.x.x].tar.gz</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-001.png)

* Edit Configure file
    * Edit logstash configrue file

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ cd $LOGSTASH_HOME/config</span>
<span style="color: #d0d0d0">$ cp logstash-sample.conf logstash-mariadb.conf</span>
<span style="color: #d0d0d0">$ vi logstash-mariadb.conf</span>

<span style="color: #d0d0d0">[edit]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-002.png)

![screenshot003](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-003.png)


* Directory Layout for Docker Images

| **Type** |  **Description** | **Default Location** | **Setting** |
| ---: | :--- | :--- | :--- |
| home | Home directory of the Logstash installation. | /usr/share/logstash | 
| bin | Binary scripts, including logstash to start Logstash and logstash-plugin to install plugins | /usr/share/logstash/bin |
| settings | Configuration files, including logstash.yml and jvm.options | /usr/share/logstash/config | path.settings |
| conf | Logstash pipeline configuration files | /usr/share/logstash/pipeline | path.config |
| plugins | Local, non Ruby-Gem plugin files. Each plugin is contained in a subdirectory. Recommended for development only. | /usr/share/logstash/plugins | path.plugins |
| data | Data files used by logstash and its plugins for any persistence needs. | /usr/share/logstash/data | path.data |

> [Other layout](https://www.elastic.co/guide/en/logstash/6.7/dir-layout.html)

* JDBC Input Configuration Options

| **Setting** | **Input type** | **Required** |
| :--- | :---: | :---: |
| clean_run | boolean | No |
| columns_charset | hash | No |
| connection_retry_attempts | number | No |
| connection_retry_attempts_wait_time | number | No |
| jdbc_connection_string | string | Yes |
| jdbc_default_timezone | string | No |
| jdbc_driver_class | string | Yes |
| jdbc_driver_library | string | No |
| jdbc_fetch_size | number | No |
| jdbc_page_size | number | No |
| jdbc_paging_enabled | boolean | No |
| jdbc_password | password | No |
| jdbc_password_filepath | a valid filesystem path | No |
| jdbc_pool_timeout | number | No |
| jdbc_user | string | Yes |
| jdbc_validate_connection | boolean | No |
| jdbc_validation_timeout | number | No |
| last_run_metadata_path | string | No |
| lowercase_column_names | boolean | No |
| parameters | hash | No |
| record_last_run | boolean | No |
| schedule | string | No |
| sequel_opts | hash | No |
| sql_log_level | string, one of ["fatal", "error", "warn", "info", debug"] | No |
| statement | string | No |
| statement_filepath | a valid filesystem path | No |
| tracking_column | string | No |
| tracking_column_type | string, one of ["numeric", "timestamp"] | No |
| use_column_value | boolean | No |

* Add MariaDB JDBC driver in library directory
    * [Download Site](https://downloads.mariadb.org/connector-java/2.4.1/)
    * Copy driver file in Logstash library directory

<div markdonw="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ cd $LOGSTASH_HOME/lib</span>
<span style="color: #d0d0d0">$ cp [location where driver is] .</span> 
</pre></div>

![screenshot004](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-004.png)

## Excecute Logstash

* Execute Logstash

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ cd $LOGSTASH_HOME</span>
<span style="color: #d0d0d0">$ bin/logstash -f config/[CONFIG_FILE_NAME]</span>
</pre></div>

![screenshot005](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-005.png)

* If. SQLException
    * If you face the situation like this, you should change configuraiton of MariaDB. Because the main cause of this is that MariaDB recognize double quotes which are being used in Logstash process.

    ![screenshot006](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-006.png)

    * In MariaDB, change SQL_MODE option

> ANSI_QUTOES : Changes " to be treated as `, the identifier quote character. This may break old MariaDB applications which assume that " is used as a string quote character.

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic"># mysql -uroot -p</span>

<span style="color: #d0d0d0">MariaDB [(none)]&gt; use mysql</span>
<span style="color: #d0d0d0">MariaDB [(mysq;)]&gt; SET GLOBAL sql_mode = &#39;ANSI_QUOTES&#39;;</span>
</pre></div>

![screenshot007](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-007.png)
    
## Verify the data

![screenshot008](/assets/images/posts/2019/03/2019-03-28-elastic-logstash-gettingstarted-008.png)


<br/>

------

## Refences
* [Getting Started with Logstash](https://www.elastic.co/guide/en/logstash/current/getting-started-with-logstash.html#getting-started-with-logstash)
* [Jdbc Input Plugin](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html)
* [ElasticSearch 실습1(logstash 활용)](https://vvhiteboard.github.io/general/2017/11/19/elasticsearch-ELK_example1/)
* [SQLSyntaxErrorException](https://discuss.elastic.co/t/sqlsyntaxerrorexception/102967)
* [MariaDB SQL_MODE](https://mariadb.com/kb/en/library/sql-mode/)