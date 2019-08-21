---
layout: default
title: Categories
---

<!-- <div class="post">
  <h1 class="pageTitle">Categories</h1>
  <ul>
    <li><a href="./ActiveMQ">ActiveMQ</a></li>
  </ul>
</div> -->

<html>
 
<head>
 <link rel="stylesheet" href="tree_fontello/css/fontello.css">
  <style>
    .tree{
      color:#393939;
    }
    .tree, .tree ul{
      list-style: none;
      padding-left:17px;
    }
    .tree *:before{
      width:17px;
      height:17px;
      display:inline-block;
    }
    .tree label{
      cursor: pointer;
    }
    .tree label:before{
      content:'\f256';
      font-family: fontello;
    }
    .tree a{
      text-decoration: none;
      color:#393939;
    }
    .tree a:before{
      content:'\e800';
      font-family: fontello;
    }
    .tree input[type="checkbox"] {
      display: none;
    }
    .tree input[type="checkbox"]:checked~ul {
      display: none;
    }
    .tree input[type="checkbox"]:checked+label:before{
      content:'\f255';
      font-family: fontello;
    }
  </style>
</head>
 
<body>
  <ul class="tree">
    <li>
      <input type="checkbox" id="root">
      <label for="root">Category</label>
      <!-- <ul>
        <li>
          <input type="checkbox" id="node3">
          <label for="apache">Apache</label>
          <ul>
            <li><a href="./apache/activemq">ActiveMQ</a></li>
            <li><a href="https://opentutorials.org">node32</a></li>
            <li><a href="https://opentutorials.org">node33</a></li>
          </ul>
        </li>
      </ul> -->
{% assign categories_max = 0 %}
{% for category in site.categories %}
{% if category[1].size > categories_max %}
{% assign categories_max = category[1].size %}
{% endif %}
{% endfor %}

<ul class="taxonomy__index">
{% for i in (1..categories_max) reversed %}
{% for category in site.categories %}
{% if category[1].size == i %}
<li><strong>{{ category[0] }}</strong> <span class="taxonomy__count">{{ i }}</span></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>
</li>
  </ul>
 
</body>
 
</html>