# isBeckettGrayCode

- _isBeckettGrayCode([x₁ x₂ …])_

Answer `true` if the sequence of bit-vectors _x_ is a Beckett-Gray code, else `false`.

A Beckett-Gray code is a special kind of cyclic Gray code where
the first pattern is all zeros,
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

The fifteen 5-bit Beckett-Gray codes,
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
>>> 	;
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

* * *

See also: GrayCode, grayDecode, grayEncode, isBitVector, isCyclicGrayCode, isGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)

Further Reading: Cooke 2025, Sawada 2007
