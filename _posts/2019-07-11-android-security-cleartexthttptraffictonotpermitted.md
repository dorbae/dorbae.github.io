---
layout: post
title: "[Android] Cleartext HTTP traffic to X.X.X not permitted"
comments: true
author: dorbae
date: 2019-07-11 +0900
categories : [Android, Security]
tags: [android,pie,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* Solve 'Cleartext HTTP traffic to X.X.X not permitted' error

<br/>

# Problem
* I replaced the target SDK 27 with 28(Pie 9.0)
* After that, when trying to communicate with server by HTTP protocol, this error occured

![screenshot001](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-001.png)

<br />

# Solution

## Cause
* From API level 28(Pie 9.0) it has been default to prevent unencrypted HTTP protocl

![screenshot002](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-002.png)

> [AndroidDeveloper](https://developer.android.com/training/articles/security-config#CleartextTrafficPermitted)

<br/> 

## 1. Add a Network Security Configuration file
* The Network Security Configuration feature uses an XML file where you specify the settings for your app

### 1.1 Add xml file in res/xml
* Create **network_security_config.xml** file in src/res/xml directory

![screenshot003](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-003.png)

![screenshot004](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-004.png)

<br />

### 1.2. Add options
* Recommend to allow only specific domains

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #1e889b">&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;</span>
<span style="color: #8B008B; font-weight: bold">&lt;network-security-config&gt;</span>
    <span style="color: #228B22">&lt;!-- Allow specific domains --&gt;</span>
    <span style="color: #8B008B; font-weight: bold">&lt;domain-config</span> <span style="color: #658b00">cleartextTrafficPermitted=</span><span style="color: #CD5555">&quot;true&quot;</span><span style="color: #8B008B; font-weight: bold">&gt;</span>
        <span style="color: #8B008B; font-weight: bold">&lt;domain</span> <span style="color: #658b00">includeSubdomains=</span><span style="color: #CD5555">&quot;true&quot;</span><span style="color: #8B008B; font-weight: bold">&gt;</span>iot.qubics.kr<span style="color: #8B008B; font-weight: bold">&lt;/domain&gt;</span>
    <span style="color: #8B008B; font-weight: bold">&lt;/domain-config&gt;</span>

    <span style="color: #228B22">&lt;!-- Allow all domains --&gt;</span>
    <span style="color: #228B22">&lt;!--</span>
<span style="color: #228B22">    &lt;base-config cleartextTrafficPermitted=&quot;true&quot; /&gt;</span>
<span style="color: #228B22">    --&gt;</span>

<span style="color: #8B008B; font-weight: bold">&lt;/network-security-config&gt;</span>
</pre></td></tr></table></div>

<br />

### 1.3. Edit AndroidManifest.xml
* Add **android:networkSecurityConfig="@xml/network_security_config"** option

<div style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7
8
9</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #1e889b">&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;</span>
<span style="color: #8B008B; font-weight: bold">&lt;manifest</span> <span style="color: #658b00">xmlns:android=</span><span style="color: #CD5555">&quot;http://schemas.android.com/apk/res/android&quot;</span>
    <span style="color: #658b00">package=</span><span style="color: #CD5555">&quot;io.dorbae.android&quot;</span><span style="color: #8B008B; font-weight: bold">&gt;</span>
    <span style="color: #8B008B; font-weight: bold">&lt;application</span>
       <span style="color: #658b00">android:networkSecurityConfig=</span><span style="color: #CD5555">&quot;@xml/network_security_config&quot;</span>
<span style="color: #a61717; background-color: #e3d2d2">...</span><span style="color: #8B008B; font-weight: bold">&gt;</span>
        ....
    <span style="color: #8B008B; font-weight: bold">&lt;/application&gt;</span>
<span style="color: #8B008B; font-weight: bold">&lt;/manifest&gt;</span>
</pre></td></tr></table></div>

![screenshot005](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-005.png)


<br />

## 2. Edit only AndroidManiofest.xml
* Add **android:useCleartextTraffic="true"** option

div style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7
8
9</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #1e889b">&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;</span>
<span style="color: #8B008B; font-weight: bold">&lt;manifest</span> <span style="color: #658b00">xmlns:android=</span><span style="color: #CD5555">&quot;http://schemas.android.com/apk/res/android&quot;</span>
    <span style="color: #658b00">package=</span><span style="color: #CD5555">&quot;io.dorbae.android&quot;</span><span style="color: #8B008B; font-weight: bold">&gt;</span>
    <span style="color: #8B008B; font-weight: bold">&lt;application</span>
       <span style="color: #658b00">android:usesCleartextTraffic=</span><span style="color: #CD5555">&quot;true&quot;</span>
<span style="color: #a61717; background-color: #e3d2d2">...</span><span style="color: #8B008B; font-weight: bold">&gt;</span>
        ....
    <span style="color: #8B008B; font-weight: bold">&lt;/application&gt;</span>
<span style="color: #8B008B; font-weight: bold">&lt;/manifest&gt;</span>
</pre></td></tr></table></div>

![screenshot006](/assets/images/posts/2019/07/2019-07-11-android-security-cleartexthttptraffictonotpermitted.md-006.png)

<br />

----------

## References
* [AndroidDeveloper NetworkSecurityPolicy](https://developer.android.com/reference/android/security/NetworkSecurityPolicy.html#isCleartextTrafficPermitted())
* [StackOverflow](https://stackoverflow.com/questions/50334686/cleartext-http-traffic-to-192-168-1-2-not-permitted)
* [박상권의 삽질블로그](https://gun0912.tistory.com/80)