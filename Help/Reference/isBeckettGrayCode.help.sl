# isBeckettGrayCode

- _isBeckettGrayCode([x₁ x₂ …])_

Answer `true` if the sequence of bit-vectors _x_ is a Beckett-Gray code, else `false`.

A Beckett-Gray code is a special kind of cyclic Gray code where
the first pattern is all zeroes,
and whenever a bit transitions _1→0_ it is the bit which has been _1_ longest.

The 1-bit Beckett-Gray code:

```
>>> [0; 1]
>>> .isBeckettGrayCode
true
```

Two 2-bit Beckett-Gray codes:

```
>>> [0 0; 0 1; 1 1; 1 0]
>>> .isBeckettGrayCode
true

>>> [0 0; 1 0; 1 1; 0 1]
>>> .isBeckettGrayCode
true
```

There are no 3-bit or 4-bit Beckett-Gray codes.

There is one 3-bit non-cyclic Beckett-Gray code:

```
>>> let c = [
>>> 	0 0 0;
>>> 	0 0 1;
>>> 	0 1 1;
>>> 	0 1 0;
>>> 	1 1 0;
>>> 	1 0 0;
>>> 	1 0 1;
>>> 	1 1 1
>>> ];
>>> (
>>> 	c.isBeckettGrayCode,
>>> 	c.isBinaryGrayCode
>>> )
(false, true)
```

There are four 4-bit non-cyclic Beckett-Gray codes,
specified below as zero-indexed transition codes:

```
>>> [
>>> 	0 1 0 2 1 3 2 0 2 3 1 3 0 2 0;
>>> 	0 1 0 2 1 3 2 1 2 0 3 1 3 2 1;
>>> 	0 1 2 3 0 1 2 0 2 3 0 1 2 3 0;
>>> 	0 1 2 3 0 1 2 1 3 2 1 0 3 2 1
>>> ].collect { :t |
>>> 	GrayCode(t).sequence
>>> }
[
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	0 1 0 0;
	0 1 1 0;
	0 0 1 0;
	0 0 1 1;
	0 0 0 1;
	1 0 0 1;
	1 0 1 1;
	1 0 1 0;
	1 1 1 0;
	1 1 1 1;
	0 1 1 1;
	0 1 0 1
	:;
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	0 1 0 0;
	0 1 1 0;
	0 0 1 0;
	0 0 1 1;
	0 0 0 1;
	0 1 0 1;
	0 1 1 1;
	1 1 1 1;
	1 1 1 0;
	1 0 1 0;
	1 0 1 1;
	1 0 0 1
	:;
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 1 0;
	1 1 1 1;
	0 1 1 1;
	0 0 1 1;
	0 0 0 1;
	1 0 0 1;
	1 0 1 1;
	1 0 1 0;
	0 0 1 0;
	0 1 1 0;
	0 1 0 0;
	0 1 0 1
	:;
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 1 0;
	1 1 1 1;
	0 1 1 1;
	0 0 1 1;
	0 0 0 1;
	0 1 0 1;
	0 1 0 0;
	0 1 1 0;
	0 0 1 0;
	1 0 1 0;
	1 0 1 1;
	1 0 0 1
]
```

Two 5-bit Beckett-Gray codes:

```
>>> [
>>> 	0 0 0 0 0; 0 0 0 0 1; 0 0 0 1 1;
>>> 	0 0 0 1 0; 0 0 1 1 0; 0 0 1 1 1;
>>> 	0 0 1 0 1; 0 1 1 0 1; 0 1 0 0 1;
>>> 	0 1 0 0 0; 0 1 0 1 0; 0 1 0 1 1;
>>> 	1 1 0 1 1; 1 0 0 1 1; 1 0 1 1 1;
>>> 	1 0 1 0 1; 1 0 1 0 0; 0 0 1 0 0;
>>> 	0 1 1 0 0; 1 1 1 0 0; 1 1 0 0 0;
>>> 	1 1 0 1 0; 1 0 0 1 0; 1 0 1 1 0;
>>> 	1 1 1 1 0; 0 1 1 1 0; 0 1 1 1 1;
>>> 	1 1 1 1 1; 1 1 1 0 1; 1 1 0 0 1;
>>> 	1 0 0 0 1; 1 0 0 0 0
>>> ].isBeckettGrayCode
true

>>> [
>>> 	0 0 0 0 0; 0 1 0 0 0; 0 1 0 0 1;
>>> 	0 0 0 0 1; 0 0 0 1 1; 0 1 0 1 1;
>>> 	0 1 0 1 0; 1 1 0 1 0; 1 1 0 0 0;
>>> 	1 0 0 0 0; 1 0 0 0 1; 1 1 0 0 1;
>>> 	1 1 1 0 1; 0 1 1 0 1; 0 1 1 1 1;
>>> 	0 1 1 1 0; 0 0 1 1 0; 0 0 0 1 0;
>>> 	1 0 0 1 0; 1 0 1 1 0; 1 0 1 0 0;
>>> 	1 0 1 0 1; 0 0 1 0 1; 0 0 1 1 1;
>>> 	1 0 1 1 1; 1 0 0 1 1; 1 1 0 1 1;
>>> 	1 1 1 1 1; 1 1 1 1 0; 1 1 1 0 0;
>>> 	0 1 1 0 0; 0 0 1 0 0
>>> ].isBeckettGrayCode
true
```

