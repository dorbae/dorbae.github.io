---
layout: post
title: "[Java] OpenCV Tutorial"
comments: true
author: dorbae
date: 2019-01-23 +0900
image: /assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-thumbnail.png
categories : [Java,OpenCV]
tags: [java,opencv,cv,tutorial]
sitemap :
  changefreq : weekly
---


# Goal
* OpenCV 를 통한 비디오 재생 구현

<br/>

# 들어가며

<br/>

# Practice
## 1. OpenCV 라이브러리 생성
* Ant 설치 
    <div style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ brew install ant</span>
</pre></div>

> Ant 설치를 위해서는 /usr/local/bin에 권한이 있어야함

> sudo chown -R [USER_NAME] /usr/local/include /usr/local/lib /usr/local/lib/pkgconfig

![screenshot001](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-001.png)

* Java OpenCV 설치를 위해서 brew formula 수정
    * -DBUILD_opencv_java=OFF -> -DBUILD_opencv_java=ON

    <div style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ brew edit opencv</span>

    <span style="color: #ffffff">[edit]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-002.gif)

* OpenCV 빌드

    <div style="background: #111111; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #ffffff">$ brew install --build-from-source opencv</span>
</pre></div>

![screenshot003](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-003.gif)

    
* 에러 발생
    * brew link 중 디렉터리 권한이 없어 에러 발생
    * 권한 부여 후 제거/재설치

![screenshot004](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-004.png)

![screenshot005](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-005.png)
     
* 라이브러리 파일 (dll, jar) 생성 확인

![screenshot006](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-006.png)

<br/>

## 2. Java 프로젝트에 라이브러리 적용
* 라이브러리 프로젝트 내 라이브러리 디렉터리에 복사

![screenshot007](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-007.png)

* 프로젝트 우클릭 > Build Path > Configure Build Path...

![screenshot008](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-008.png)

* OpenCV jar 추가
    * Add JARs... > opencv jar

![screenshot014](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-014.png)

![screenshot015](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-015.png)

* Native library location > Edit

![screenshot016](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-016.png)

* Workspace > [프로젝트명] > lib

![screenshot010](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-010.png)

![screenshot011](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-011.png)

* 동영상 재생 코드 작성

<div markdown="1" style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%"> 1
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
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #f92672">package</span> <span style="color: #f8f8f2">io</span><span style="color: #f92672">.</span><span style="color: #a6e22e">dorbae</span><span style="color: #f92672">.</span><span style="color: #a6e22e">opencv</span><span style="color: #f92672">.</span><span style="color: #a6e22e">tutorial</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">java.awt.image.BufferedImage</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">java.io.ByteArrayInputStream</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">javax.imageio.ImageIO</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">javax.swing.ImageIcon</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">javax.swing.JFrame</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">javax.swing.JLabel</span><span style="color: #f92672">;</span>

<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.opencv.core.Core</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.opencv.core.Mat</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.opencv.core.MatOfByte</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.opencv.imgcodecs.Imgcodecs</span><span style="color: #f92672">;</span>
<span style="color: #f92672">import</span> <span style="color: #f8f8f2">org.opencv.videoio.VideoCapture</span><span style="color: #f92672">;</span>

