---
layout: posts
title: "[ActiveMQ] JDBC Persistence Table Schema"
comments: true
categories: [Apache, ActiveMQ]
tags: [apache, activemq, mq, queue, messaging queue, persistence]
---

# ActiveMQ JDBC Persistence 스키마 정보

## Acknowledge Table

<div markdown="1" style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008000; font-weight: bold">CREATE</span> <span style="color: #008000; font-weight: bold">TABLE</span> ACTIVEMQ_ACKS (
      CONTAINER     <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , SUB_DEST      <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NULL</span>
    , CLIENT_ID     <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , SUB_NAME      <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , SELECTOR      <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NULL</span>
    , LAST_ACKED_ID <span style="color: #008000">BIGINT</span>          <span style="color: #008000; font-weight: bold">NULL</span>
    , PRIORITY      <span style="color: #008000">INTEGER</span>         <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , XID           <span style="color: #008000">BLOB</span>            <span style="color: #008000; font-weight: bold">NULL</span>
    , <span style="color: #008000; font-weight: bold">PRIMARY</span> <span style="color: #008000; font-weight: bold">KEY</span> (CONTAINER, CLIENT_ID, SUB_NAME, PRIORITY)
);
</pre></div>     
     
## Lock Table

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008000; font-weight: bold">CREATE</span> <span style="color: #008000; font-weight: bold">TABLE</span> ACTIVEMQ_LOCK (
      ID            <span style="color: #008000">BIGINT</span>          <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , TIME          <span style="color: #008000">BIGINT</span>          <span style="color: #008000; font-weight: bold">NULL</span>
    , BROKER_NAME   <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)    <span style="color: #008000; font-weight: bold">NULL</span>
    , <span style="color: #008000; font-weight: bold">CONSTRAINT</span> <span style="color: #008000; font-weight: bold">PRIMARY</span> <span style="color: #008000; font-weight: bold">KEY</span> (ID)
);
</pre></div>    
     
## Message Table

<div style="background: #f8f8f8; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008000; font-weight: bold">CREATE</span> <span style="color: #008000; font-weight: bold">TABLE</span> ACTIVEMQ_MSGS (
      ID         <span style="color: #008000">BIGINT</span>         <span style="color: #008000; font-weight: bold">NOT</span> <span style="color: #008000; font-weight: bold">NULL</span>
    , CONTAINER  <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)   <span style="color: #008000; font-weight: bold">NULL</span>
    , MSGID_PROD <span style="color: #008000">VARCHAR</span>(<span style="color: #666666">250</span>)   <span style="color: #008000; font-weight: bold">NULL</span>
    , MSGID_SEQ  <span style="color: #008000">INTEGER</span>        <span style="color: #008000; font-weight: bold">NULL</span>
    , EXPIRATION <span style="color: #008000">BIGINT</span>         <span style="color: #008000; font-weight: bold">NULL</span>
    , MSG        <span style="color: #008000">BLOB</span>           <span style="color: #008000; font-weight: bold">NULL</span>
    , PRIORITY   <span style="color: #008000">INTEGER</span>        <span style="color: #008000; font-weight: bold">NULL</span>
    , XID        <span style="color: #008000">BLOB</span>           <span style="color: #008000; font-weight: bold">NULL</span>
    , <span style="color: #008000; font-weight: bold">CONSTRAINT</span> <span style="color: #008000; font-weight: bold">PRIMARY</span> <span style="color: #008000; font-weight: bold">KEY</span> (ID)
);
</pre></div>
