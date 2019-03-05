---
layout: post
title: "[Markdown] Markdown to HTML/MS Word by Pandoc"
comments: true
author: dorbae
date: 2019-03-05 +0900
categories : [Markdown]
tags: [mac,macos,osx,markdown,md,html,docx,word,맥,마크다운.pandoc]
sitemap :
  changefreq : weekly
---

# Goal
* To covert Markdown file to HTML or MS Word file by using Pandoc

<br />

# Introduce
* Pandoc is a universal document convert
* Pandoc can convert documents in (several dialects of) Markdown, reStructuredText, textile, HTML, DocBook, LaTeX, MediaWiki markup, TWiki markup, TikiWiki markup, DokuWiki markup, Creole 1.0, Vimwiki markup, roff man, OPML, Emacs Org-Mode, Emacs Muse, txt2tags, Microsoft Word docx, LibreOffice ODT, EPUB, Jupyter notebooks ipynb, or Haddock markup to HTML, Word processor formats, Ebooks, PDF, etc

<br />

# Practice
## 1. Install Pandoc
* Install Pandoc using Hemebrew

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ sudo brew install pandoc</span>
</pre></div>

![screenshot001](/assets/images/posts/2019/03/2019-03-05-markdown-pandoc-convertmarkdowntohtml-001.png)

<br />

## 2. Convert Markdown to HTML/Word
* Convert Markdown file to HTML and MS Word files using pandoc
* Pandoc options
    * -f [FORMAT] : From. The format of source file
    * -t [FORMAT] : To. The format of output file being converted
    * -s : Standalone
    * -o [FILE]: Name of output file
    * --log=[FILE] : Write log messages in machine-readable JSON format to FILE 

<div markdown="1" style="background: #202020; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #d0d0d0">$ pandoc -f [FORMAT] -t [FORMAT] -s -o [OUTPUT_FILE]</span>
</pre></div>

![screenshot002](/assets/images/posts/2019/03/2019-03-05-markdown-pandoc-convertmarkdowntohtml-002.png)


* Results

![screenshot003](/assets/images/posts/2019/03/2019-03-05-markdown-pandoc-convertmarkdowntohtml-003.png)

![screenshot004](/assets/images/posts/2019/03/2019-03-05-markdown-pandoc-convertmarkdowntohtml-004.png)

<br />

-----

## References
* [Pandoc Homepage](https://pandoc.org/)
* [pandoc - markdown 을 다양한 포맷으로 변환해 주는 변환기](https://www.lesstif.com/pages/viewpage.action?pageId=26083394)