<span style="color: #75715e">/*</span>
<span style="color: #75715e"> *************************************************</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> * VideoPlayer.java</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> *************************************************</span>
<span style="color: #75715e"> * </span>
<span style="color: #75715e"> * @version 1.0.0	2019-01-23 17:37	Initialize</span>
<span style="color: #75715e"> * @author dorbae</span>
<span style="color: #75715e"> * @since 1.0.0</span>
<span style="color: #75715e"> *</span>
<span style="color: #75715e"> */</span>
<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">class</span> <span style="color: #a6e22e">VideoPlayer</span> <span style="color: #f92672">{</span>

	<span style="color: #66d9ef">public</span> <span style="color: #a6e22e">VideoPlayer</span><span style="color: #f92672">()</span> <span style="color: #f92672">{}</span>
	
	<span style="color: #75715e">/*</span>
<span style="color: #75715e">	 * </span>
<span style="color: #75715e">	 *</span>
<span style="color: #75715e">	 * @param args</span>
<span style="color: #75715e">	 * </span>
<span style="color: #75715e">	 * @version 1.0.0	2019-01-23 17:38	Initialize</span>
<span style="color: #75715e">	 * @author dorbae</span>
<span style="color: #75715e">	 * @since 1.0.0</span>
<span style="color: #75715e">	 *</span>
<span style="color: #75715e">	 */</span>
	<span style="color: #66d9ef">public</span> <span style="color: #66d9ef">static</span> <span style="color: #66d9ef">void</span> <span style="color: #a6e22e">main</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">String</span><span style="color: #f92672">[]</span> <span style="color: #f8f8f2">args</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
		<span style="color: #75715e">// Native 라이브러리 로드</span>
		<span style="color: #f8f8f2">System</span><span style="color: #f92672">.</span><span style="color: #a6e22e">loadLibrary</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">Core</span><span style="color: #f92672">.</span><span style="color: #a6e22e">NATIVE_LIBRARY_NAME</span><span style="color: #f92672">);</span>
		
		<span style="color: #75715e">// 로드할 영상</span>
	    <span style="color: #f8f8f2">VideoCapture</span> <span style="color: #f8f8f2">camera</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">VideoCapture</span><span style="color: #f92672">(</span><span style="color: #e6db74">&quot;/Users/dorbae/Downloads/wedding.avi&quot;</span><span style="color: #f92672">);</span>
	    
	    <span style="color: #75715e">// Video 출력 화면 프레임</span>
	    <span style="color: #f8f8f2">JFrame</span> <span style="color: #f8f8f2">jframe</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">JFrame</span><span style="color: #f92672">(</span><span style="color: #e6db74">&quot;OpenCV Tutorial by dorbae&quot;</span><span style="color: #f92672">);</span>
	    <span style="color: #f8f8f2">jframe</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setDefaultCloseOperation</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">JFrame</span><span style="color: #f92672">.</span><span style="color: #a6e22e">EXIT_ON_CLOSE</span><span style="color: #f92672">);</span>
	    <span style="color: #f8f8f2">JLabel</span> <span style="color: #f8f8f2">vidpanel</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">JLabel</span><span style="color: #f92672">();</span>
	    <span style="color: #f8f8f2">jframe</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setContentPane</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">vidpanel</span><span style="color: #f92672">);</span>
	    <span style="color: #f8f8f2">jframe</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setVisible</span><span style="color: #f92672">(</span><span style="color: #66d9ef">true</span><span style="color: #f92672">);</span>
	    <span style="color: #f8f8f2">jframe</span><span style="color: #f92672">.</span><span style="color: #a6e22e">doLayout</span><span style="color: #f92672">();</span>
	    <span style="color: #f8f8f2">jframe</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setBounds</span><span style="color: #f92672">(</span><span style="color: #ae81ff">0</span><span style="color: #f92672">,</span> <span style="color: #ae81ff">0</span><span style="color: #f92672">,</span> <span style="color: #ae81ff">640</span><span style="color: #f92672">,</span> <span style="color: #ae81ff">480</span><span style="color: #f92672">);</span>
	    
	    <span style="color: #f8f8f2">Mat</span> <span style="color: #f8f8f2">frame</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">Mat</span><span style="color: #f92672">();</span>	<span style="color: #75715e">// Frame</span>
	    <span style="color: #66d9ef">try</span> <span style="color: #f92672">{</span>
		    <span style="color: #66d9ef">while</span> <span style="color: #f92672">(</span> <span style="color: #66d9ef">true</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
		        <span style="color: #66d9ef">if</span> <span style="color: #f92672">(</span> <span style="color: #f8f8f2">camera</span><span style="color: #f92672">.</span><span style="color: #a6e22e">read</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">frame</span><span style="color: #f92672">))</span> <span style="color: #f92672">{</span>
		        	<span style="color: #75715e">// 이미지 로드</span>
		            <span style="color: #f8f8f2">ImageIcon</span> <span style="color: #f8f8f2">image</span> <span style="color: #f92672">=</span> <span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">ImageIcon</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">Mat2BufferedImage</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">frame</span><span style="color: #f92672">));</span>
		            <span style="color: #f8f8f2">vidpanel</span><span style="color: #f92672">.</span><span style="color: #a6e22e">setIcon</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">image</span><span style="color: #f92672">);</span>
		            <span style="color: #f8f8f2">vidpanel</span><span style="color: #f92672">.</span><span style="color: #a6e22e">repaint</span><span style="color: #f92672">();</span>
		        <span style="color: #f92672">}</span>
		    <span style="color: #f92672">}</span>
	    <span style="color: #f92672">}</span> <span style="color: #66d9ef">catch</span><span style="color: #f92672">(</span> <span style="color: #f8f8f2">Exception</span> <span style="color: #f8f8f2">e</span><span style="color: #f92672">)</span> <span style="color: #f92672">{</span>
	    	<span style="color: #f8f8f2">e</span><span style="color: #f92672">.</span><span style="color: #a6e22e">printStackTrace</span><span style="color: #f92672">();</span>
	    <span style="color: #f92672">}</span>
	<span style="color: #f92672">}</span>
	
	<span style="color: #75715e">/*</span>
<span style="color: #75715e">	 * </span>
<span style="color: #75715e">	 *</span>
<span style="color: #75715e">	 * @param matrix</span>
<span style="color: #75715e">	 * @return</span>
<span style="color: #75715e">	 * @throws Exception</span>
<span style="color: #75715e">	 * </span>
<span style="color: #75715e">	 * @version 1.0.0	2019-01-25 11:33	Initialize</span>
<span style="color: #75715e">	 * @autho dorbae</span>
<span style="color: #75715e">	 * @since 1.0.0</span>
<span style="color: #75715e">	 *</span>
<span style="color: #75715e">	 */</span>
	<span style="color: #66d9ef">private</span> <span style="color: #66d9ef">static</span> <span style="color: #f8f8f2">BufferedImage</span> <span style="color: #a6e22e">Mat2BufferedImage</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">Mat</span> <span style="color: #f8f8f2">matrix</span><span style="color: #f92672">)</span><span style="color: #66d9ef">throws</span> <span style="color: #f8f8f2">Exception</span> <span style="color: #f92672">{</span>        
	    <span style="color: #f8f8f2">MatOfByte</span> <span style="color: #f8f8f2">mob</span><span style="color: #f92672">=</span><span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">MatOfByte</span><span style="color: #f92672">();</span>
	    <span style="color: #f8f8f2">Imgcodecs</span><span style="color: #f92672">.</span><span style="color: #a6e22e">imencode</span><span style="color: #f92672">(</span><span style="color: #e6db74">&quot;.jpg&quot;</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">matrix</span><span style="color: #f92672">,</span> <span style="color: #f8f8f2">mob</span><span style="color: #f92672">);</span>
	    <span style="color: #66d9ef">byte</span> <span style="color: #f8f8f2">ba</span><span style="color: #f92672">[]=</span><span style="color: #f8f8f2">mob</span><span style="color: #f92672">.</span><span style="color: #a6e22e">toArray</span><span style="color: #f92672">();</span>

	    <span style="color: #f8f8f2">BufferedImage</span> <span style="color: #f8f8f2">bi</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">ImageIO</span><span style="color: #f92672">.</span><span style="color: #a6e22e">read</span><span style="color: #f92672">(</span><span style="color: #66d9ef">new</span> <span style="color: #f8f8f2">ByteArrayInputStream</span><span style="color: #f92672">(</span><span style="color: #f8f8f2">ba</span><span style="color: #f92672">));</span>
	    <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">bi</span><span style="color: #f92672">;</span>
	<span style="color: #f92672">}</span>
<span style="color: #f92672">}</span>
</pre></td></tr></table></div>

    

![screenshot012](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-012.png)

> 에러 (opencv 4.0.1 jar는 java 11 버전에서 빌드)) -> runtime java 버전 변경

![screenshot013](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-013.png)


* 실행결과

![screenshot017](/assets/images/posts/2019/01/2019-01-23-java-opencv-opencvtutorial-017.gif)

<br/>

-----------

## References
* [OpenCV Java Tutorial](https://opencv-java-tutorials.readthedocs.io/en/latest/01-installing-opencv-for-java.html#)