The eight non-isomorphic 5-bit Beckett-Gray codes,
specified as zero-indexed transition codes:

```
>>> [
>>> 	0 1 0 2 0 1 3 2 0 1 0 4 3 2 1 0
>>> 	4 3 4 2 1 3 2 3 4 0 4 1 2 3 0 4
>>> 	;
>>> 	0 1 0 2 0 3 1 2 4 0 3 0 2 4 0 4
>>> 	1 2 3 2 4 1 4 0 1 3 2 3 4 0 1 3
>>> 	;
>>> 	0 1 0 2 0 3 1 4 2 0 3 0 2 4 0 4
>>> 	1 2 3 4 2 1 4 1 0 3 2 3 4 1 0 3
>>> 	;
>>> 	0 1 0 2 0 3 1 4 2 0 3 2 4 0 4 2
>>> 	1 0 3 4 2 1 4 1 3 0 3 2 4 1 0 3
>>> 	;
>>> 	0 1 0 2 0 3 4 1 2 0 2 3 4 3 1 4
>>> 	2 3 2 0 1 4 3 2 0 1 0 4 3 1 0 4
>>> 	;
>>> 	0 1 0 2 3 4 1 2 0 3 2 4 0 3 0 4
>>> 	1 2 3 0 3 4 1 0 1 2 3 4 0 1 2 4
>>> 	;
>>> 	0 1 2 0 1 3 2 1 4 0 2 3 1 4 3 4
>>> 	0 2 3 2 1 3 4 0 2 1 4 3 1 0 4 1
>>> 	;
>>> 	0 1 2 0 3 0 4 1 2 3 0 3 1 4 0 4
>>> 	3 2 1 0 4 0 3 2 0 2 4 1 3 2 4 1
>>> ].collect { :t |
>>> 	GrayCode(t)
>>> 	.isBeckettGrayCode
>>> }.allTrue
true
```

The reversed 5-bit Beckett-Gray codes:

```
>>> [
>>> 	0 1 2 0 3 1 0 4 2 1 3 0 4 3 4 2
>>> 	1 3 1 0 3 4 2 1 0 4 3 0 2 4 0 2
>>> 	;
>>> 	0 1 2 3 0 1 2 1 4 3 0 2 1 4 3 4
>>> 	0 2 3 0 3 4 1 4 2 0 3 1 4 1 2 1
>>> 	;
>>> 	0 1 2 3 0 1 2 4 2 3 4 1 4 0 2 3
>>> 	1 4 1 0 3 4 3 2 0 1 4 3 4 2 0 4
>>> 	;
>>> 	0 1 2 3 0 4 0 1 2 3 1 3 4 0 4 1
>>> 	3 2 3 4 2 0 2 3 4 1 0 2 4 2 1 2
>>> 	;
>>> 	0 1 2 3 0 4 0 1 2 3 2 4 3 0 4 2
>>> 	3 1 3 4 1 0 1 4 3 2 0 1 4 1 2 1
>>> 	;
>>> 	0 1 2 3 0 4 1 2 3 2 0 4 3 4 1 2
>>> 	0 3 4 3 0 1 4 3 1 2 0 4 1 3 2 3
>>> 	;
>>> 	0 1 2 3 4 0 1 0 2 3 2 4 3 0 1 2
>>> 	4 3 1 3 4 0 1 4 3 2 0 1 4 1 2 1
>>> 	;
>>> 	0 1 2 3 4 0 1 0 2 3 2 4 3 0 2 0
>>> 	1 4 3 2 0 1 4 1 3 2 4 1 3 1 4 1
>>> ].collect { :t |
>>> 	GrayCode(t)
>>> 	.isBeckettGrayCode
>>> }.allTrue
true
```

The lexicographically first and last of the 94,841 non-isomorphic cyclic _n=6_ Beckett-Gray codes:

