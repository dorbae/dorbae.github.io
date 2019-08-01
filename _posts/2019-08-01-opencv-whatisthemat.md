---
layout: post
title: "[OpenCV] What is the Mat?"
comments: true
author: dorbae
date: 2019-08-01 +0900
categories : [OpenCV]
tags: [opencv,cv,mat]
sitemap :
  changefreq : weekly
---

# Goal
* What is the mat
* How it works
* How to convert a matrix to a bytes array
* The method for storing image data

<br/>

# Intro
* I had a problem to diplay the image which was serialized.
* So, I need to understand how OpenCV handles the matrix exactly

<br />

# Practice

### Change of way to handle the image
* OpenCV 1.0
  * C language base
  * You have to manage the momory manually
  * It use **IplImage** for handling the image
  > IplImage : C structure for storing the image in the memory

* OpenCV 2.0
  * It introduce a new C++ interface
  * Nevertheless, it is fully compatible with C
  * No need to fiddle with the memory management
  * However, a lot of embedded developments support only C
  * As using the Mat, you don't need to allocated and release the memory manually. This is because the Mat manages the memory automatically

  <br />

### Mat Structure

![screenshot001](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-001.png)

<br />

### Sharing a matrix
* To solve the performance issue by unnecessary copies of potentially large images
* OpenCV uses a reference counting system
* It copy only header generally and support deep copy as well

![screenshot002](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-002.png)

<br />

#### General Copy

```
Mat A = imread(...);
```

![screenshot003](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-003.png)

<br />

```
Mat B = Mat(A);
```

![screenshot004](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-004.png)

<br />

#### Deep Copy
* Copy not only heaer but also matrix

```
Mat F = A.clone();
```

![screenshot005](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-005.png)

<br />

```
Mat G;
A.copyTo(G);
```

![screenshot006](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-006.png)

<br />

### When a matrix object is free in the memory?
* I mentioned, OpenCV uses counting references
* So, If the count of pointers which indicate the matrix, it'll be free automaticlly

#### Example

```
Mat a = imread(...);
```

![screenshot007](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-007.png)

<br />

```
Mat B = Mat(A);
Mat C = Mat(A);
```

![screenshot008](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-008.png)

<br />

```
free(A);
```

![screenshot009](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-009.png)

<br />

```
free(B);
free(C);
```

![screenshot010](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-010.png)

![screenshot011](/assets/images/posts/2019/08/2019-08-01-opencv-whatisthemat-011.png)

<br />

### Storing methods
#### Gray scale
* White/Black
* Create many shades of gray

#### RGB
* The most common method
* Similar to our eyes

#### HSV/HLS
* Decompose colors into hue/Saturation and value/luminance components
* More natural way to decribe colors

#### YCrCb
* Used by JPEG image format

> The smallest data type of each component is char = 1 byte = 8 bits

> value range of signed char is -127 and 127

> value range of unsigned char is 0 ~ 255

> Can use other types like float(4 bytes or 32 bits) and double(8 bytes or 64 bits) and they can provide ever finer control

> However, the size of image will be increased as using them

<br />

### Creating Mat
* Mat is a image container and also a general matrix class, that is, 2-dimentional marices
* Mat(row, column, store_method)
  * Store method
    * CV_**[The number of bits per item]** **[Signed or Unsigned]** **___{[Type Prefix]}___**C**[The channel number]**

    > eg. CV_8UC3 : Unsigned 8bits(unsigned char) and 3 channles
    
    > eg. CV_32UC1 : Unsigned 32bits(usigned float) and 1 channel

<br />

### How to store N-dimensions
* Convert N-dimensions matrices to 1-D aaray

#### 1-D Matrix to 1-D Array
* eg. 3x3

$ \begin{bmatrix}
(0,0) & (0,1) & (0,2) \\ 
(1,0) & (1,1) & (1,2) \\
(2,0) & (2,1) & (2,2) \\
\end{bmatrix}$

<br />

-------------

## References
* [OpenCV Doc](https://docs.opencv.org/3.4.7/d6/d6d/tutorial_mat_the_basic_image_container.html)
* [W. Kang's Dev Blog](http://blog.comart.io/posts/opencv-rgba-image-blending)
