---
title: Jekyll 테마에서 LaTex 사용하기
date: '2020-01-11 22:37:28 -0400'
categories: Jekyll
use_math: true
comments: true
---

#### *Github 블로그에 LaTex로 수식 표현하기*

### 1. _config.yml에서 마크다운 확인하기

* _config.yml 파일에서 마크다운이 다음과 같이 설정되어 있는지 확인한다.

<script src="https://gist.github.com/SukwonYun/016168bec2d18fb11786bcaaded98cd6.js"></script> 

* Github 업데이트로 인해 따로 kramdown 이 알아서 $$, 블록처리를 인식해 줄 것이다.
<br/>
<br/>


### 2. _includes 폴더에 Mathjax.html 파일을 만들고 아래 내용을 넣어준다.

<script src="https://gist.github.com/SukwonYun/de38c431b7a2682b8fb4f847e471eb23.js"></script>
<br/>
<br/>


### 3. _layouts 폴더 안 default.html 파일 맨 밑에 Mathjax 를 include 해준다.

* 이 때, 중요한 점은 default.html 파일 내 body문 안에서 위치를 지정하는 것이 아닌 아래 위치에 include 해줘야 한다.

<script src="https://gist.github.com/SukwonYun/f1adcc4a0949cec4bf00ac4f87e3f9dd.js"></script>
<br/>
<br/>


### 4. _posts 폴더 내 포스트 생성 후 아래와 같이 초기 설정을 해준다.

<script src="https://gist.github.com/SukwonYun/eebcf6a00809d271f7cc168eef40d0f9.js"></script>

* 'use_math: true' 를 포함해준다.   
<br/>
<br/>


#### _테스트_

#### <코드>

<script src="https://gist.github.com/SukwonYun/ef28572b83ef8f3795ef63e1a9fb3bc3.js"></script>


#### <실행>

$$
\lim_{x\to 0}{\frac{e^x-1}{2x}}
\overset{\left[\frac{0}{0}\right]}{\underset{\mathrm{H}}{=}}
\lim_{x\to 0}{\frac{e^x}{2}}={\frac{1}{2}}
$$

### References

1. http://www.ktug.org/xe/index.php?mid=KTUG_open_board&document_srl=248288&rnd=249216#comment_249216