```
>>> [
>>> 	0 1 0 2 0 1 3 1 2 0 2 4 0 3 1 2
>>> 	1 5 2 4 3 0 1 4 5 0 5 2 3 4 1 3
>>> 	0 4 5 1 3 5 3 4 5 2 3 5 1 4 3 0
>>> 	2 5 1 4 5 2 3 4 0 5 1 2 5 4 1 5
>>> 	;
>>> 	0 1 2 3 4 5 0 1 2 3 4 3 5 4 3 2
>>> 	5 4 3 1 2 5 3 4 0 1 3 4 1 4 0 5
>>> 	0 3 2 1 4 5 4 1 0 5 2 4 0 1 4 3
>>> 	2 5 0 1 4 3 5 0 3 2 1 2 5 0 3 2
>>> ].collect { :t |
>>> 	GrayCode(t)
>>> 	.isBeckettGrayCode
>>> }.allTrue
true
```

Plot a 5-bit Beckett-Gray code,
specified as one-indexed transition code:

~~~spl svg=A
GrayCode(
	[
		1 2 3 4 1 5 1 2 3 4 2 4 5 1 5 2
		4 3 4 5 3 1 3 4 5 2 1 3 5 3 2 3
	]
).sequence.transpose.matrixPlot
~~~

![](sw/spl/Help/Image/isBeckettGrayCode-A.svg)

Plot a 7-bit Beckett-Gray code:

~~~spl png=B
GrayCode(
	[
		0 1 2 3 4 5 0 1 0 6 2 1 2 3 4 3
		5 4 0 6 1 6 5 2 1 2 3 4 6 4 0 5
		6 1 3 2 4 2 0 1 5 6 0 3 2 3 4 1
		5 0 5 1 3 0 6 4 5 1 2 1 0 6 2 6
		4 2 1 5 6 0 6 4 3 2 1 5 0 5 6 3
		6 4 1 5 0 5 6 4 6 0 5 2 5 6 3 6
		2 5 4 1 0 3 6 3 4 1 0 5 0 2 3 5
		0 4 1 2 3 4 2 1 0 4 3 2 0 5 4 5
	]
).sequence.transpose.Bitmap
~~~

![](sw/spl/Help/Image/isBeckettGrayCode-B.png)

Plot an 8-bit Beckett-Gray code:

~~~spl png=C
GrayCode(
	[
		0 1 2 3 4 5 6 0 7 0 1 2 1 3 2 4
		3 5 6 5 7 6 0 7 1 0 2 1 3 5 3 4
		6 2 6 7 0 1 5 3 7 4 1 2 3 6 2 5
		6 7 0 1 7 3 1 4 2 6 2 0 6 5 7 0
		1 3 4 2 1 4 6 5 6 0 5 7 3 1 0 2
		4 6 4 5 3 7 5 7 1 0 2 0 4 3 5 3
		7 6 1 4 0 7 3 6 3 0 4 6 4 2 7 3
		7 0 3 5 6 4 0 2 7 1 3 2 7 5 0 5
		4 1 2 1 0 2 7 5 6 4 1 5 0 2 4 0
		3 6 5 4 2 5 0 1 3 6 0 2 5 4 1 6
		1 5 6 0 4 3 1 2 5 7 6 0 3 2 5 7
		2 0 4 3 1 5 7 6 2 4 3 2 1 7 6 0
		4 5 2 0 4 1 7 5 1 6 3 5 4 7 6 7
		0 3 5 6 4 7 5 7 0 6 2 5 4 3 7 2
		4 2 1 3 2 6 2 4 1 6 1 5 2 3 4 1
		7 5 1 4 3 6 7 1 4 3 1 6 4 3 1 4
	]
).sequence.transpose.Bitmap
~~~

![](sw/spl/Help/Image/isBeckettGrayCode-C.png)

Plot a 6-bit Beckett-Gray code:

~~~spl svg=D
[
	0 1 0 2 0 1 3 1 2 0 2 4 0 3 1 2
	1 5 2 4 3 0 1 4 5 0 5 2 3 4 1 3
	0 4 5 1 3 5 3 4 5 2 3 5 1 4 3 0
	2 5 1 4 5 2 3 4 0 5 1 2 5 4 1 5
].GrayCode.sequence.transpose.matrixPlot
~~~

![](sw/spl/Help/Image/isBeckettGrayCode-D.svg)

* * *

See also: GrayCode, grayDecode, grayEncode, isBitVector, isCyclicGrayCode, isGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)

Further Reading: Cooke 2025, Sawada 2007
