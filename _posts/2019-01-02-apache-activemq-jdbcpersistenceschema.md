---
layout: post
title: "[ActiveMQ] JDBC Persistence Table Schema"
comments: true
author: dorbae
date: 2019-01-02 +0900
image: ../assets/images/posts/2019/01/2019-01-02-apache-activemq-jdbcpersistenceschema_thumnail.png
categories: [Apache, ActiveMQ]
tags: [apache, activemq, mq, queue, messaging queue, persistence]
sitemap :
  changefreq : weekly
---

# Goal
* ActiveMQ JDBC Persistence에서 사용하는 테이블 스키마 정보 정리

<br/>

# ActiveMQ JDBC Persistence 스키마 정보

## Acknowledge Table

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">CREATE</span> <span style="color: #fb660a; font-weight: bold">TABLE</span> <span style="color: #ffffff">ACTIVEMQ_ACKS</span> <span style="color: #ffffff">(</span>
      <span style="color: #ffffff">CONTAINER</span>     <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">SUB_DEST</span>      <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">CLIENT_ID</span>     <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">SUB_NAME</span>      <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">SELECTOR</span>      <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">LAST_ACKED_ID</span> <span style="color: #ffffff">BIGINT</span>          <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">PRIORITY</span>      <span style="color: #ffffff">INTEGER</span>         <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">XID</span>           <span style="color: #ffffff">BLOB</span>            <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #fb660a; font-weight: bold">PRIMARY</span> <span style="color: #fb660a; font-weight: bold">KEY</span> <span style="color: #ffffff">(CONTAINER,</span> <span style="color: #ffffff">CLIENT_ID,</span> <span style="color: #ffffff">SUB_NAME,</span> <span style="color: #ffffff">PRIORITY)</span>
<span style="color: #ffffff">);</span>
</pre></div>
  
<br/>

## Lock Table

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">CREATE</span> <span style="color: #fb660a; font-weight: bold">TABLE</span> <span style="color: #ffffff">ACTIVEMQ_LOCK</span> <span style="color: #ffffff">(</span>
      <span style="color: #ffffff">ID</span>            <span style="color: #ffffff">BIGINT</span>          <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">TIME</span>          <span style="color: #ffffff">BIGINT</span>          <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">BROKER_NAME</span>   <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>    <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #fb660a; font-weight: bold">CONSTRAINT</span> <span style="color: #fb660a; font-weight: bold">PRIMARY</span> <span style="color: #fb660a; font-weight: bold">KEY</span> <span style="color: #ffffff">(ID)</span>
<span style="color: #ffffff">);</span>
</pre></div>
   
<br/>

## Message Table

<div markdown="1" style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">CREATE</span> <span style="color: #fb660a; font-weight: bold">TABLE</span> <span style="color: #ffffff">ACTIVEMQ_MSGS</span> <span style="color: #ffffff">(</span>
      <span style="color: #ffffff">ID</span>         <span style="color: #ffffff">BIGINT</span>         <span style="color: #fb660a; font-weight: bold">NOT</span> <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">CONTAINER</span>  <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>   <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">MSGID_PROD</span> <span style="color: #ffffff">VARCHAR(</span><span style="color: #0086f7; font-weight: bold">250</span><span style="color: #ffffff">)</span>   <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">MSGID_SEQ</span>  <span style="color: #ffffff">INTEGER</span>        <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">EXPIRATION</span> <span style="color: #ffffff">BIGINT</span>         <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">MSG</span>        <span style="color: #ffffff">BLOB</span>           <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">PRIORITY</span>   <span style="color: #ffffff">INTEGER</span>        <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #ffffff">XID</span>        <span style="color: #ffffff">BLOB</span>           <span style="color: #fb660a; font-weight: bold">NULL</span>
    <span style="color: #ffffff">,</span> <span style="color: #fb660a; font-weight: bold">CONSTRAINT</span> <span style="color: #fb660a; font-weight: bold">PRIMARY</span> <span style="color: #fb660a; font-weight: bold">KEY</span> <span style="color: #ffffff">(ID)</span>
<span style="color: #ffffff">);</span>
</pre></div>

