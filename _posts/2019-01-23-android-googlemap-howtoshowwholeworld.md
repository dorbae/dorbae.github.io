---
layout: post
title: "[Android] How to show whole world in android google map api"
comments: true
image: /assets/images/posts/2019/01/2019-01-23-android-googlemap-howtoshowwholeworld-thumbnail.png
author: dorbae
date: 2019-01-23 +0900
image: https://dorbae.github.io/assets/images/posts/2019/01/2019-01-06-python-django-startup-tutorial-001-thumnail.png
categories : [Android,Google Map]
tags: [android,google,maps,api,map,google map,lite mode,whole world]
sitemap :
  changefreq : weekly
---

# Goal
* Android에서 Google Map API를 통해 전세계 지도를 한 눈에 보기

<br/>

# Problems
* Android App 화면에 전 세계 지도를 볼 수 있는 기능 구현 중에, Zoom Level을 1(Whole World)[^1]로 설정해도 지도에 전체가 보이지 않는 현상 발생

![screenshot001](/assets/images/posts/2019/01/2019-01-23-android-googlemap-howtoshowwholeworld-001.png)

<br/>

# Solutions
## 1. Google Map Lite Mode 적용
* Lite Mode는 구글 맵에서 특정 지역들만을 나타내는 비트맵 이
미지
* 많은 맵을 스트리밍으로 서비스 하거나 너무 작은 화면에 맵을 출력해야될 때 이용
* Layout XML attribute에 map:liteMode="true" 항목 추가

<div style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #fb660a; font-weight: bold">&lt;fragment</span> <span style="color: #ff0086; font-weight: bold">xmlns:android=</span><span style="color: #0086d2">&quot;http://schemas.android.com/apk/res/android&quot;</span>
    <span style="color: #ff0086; font-weight: bold">xmlns:map=</span><span style="color: #0086d2">&quot;http://schemas.android.com/apk/res-auto&quot;</span>
    <span style="color: #ff0086; font-weight: bold">android:name=</span><span style="color: #0086d2">&quot;com.google.android.gms.maps.MapFragment&quot;</span>
    <span style="color: #ff0086; font-weight: bold">android:id=</span><span style="color: #0086d2">&quot;@+id/map&quot;</span>
    <span style="color: #ff0086; font-weight: bold">android:layout_width=</span><span style="color: #0086d2">&quot;match_parent&quot;</span>
    <span style="color: #ff0086; font-weight: bold">android:layout_height=</span><span style="color: #0086d2">&quot;match_parent&quot;</span>
    <span style="color: #ff0086; font-weight: bold">map:cameraZoom=</span><span style="color: #0086d2">&quot;13&quot;</span>
    <span style="color: #ff0086; font-weight: bold">map:mapType=</span><span style="color: #0086d2">&quot;normal&quot;</span>
    <span style="color: #ff0086; font-weight: bold">map:liteMode=</span><span style="color: #0086d2">&quot;true&quot;</span><span style="color: #fb660a; font-weight: bold">/&gt;</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/01/2019-01-23-android-googlemap-howtoshowwholeworld-002.png)

<br/>

## 2. LatlngBounds 적용
* 화면이 작아 Lite Mode를 적용해도 전체 지도가 한번에 출력되지 않을 수도 있다.

![screenshot003](/assets/images/posts/2019/01/2019-01-23-android-googlemap-howtoshowwholeworld-003.png)

<div style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #f8f8f2">SupportMapFragment</span> <span style="color: #f8f8f2">mapFragment</span> <span style="color: #f92672">=</span> <span style="color: #f92672">(</span><span style="color: #f8f8f2">SupportMapFragment</span><span style="color: #f92672">)</span> <span style="color: #f8f8f2">getSupportFragmentManager</span><span style="color: #f92672">().</span><span style="color: #a6e22e">findFragmentById</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">R</span><span style="color: #f92672">.</span><span style="color: #a6e22e">id</span><span style="color: #f92672">.</span><span style="color: #a6e22e">mapViewLocationDashboard</span><span style="color: #f92672">);</span>
            <span style="color: #f8f8f2">mapFragment</span><span style="color: #f92672">.</span><span style="color: #a6e22e">getMapAsync</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">googleMap</span> <span style="color: #f92672">-&gt;</span> <span style="color: #f92672">{</span>
                <span style="color: #f8f8f2">LatLngBounds</span> <span style="color: #f8f8f2">bound</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">LatLngBounds</span><span style="color: #f92672">(</span>
                        <span style="color: #66d9ef">new</span> <span style="color: #a6e22e">LatLng</span><span style="color: #f92672">(-</span><span style="color: #ae81ff">85</span><span style="color: #f92672">,</span> <span style="color: #ae81ff">180</span><span style="color: #f92672">),</span>    <span style="color: #75715e">// bottom right corner</span>
                        <span style="color: #66d9ef">new</span> <span style="color: #a6e22e">LatLng</span><span style="color: #f92672">(</span><span style="color: #ae81ff">85</span><span style="color: #f92672">,</span> <span style="color: #f92672">-</span><span style="color: #ae81ff">180</span><span style="color: #f92672">)</span>    <span style="color: #75715e">// top left corner of map);</span>
                <span style="color: #f92672">);</span>
                <span style="color: #f8f8f2">googleMap</span><span style="color: #f92672">.</span><span style="color: #a6e22e">animateCamera</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">CameraUpdateFactory</span><span style="color: #f92672">.</span><span style="color: #a6e22e">newLatLngBounds</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">bound</span><span style="color: #f92672">,</span> <span style="color: #ae81ff">5</span><span style="color: #f92672">));</span> <span style="color: #75715e">// bound, padding</span>
            <span style="color: #f92672">});</span>
</pre></div>

![screenshot004](/assets/images/posts/2019/01/2019-01-23-android-googlemap-howtoshowwholeworld-004.png)

<br/>

------

## References
* [Google Maps Platform](https://developers.google.com/maps/documentation/javascript/tutorial)
* [Google Maps Platform > Lite Mode](https://developers.google.com/maps/documentation/android-sdk/lite)
* [Stack Overflow](https://stackoverflow.com/questions/9893680/google-maps-api-v3-show-the-whole-world)

-------------

[^1]: 
* 1: World
* 5: Landmass/continent
* 10: City
* 15: Streets
* 20: Buildings