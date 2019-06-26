---
layout: post
title: "[Django] Download files"
comments: true
author: dorbae
date: 2019-06-26 +0900
categories : [Python, Django]
tags: [python,django,download]
sitemap :
  changefreq : weekly
---

# Goal
* How to impletement the function which support file download in Django

<br/>

# Intro
* I wanted to make people download apk file in my REST server

<br />

# Practice

## 1. Create App and setup files

### 1.1. Start app

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">(venv) $ python manage.py startapp [APP_NAME]</span>
</pre></div>

[!screenshot001](/assets/images/posts/2019/06/2019-06-26-python-django-downloadfile-001.png)

<br />

### 1.2 Setup files to be downloaded
* You can put files in anywhere, but I made 'files' directory in created app directory. And I put my files in there.
* In my case, I created new sub directory name 'apk' and put my apk files in there.

[!screenshot002](/assets/images/posts/2019/06/2019-06-26-python-django-downloadfile-002.png)

<br />

## 2. Create function for download

* Code

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic"># Request for downloading</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># Version   Date        Author          Description</span>
<span style="color: #999999; font-style: italic">############################################################</span>
<span style="color: #999999; font-style: italic"># 1.0.0     2019-06-26  dorbae          Initialize</span>
<span style="color: #999999; font-style: italic">############################################################</span>

<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.http</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">HttpResponse,</span> <span style="color: #d0d0d0">Http404</span>
<span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #447fcf; text-decoration: underline">os</span>

<span style="color: #999999; font-style: italic"># Django project base directory</span>
<span style="color: #d0d0d0">BASE_DIR</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">os.path.dirname(os.path.dirname(os.path.abspath(__file__)))</span>


<span style="color: #999999; font-style: italic">#</span>
<span style="color: #999999; font-style: italic"># Download APK file</span>
<span style="color: #999999; font-style: italic">#</span>
<span style="color: #6ab825; font-weight: bold">def</span> <span style="color: #447fcf">download_apk</span><span style="color: #d0d0d0">(request,</span> <span style="color: #d0d0d0">file_base_name):</span>
    <span style="color: #24909d">print</span><span style="color: #d0d0d0">(</span><span style="color: #ed9d13">&#39;Download &#39;</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">file_base_name</span> <span style="color: #d0d0d0">+</span> <span style="color: #ed9d13">&#39;.apk...&#39;</span><span style="color: #d0d0d0">)</span>
    <span style="color: #999999; font-style: italic"># Full path of file</span>
    <span style="color: #d0d0d0">file_path</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">BASE_DIR</span> <span style="color: #d0d0d0">+</span> <span style="color: #ed9d13">&#39;/download/files/apk/&#39;</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">file_base_name</span> <span style="color: #d0d0d0">+</span> <span style="color: #ed9d13">&#39;.apk&#39;</span>
    <span style="color: #6ab825; font-weight: bold">if</span> <span style="color: #d0d0d0">os.path.exists(file_path):</span>
        <span style="color: #6ab825; font-weight: bold">with</span> <span style="color: #24909d">open</span><span style="color: #d0d0d0">(file_path,</span> <span style="color: #ed9d13">&#39;rb&#39;</span><span style="color: #d0d0d0">)</span> <span style="color: #6ab825; font-weight: bold">as</span> <span style="color: #d0d0d0">fh:</span>
            <span style="color: #d0d0d0">response</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">HttpResponse(fh.read(),</span> <span style="color: #d0d0d0">content_type=</span><span style="color: #ed9d13">&quot;application/force_download&quot;</span><span style="color: #d0d0d0">)</span>
            <span style="color: #d0d0d0">response[</span><span style="color: #ed9d13">&#39;Content-Disposition&#39;</span><span style="color: #d0d0d0">]</span> <span style="color: #d0d0d0">=</span> <span style="color: #ed9d13">&#39;inline; filename=&#39;</span> <span style="color: #d0d0d0">+</span> <span style="color: #d0d0d0">os.path.basename(file_path)</span>
            <span style="color: #6ab825; font-weight: bold">return</span> <span style="color: #d0d0d0">response</span>
    <span style="color: #999999; font-style: italic"># If file is not exists</span>
    <span style="color: #6ab825; font-weight: bold">raise</span> <span style="color: #d0d0d0">Http404</span>
</pre></td></tr></table></div>

<br />

## 3. URL Mapping
### 3.1. Edit [APP]/urls.py

* Code

<div style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">1
2
3
4
5
6
7</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">django.urls</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">path</span>

<span style="color: #6ab825; font-weight: bold">from</span> <span style="color: #447fcf; text-decoration: underline">.</span> <span style="color: #6ab825; font-weight: bold">import</span> <span style="color: #d0d0d0">views</span>

<span style="color: #d0d0d0">urlpatterns</span> <span style="color: #d0d0d0">=</span> <span style="color: #d0d0d0">[</span>
    <span style="color: #d0d0d0">path(</span><span style="color: #ed9d13">&#39;apks/&lt;str:file_base_name&gt;/&#39;</span><span style="color: #d0d0d0">,</span> <span style="color: #d0d0d0">views.download_apk,</span> <span style="color: #d0d0d0">name=</span><span style="color: #ed9d13">&#39;download_apk&#39;</span><span style="color: #d0d0d0">),</span>
<span style="color: #d0d0d0">]</span>
</pre></td></tr></table></div>

<br />

### 3.2. Edit [PROJECT]/urls.py
* Add URL Pattern

[!screenshot003](/assets/images/posts/2019/06/2019-06-26-python-django-downloadfile-003.png)

<br />

## 4. Test

[!screenshot004](/assets/images/posts/2019/06/2019-06-26-python-django-downloadfile-004.png)

<br />

----------

## References
* [Stackoverflow](https://stackoverflow.com/questions/36392510/django-download-a-file)