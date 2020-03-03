---
layout: post
title: "[AWS] How to install awscli(AWS Command Line Interface) version 1 on MacOS"
comments: true
author: dorbae
date: 2020-03-03 +0900
categories : [Cloud,AWS]
tags: [cloud,aws,awscli]
sitemap :
  changefreq : weekly
---

# Goal
* Install awscli version 1 on MacOS

<br />

---------------

# Introduce
## What is AWS CLI
* The AWS Command Line Interface (AWS CLI) is an open source tool that enables you to interact with AWS services using commands in your command-line shell.

## The difference between version 1 and version 2
### Version 2.x
* The current, generally available release of the AWS CLI that is intended for use in production environments.
* It does include some "breaking" changes from version 1 that might require you to change your scripts so that they continue to operate as you expect.

### Version 1.x
* The previous version of the AWS CLI that is available for backwards compatiblity.
* On January 10th, 2020, AWS CLI version 1, which requires a separate installation of Python to operate, stopped supporting Python versions 2.6 and 3.3. All builds of AWS CLI version 1 released after January 10th, 2020, starting with version 1.17, require Python 2.7, Python 3.4, or a later version to successfully use the AWS CLI.

> AWS CLI version 2 and Windows MSI installer version of AWS CLI version 1 are not affected by this change.

<br />

------------

# Practice

## 1. Download awscli installer file

```bash
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip"
```

![screenshot001](/assets/images/posts/2020/03/2020-03-03-cloud-aws-howtoinstallawsclionmac-001.png)

<br />

## 2. Unzip installer file

```bash
$ unzip awscii-bundle.zip
```

![screenshot002](/assets/images/posts/2020/03/2020-03-03-cloud-aws-howtoinstallawsclionmac-002.png)

<br />

## 3. Execute installer

```bash
$ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

![screenshot003](/assets/images/posts/2020/03/2020-03-03-cloud-aws-howtoinstallawsclionmac-003.png)

<br />

## 4. Check the version of awscli

```bash
$ awscli --version
```

![screenshot004](/assets/images/posts/2020/03/2020-03-03-cloud-aws-howtoinstallawsclionmac-004.png)

<br />

--------------

## References
* [What is the AWS Command Line Interface - AWS Document](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
* [Install the AWS CLI version 1 - AWS Docoument](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html)