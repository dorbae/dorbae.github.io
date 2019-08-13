---
layout: post
title: "[Android] Build error : Execution failed for task ':app:transformDexWithInstantRunslicesApkForDebug after upgrading Android Studio"
comments: true
author: dorbae
date: 2019-08-13 +0900
categories : [Android,Android Studio]
tags: [android,androidstudio,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* Solve the problem error related with build

<br />

# Problem
* I upgraded Android Studio 3.2.1 -> 3.4.2

![screenshoot001](/assets/images/posts/2019/08/2019-08-13-android-androidstudio-resourcesaperrorafterupgradingandroidstudio-001.png)

<br />

* After that, when I built a program, the error occured like below

![screenshoot002](/assets/images/posts/2019/08/2019-08-13-android-androidstudio-resourcesaperrorafterupgradingandroidstudio-002.png)

<div markdown="1" style="background: #eeeedd; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><table><tr><td><pre style="margin: 0; line-height: 125%">  1
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
 94
 95
 96
 97
 98
 99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182</pre></td><td><pre style="margin: 0; line-height: 125%">org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">MultipleBuildFailures</span>: Build completed with <span style="color: #B452CD">1</span> failures.
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">initialization</span>.<span style="color: #658b00">DefaultGradleLauncher</span>$ExecuteTasks.<span style="color: #658b00">run</span>(DefaultGradleLauncher.<span style="color: #658b00">java</span>:<span style="color: #B452CD">386</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$RunnableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">301</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$RunnableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">293</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">175</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">run</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">91</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DelegatingBuildOperationExecutor</span>.<span style="color: #658b00">run</span>(DelegatingBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">31</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">initialization</span>.<span style="color: #658b00">DefaultGradleLauncher</span>.<span style="color: #658b00">runTasks</span>(DefaultGradleLauncher.<span style="color: #658b00">java</span>:<span style="color: #B452CD">247</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">initialization</span>.<span style="color: #658b00">DefaultGradleLauncher</span>.<span style="color: #658b00">doBuildStages</span>(DefaultGradleLauncher.<span style="color: #658b00">java</span>:<span style="color: #B452CD">159</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">initialization</span>.<span style="color: #658b00">DefaultGradleLauncher</span>.<span style="color: #658b00">executeTasks</span>(DefaultGradleLauncher.<span style="color: #658b00">java</span>:<span style="color: #B452CD">134</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>$1.<span style="color: #658b00">execute</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">58</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>$1.<span style="color: #658b00">execute</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>$3.<span style="color: #658b00">create</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">82</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>$3.<span style="color: #658b00">create</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">75</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">work</span>.<span style="color: #658b00">DefaultWorkerLeaseService</span>.<span style="color: #658b00">withLocks</span>(DefaultWorkerLeaseService.<span style="color: #658b00">java</span>:<span style="color: #B452CD">183</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">work</span>.<span style="color: #658b00">StopShieldingWorkerLeaseService</span>.<span style="color: #658b00">withLocks</span>(StopShieldingWorkerLeaseService.<span style="color: #658b00">java</span>:<span style="color: #B452CD">40</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>.<span style="color: #658b00">doBuild</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">75</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">invocation</span>.<span style="color: #658b00">GradleBuildController</span>.<span style="color: #658b00">run</span>(GradleBuildController.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">runner</span>.<span style="color: #658b00">ClientProvidedBuildActionRunner</span>.<span style="color: #658b00">run</span>(ClientProvidedBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ChainingBuildActionRunner</span>.<span style="color: #658b00">run</span>(ChainingBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">35</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ChainingBuildActionRunner</span>.<span style="color: #658b00">run</span>(ChainingBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">35</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildOutcomeReportingBuildActionRunner</span>.<span style="color: #658b00">run</span>(BuildOutcomeReportingBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">58</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">ValidatingBuildActionRunner</span>.<span style="color: #658b00">run</span>(ValidatingBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">32</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildCompletionNotifyingBuildActionRunner</span>.<span style="color: #658b00">run</span>(BuildCompletionNotifyingBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">39</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">RunAsBuildOperationBuildActionRunner</span>$3.<span style="color: #658b00">call</span>(RunAsBuildOperationBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">RunAsBuildOperationBuildActionRunner</span>$3.<span style="color: #658b00">call</span>(RunAsBuildOperationBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">44</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$CallableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">315</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$CallableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">305</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">175</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">call</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">101</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DelegatingBuildOperationExecutor</span>.<span style="color: #658b00">call</span>(DelegatingBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">RunAsBuildOperationBuildActionRunner</span>.<span style="color: #658b00">run</span>(RunAsBuildOperationBuildActionRunner.<span style="color: #658b00">java</span>:<span style="color: #B452CD">44</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">InProcessBuildActionExecuter</span>$1.<span style="color: #658b00">transform</span>(InProcessBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">InProcessBuildActionExecuter</span>$1.<span style="color: #658b00">transform</span>(InProcessBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">46</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">composite</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">DefaultRootBuildState</span>.<span style="color: #658b00">run</span>(DefaultRootBuildState.<span style="color: #658b00">java</span>:<span style="color: #B452CD">78</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">InProcessBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(InProcessBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">46</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">InProcessBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(InProcessBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">31</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildTreeScopeBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(BuildTreeScopeBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">42</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildTreeScopeBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(BuildTreeScopeBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">28</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">ContinuousBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(ContinuousBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">78</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">ContinuousBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(ContinuousBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">52</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SubscribableBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(SubscribableBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">59</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SubscribableBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(SubscribableBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SessionScopeBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(SessionScopeBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">68</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SessionScopeBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(SessionScopeBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">38</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">GradleThreadBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(GradleThreadBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">37</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">GradleThreadBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(GradleThreadBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">26</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">ParallelismConfigurationBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(ParallelismConfigurationBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">43</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">ParallelismConfigurationBuildActionExecuter</span>.<span style="color: #658b00">execute</span>(ParallelismConfigurationBuildActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">29</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">StartParamsValidatingActionExecuter</span>.<span style="color: #658b00">execute</span>(StartParamsValidatingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">60</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">StartParamsValidatingActionExecuter</span>.<span style="color: #658b00">execute</span>(StartParamsValidatingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">32</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SessionFailureReportingActionExecuter</span>.<span style="color: #658b00">execute</span>(SessionFailureReportingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SessionFailureReportingActionExecuter</span>.<span style="color: #658b00">execute</span>(SessionFailureReportingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">41</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SetupLoggingActionExecuter</span>.<span style="color: #658b00">execute</span>(SetupLoggingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">48</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">tooling</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">provider</span>.<span style="color: #658b00">SetupLoggingActionExecuter</span>.<span style="color: #658b00">execute</span>(SetupLoggingActionExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">32</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ExecuteBuild</span>.<span style="color: #658b00">doBuild</span>(ExecuteBuild.<span style="color: #658b00">java</span>:<span style="color: #B452CD">67</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildCommandOnly</span>.<span style="color: #658b00">execute</span>(BuildCommandOnly.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">WatchForDisconnection</span>.<span style="color: #658b00">execute</span>(WatchForDisconnection.<span style="color: #658b00">java</span>:<span style="color: #B452CD">37</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ResetDeprecationLogger</span>.<span style="color: #658b00">execute</span>(ResetDeprecationLogger.<span style="color: #658b00">java</span>:<span style="color: #B452CD">26</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">RequestStopIfSingleUsedDaemon</span>.<span style="color: #658b00">execute</span>(RequestStopIfSingleUsedDaemon.<span style="color: #658b00">java</span>:<span style="color: #B452CD">34</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ForwardClientInput</span>$2.<span style="color: #658b00">call</span>(ForwardClientInput.<span style="color: #658b00">java</span>:<span style="color: #B452CD">74</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ForwardClientInput</span>$2.<span style="color: #658b00">call</span>(ForwardClientInput.<span style="color: #658b00">java</span>:<span style="color: #B452CD">72</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">util</span>.<span style="color: #658b00">Swapper</span>.<span style="color: #658b00">swap</span>(Swapper.<span style="color: #658b00">java</span>:<span style="color: #B452CD">38</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">ForwardClientInput</span>.<span style="color: #658b00">execute</span>(ForwardClientInput.<span style="color: #658b00">java</span>:<span style="color: #B452CD">72</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">LogAndCheckHealth</span>.<span style="color: #658b00">execute</span>(LogAndCheckHealth.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">LogToClient</span>.<span style="color: #658b00">doBuild</span>(LogToClient.<span style="color: #658b00">java</span>:<span style="color: #B452CD">62</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildCommandOnly</span>.<span style="color: #658b00">execute</span>(BuildCommandOnly.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">EstablishBuildEnvironment</span>.<span style="color: #658b00">doBuild</span>(EstablishBuildEnvironment.<span style="color: #658b00">java</span>:<span style="color: #B452CD">81</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">BuildCommandOnly</span>.<span style="color: #658b00">execute</span>(BuildCommandOnly.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">DaemonCommandExecution</span>.<span style="color: #658b00">proceed</span>(DaemonCommandExecution.<span style="color: #658b00">java</span>:<span style="color: #B452CD">104</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">exec</span>.<span style="color: #658b00">StartBuildOrRespondWithBusy</span>$1.<span style="color: #658b00">run</span>(StartBuildOrRespondWithBusy.<span style="color: #658b00">java</span>:<span style="color: #B452CD">50</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">launcher</span>.<span style="color: #658b00">daemon</span>.<span style="color: #658b00">server</span>.<span style="color: #658b00">DaemonStateCoordinator</span>$1.<span style="color: #658b00">run</span>(DaemonStateCoordinator.<span style="color: #658b00">java</span>:<span style="color: #B452CD">295</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ExecutorPolicy</span>$CatchAndRecordFailures.<span style="color: #658b00">onExecute</span>(ExecutorPolicy.<span style="color: #658b00">java</span>:<span style="color: #B452CD">63</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ManagedExecutorImpl</span>$1.<span style="color: #658b00">run</span>(ManagedExecutorImpl.<span style="color: #658b00">java</span>:<span style="color: #B452CD">46</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ThreadPoolExecutor</span>.<span style="color: #658b00">runWorker</span>(ThreadPoolExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">1142</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ThreadPoolExecutor</span>$Worker.<span style="color: #658b00">run</span>(ThreadPoolExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">617</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ThreadFactoryImpl</span>$ManagedThreadRunnable.<span style="color: #658b00">run</span>(ThreadFactoryImpl.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">Thread</span>.<span style="color: #658b00">run</span>(Thread.<span style="color: #658b00">java</span>:<span style="color: #B452CD">745</span>)
Caused by: org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">TaskExecutionException</span>: Execution failed <span style="color: #8B008B; font-weight: bold">for</span> task <span style="color: #a61717; background-color: #e3d2d2">&#39;</span>:app:transformDexWithInstantRunSlicesApkForDebug<span style="color: #a61717; background-color: #e3d2d2">&#39;</span>.
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>.<span style="color: #658b00">execute</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">95</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ResolveTaskOutputCachingStateExecuter</span>.<span style="color: #658b00">execute</span>(ResolveTaskOutputCachingStateExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">91</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ValidatingTaskExecuter</span>.<span style="color: #658b00">execute</span>(ValidatingTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">57</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">SkipEmptySourceFilesTaskExecuter</span>.<span style="color: #658b00">execute</span>(SkipEmptySourceFilesTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">119</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ResolvePreviousStateExecuter</span>.<span style="color: #658b00">execute</span>(ResolvePreviousStateExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">43</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">CleanupStaleOutputsExecuter</span>.<span style="color: #658b00">execute</span>(CleanupStaleOutputsExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">93</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">FinalizePropertiesTaskExecuter</span>.<span style="color: #658b00">execute</span>(FinalizePropertiesTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">45</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ResolveTaskArtifactStateTaskExecuter</span>.<span style="color: #658b00">execute</span>(ResolveTaskArtifactStateTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">94</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">SkipTaskWithNoActionsExecuter</span>.<span style="color: #658b00">execute</span>(SkipTaskWithNoActionsExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">56</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">SkipOnlyIfTaskExecuter</span>.<span style="color: #658b00">execute</span>(SkipOnlyIfTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">55</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">CatchExceptionTaskExecuter</span>.<span style="color: #658b00">execute</span>(CatchExceptionTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">EventFiringTaskExecuter</span>$1.<span style="color: #658b00">executeTask</span>(EventFiringTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">67</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">EventFiringTaskExecuter</span>$1.<span style="color: #658b00">call</span>(EventFiringTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">52</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">EventFiringTaskExecuter</span>$1.<span style="color: #658b00">call</span>(EventFiringTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$CallableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">315</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$CallableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">305</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">175</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">call</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">101</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DelegatingBuildOperationExecutor</span>.<span style="color: #658b00">call</span>(DelegatingBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">EventFiringTaskExecuter</span>.<span style="color: #658b00">execute</span>(EventFiringTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">LocalTaskNodeExecutor</span>.<span style="color: #658b00">execute</span>(LocalTaskNodeExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">43</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">taskgraph</span>.<span style="color: #658b00">DefaultTaskExecutionGraph</span>$InvokeNodeExecutorsAction.<span style="color: #658b00">execute</span>(DefaultTaskExecutionGraph.<span style="color: #658b00">java</span>:<span style="color: #B452CD">355</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">taskgraph</span>.<span style="color: #658b00">DefaultTaskExecutionGraph</span>$InvokeNodeExecutorsAction.<span style="color: #658b00">execute</span>(DefaultTaskExecutionGraph.<span style="color: #658b00">java</span>:<span style="color: #B452CD">343</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">taskgraph</span>.<span style="color: #658b00">DefaultTaskExecutionGraph</span>$BuildOperationAwareExecutionAction.<span style="color: #658b00">execute</span>(DefaultTaskExecutionGraph.<span style="color: #658b00">java</span>:<span style="color: #B452CD">336</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">taskgraph</span>.<span style="color: #658b00">DefaultTaskExecutionGraph</span>$BuildOperationAwareExecutionAction.<span style="color: #658b00">execute</span>(DefaultTaskExecutionGraph.<span style="color: #658b00">java</span>:<span style="color: #B452CD">322</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">DefaultPlanExecutor</span>$ExecutorWorker$1.<span style="color: #658b00">execute</span>(DefaultPlanExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">134</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">DefaultPlanExecutor</span>$ExecutorWorker$1.<span style="color: #658b00">execute</span>(DefaultPlanExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">129</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">DefaultPlanExecutor</span>$ExecutorWorker.<span style="color: #658b00">execute</span>(DefaultPlanExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">202</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">DefaultPlanExecutor</span>$ExecutorWorker.<span style="color: #658b00">executeNextNode</span>(DefaultPlanExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">193</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">plan</span>.<span style="color: #658b00">DefaultPlanExecutor</span>$ExecutorWorker.<span style="color: #658b00">run</span>(DefaultPlanExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">129</span>)
	... <span style="color: #B452CD">6</span> more
Caused by: java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">RuntimeException</span>: java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">RuntimeException</span>: java.<span style="color: #658b00">io</span>.<span style="color: #658b00">FileNotFoundException</span>: /Users/dorbae/Desktop/dev/android/dhtcomonitor/app/build/intermediates/instant_run_split_apk_resources/debug/instantRunSplitApkResourcesDebug/out/slice_5/resources_ap
	at sun.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">NativeConstructorAccessorImpl</span>.<span style="color: #658b00">newInstance0</span>(Native Method)
	at sun.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">NativeConstructorAccessorImpl</span>.<span style="color: #658b00">newInstance</span>(NativeConstructorAccessorImpl.<span style="color: #658b00">java</span>:<span style="color: #B452CD">62</span>)
	at sun.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">DelegatingConstructorAccessorImpl</span>.<span style="color: #658b00">newInstance</span>(DelegatingConstructorAccessorImpl.<span style="color: #658b00">java</span>:<span style="color: #B452CD">45</span>)
	at java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">Constructor</span>.<span style="color: #658b00">newInstance</span>(Constructor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">423</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>.<span style="color: #658b00">getThrowableException</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">593</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>.<span style="color: #658b00">reportException</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">677</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>.<span style="color: #658b00">join</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">720</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">ide</span>.<span style="color: #658b00">common</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">WaitableExecutor</span>.<span style="color: #658b00">waitForTasksWithQuickFail</span>(WaitableExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">149</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">build</span>.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">transforms</span>.<span style="color: #658b00">InstantRunSliceSplitApkBuilder</span>.<span style="color: #658b00">transform</span>(InstantRunSliceSplitApkBuilder.<span style="color: #658b00">java</span>:<span style="color: #B452CD">246</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">build</span>.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">pipeline</span>.<span style="color: #658b00">TransformTask</span>$2.<span style="color: #658b00">call</span>(TransformTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">239</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">build</span>.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">pipeline</span>.<span style="color: #658b00">TransformTask</span>$2.<span style="color: #658b00">call</span>(TransformTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">235</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">builder</span>.<span style="color: #658b00">profile</span>.<span style="color: #658b00">ThreadRecorder</span>.<span style="color: #658b00">record</span>(ThreadRecorder.<span style="color: #658b00">java</span>:<span style="color: #B452CD">102</span>)
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">build</span>.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">pipeline</span>.<span style="color: #658b00">TransformTask</span>.<span style="color: #658b00">transform</span>(TransformTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">230</span>)
	at sun.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">GeneratedMethodAccessor156</span>.<span style="color: #658b00">invoke</span>(Unknown Source)
	at sun.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">DelegatingMethodAccessorImpl</span>.<span style="color: #658b00">invoke</span>(DelegatingMethodAccessorImpl.<span style="color: #658b00">java</span>:<span style="color: #B452CD">43</span>)
	at java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">Method</span>.<span style="color: #658b00">invoke</span>(Method.<span style="color: #658b00">java</span>:<span style="color: #B452CD">498</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">reflect</span>.<span style="color: #658b00">JavaMethod</span>.<span style="color: #658b00">invoke</span>(JavaMethod.<span style="color: #658b00">java</span>:<span style="color: #B452CD">73</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">project</span>.<span style="color: #658b00">taskfactory</span>.<span style="color: #658b00">IncrementalTaskAction</span>.<span style="color: #658b00">doExecute</span>(IncrementalTaskAction.<span style="color: #658b00">java</span>:<span style="color: #B452CD">47</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">project</span>.<span style="color: #658b00">taskfactory</span>.<span style="color: #658b00">StandardTaskAction</span>.<span style="color: #658b00">execute</span>(StandardTaskAction.<span style="color: #658b00">java</span>:<span style="color: #B452CD">41</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">project</span>.<span style="color: #658b00">taskfactory</span>.<span style="color: #658b00">StandardTaskAction</span>.<span style="color: #658b00">execute</span>(StandardTaskAction.<span style="color: #658b00">java</span>:<span style="color: #B452CD">28</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>$2.<span style="color: #658b00">run</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">284</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$RunnableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">301</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>$RunnableBuildOperationWorker.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">293</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">execute</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">175</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DefaultBuildOperationExecutor</span>.<span style="color: #658b00">run</span>(DefaultBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">91</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">operations</span>.<span style="color: #658b00">DelegatingBuildOperationExecutor</span>.<span style="color: #658b00">run</span>(DelegatingBuildOperationExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">31</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>.<span style="color: #658b00">executeAction</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">273</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>.<span style="color: #658b00">executeActions</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">258</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>.<span style="color: #658b00">access</span>$200(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">67</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>$TaskExecution.<span style="color: #658b00">execute</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">145</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">ExecuteStep</span>.<span style="color: #658b00">execute</span>(ExecuteStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CancelExecutionStep</span>.<span style="color: #658b00">execute</span>(CancelExecutionStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">34</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">TimeoutStep</span>.<span style="color: #658b00">executeWithoutTimeout</span>(TimeoutStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">69</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">TimeoutStep</span>.<span style="color: #658b00">execute</span>(TimeoutStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">49</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CatchExceptionStep</span>.<span style="color: #658b00">execute</span>(CatchExceptionStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">33</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CreateOutputsStep</span>.<span style="color: #658b00">execute</span>(CreateOutputsStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">50</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SnapshotOutputStep</span>.<span style="color: #658b00">execute</span>(SnapshotOutputStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">43</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SnapshotOutputStep</span>.<span style="color: #658b00">execute</span>(SnapshotOutputStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">29</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CacheStep</span>.<span style="color: #658b00">executeWithoutCache</span>(CacheStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">134</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CacheStep</span>.<span style="color: #658b00">lambda</span>$execute$3(CacheStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">83</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">Optional</span>.<span style="color: #658b00">orElseGet</span>(Optional.<span style="color: #658b00">java</span>:<span style="color: #B452CD">267</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CacheStep</span>.<span style="color: #658b00">execute</span>(CacheStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">82</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">CacheStep</span>.<span style="color: #658b00">execute</span>(CacheStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">PrepareCachingStep</span>.<span style="color: #658b00">execute</span>(PrepareCachingStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">33</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">StoreSnapshotsStep</span>.<span style="color: #658b00">execute</span>(StoreSnapshotsStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">38</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">StoreSnapshotsStep</span>.<span style="color: #658b00">execute</span>(StoreSnapshotsStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">23</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SkipUpToDateStep</span>.<span style="color: #658b00">executeBecause</span>(SkipUpToDateStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">96</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SkipUpToDateStep</span>.<span style="color: #658b00">lambda</span>$execute$0(SkipUpToDateStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">89</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">Optional</span>.<span style="color: #658b00">map</span>(Optional.<span style="color: #658b00">java</span>:<span style="color: #B452CD">215</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SkipUpToDateStep</span>.<span style="color: #658b00">execute</span>(SkipUpToDateStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">52</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">steps</span>.<span style="color: #658b00">SkipUpToDateStep</span>.<span style="color: #658b00">execute</span>(SkipUpToDateStep.<span style="color: #658b00">java</span>:<span style="color: #B452CD">36</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">impl</span>.<span style="color: #658b00">DefaultWorkExecutor</span>.<span style="color: #658b00">execute</span>(DefaultWorkExecutor.<span style="color: #658b00">java</span>:<span style="color: #B452CD">34</span>)
	at org.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">api</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">tasks</span>.<span style="color: #658b00">execution</span>.<span style="color: #658b00">ExecuteActionsTaskExecuter</span>.<span style="color: #658b00">execute</span>(ExecuteActionsTaskExecuter.<span style="color: #658b00">java</span>:<span style="color: #B452CD">91</span>)
	... <span style="color: #B452CD">35</span> more
Caused by: java.<span style="color: #658b00">lang</span>.<span style="color: #658b00">RuntimeException</span>: java.<span style="color: #658b00">io</span>.<span style="color: #658b00">FileNotFoundException</span>: /Users/dorbae/Desktop/dev/android/dhtcomonitor/app/build/intermediates/instant_run_split_apk_resources/debug/instantRunSplitApkResourcesDebug/out/slice_5/resources_ap
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>$AdaptedCallable.<span style="color: #658b00">exec</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">1431</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>.<span style="color: #658b00">doExec</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">289</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinPool</span>$WorkQueue.<span style="color: #658b00">runTask</span>(ForkJoinPool.<span style="color: #658b00">java</span>:<span style="color: #B452CD">1056</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinPool</span>.<span style="color: #658b00">runWorker</span>(ForkJoinPool.<span style="color: #658b00">java</span>:<span style="color: #B452CD">1692</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinWorkerThread</span>.<span style="color: #658b00">run</span>(ForkJoinWorkerThread.<span style="color: #658b00">java</span>:<span style="color: #B452CD">157</span>)
Caused by: java.<span style="color: #658b00">io</span>.<span style="color: #658b00">FileNotFoundException</span>: /Users/dorbae/Desktop/dev/android/dhtcomonitor/app/build/intermediates/instant_run_split_apk_resources/debug/instantRunSplitApkResourcesDebug/out/slice_5/resources_ap
	at com.<span style="color: #658b00">android</span>.<span style="color: #658b00">build</span>.<span style="color: #658b00">gradle</span>.<span style="color: #658b00">internal</span>.<span style="color: #658b00">transforms</span>.<span style="color: #658b00">InstantRunSliceSplitApkBuilder</span>.<span style="color: #658b00">lambda</span>$null$1(InstantRunSliceSplitApkBuilder.<span style="color: #658b00">java</span>:<span style="color: #B452CD">233</span>)
	at java.<span style="color: #658b00">util</span>.<span style="color: #658b00">concurrent</span>.<span style="color: #658b00">ForkJoinTask</span>$AdaptedCallable.<span style="color: #658b00">exec</span>(ForkJoinTask.<span style="color: #658b00">java</span>:<span style="color: #B452CD">1424</span>)
	... <span style="color: #B452CD">4</span> more
</pre></td></tr></table></div>

<br />

# Solution

## Cause
* Gradle version was too low

<br />

## Update Gradle version
* Open gradle-wrapper.properties files in project directory

![screenshoot003](/assets/images/posts/2019/08/2019-08-13-android-androidstudio-resourcesaperrorafterupgradingandroidstudio-003.png)

<br />

* Replace distributionUrl with the URL which contains recent Gradle verion and execute synchronization
  * distributionUrl=https\://services.gradle.org/distributions/gradle-**[RECENT_GRADLE_VERSION]**-all.zip
> Ref. [Gradle Releases](https://gradle.org/releases/)

![screenshoot004](/assets/images/posts/2019/08/2019-08-13-android-androidstudio-resourcesaperrorafterupgradingandroidstudio-004.png)

<br />

-------------

## References
* [StackOverflow](https://stackoverflow.com/questions/55802212/error-related-to-resources-ap-after-upgrading-to-android-studio-3-4)
* [Gradle Releases](https://gradle.org/releases/)
