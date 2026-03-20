# sqrt

- _sqrt(n)_

Answer the number that, multiplied with itself, is _n_.

Pythagoras’ constant:

```
>>> 2.sqrt
1.41421

>>> 2 ^ 1/2
1.41421
```

Theodorus’ constant

```
>>> 3.sqrt
1.73205

>>> 265/153
3.sqrt

>>> 1351/780
3.sqrt

>>> 3.sqrt / 2
0.866025
```

Particular values:

```
>>> 5.sqrt
2.23607

>>> 161/72
5.sqrt

>>> 6.sqrt
2.44949

>>> 7.sqrt
2.64575

>>> 200.sqrt
10 * 2.sqrt

>>> 0.5.sqrt
2.sqrt / 2
```

Negative numbers have imaginary square roots:

```
>>> -9.sqrt
0J3

>>> -25J0.sqrt
0J5
```

At `Complex`:

```
>>> 5J1.sqrt
2.24711J0.22250
```

At `LargeInteger`:

```
>>> 81L.sqrt
9L

>>> 13L.sqrt
3L
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0J1 1.pi Infinity].sqrt
[0, 1.22474, -1J0 ^ 0.25, 1.pi.sqrt, Infinity]

>>> [1 4 9 16].sqrt
[1 2 3 4]

>>> 1:4.sqrt
[1 1.4142 1.7321 2]
```

Values at `zero` and infinity:

```
>>> 0.sqrt
0

>>> Infinity.sqrt
Infinity
```

The representation of the square root of any non-square positive integer as a continued fraction is periodic:

```
>>> [2 .. 20].collect { :n |
>>> 	n.sqrt.continuedFraction(9)
>>> }
[
	1 2 2 2 2 2 2 2 2;
	1 1 2 1 2 1 2 1 2;
	2;
	2 4 4 4 4 4 4 4 4;
	2 2 4 2 4 2 4 2 4;
	2 1 1 1 4 1 1 1 4;
	2 1 4 1 4 1 4 1 4;
	3;
	3 6 6 6 6 6 6 6 6;
	3 3 6 3 6 3 6 3 6;
	3 2 6 2 6 2 6 2 6;
	3 1 1 1 1 6 1 1 1;
	3 1 2 1 6 1 2 1 6;
	3 1 6 1 6 1 6 1 6;
	4;
	4 8 8 8 8 8 8 8 8;
	4 4 8 4 8 4 8 4 8;
	4 2 1 3 1 2 8 2 1;
	4 2 8 2 8 2 8 2 8
]
```

Select first few squares:

```
>>> 0:100.select { :n |
>>> 	n.sqrt.isInteger
>>> }
[0 1 4 9 16 25 36 49 64 81 100]
```

Identities:

```
>>> let x = 25;
>>> x / x.sqrt
x.sqrt

>>> let x = 25;
>>> x.sqrt / x
1 / x.sqrt
```

Numbers that are not squares,
OEIS [A000037](https://oeis.org/A000037):

```
>>> 1:90.collect { :n |
>>> 	n + n.sqrt.round
>>> }
[
	 2  3  5  6  7  8 10 11 12 13
	14 15 17 18 19 20 21 22 23 24
	26 27 28 29 30 31 32 33 34 35
	37 38 39 40 41 42 43 44 45 46
	47 48 50 51 52 53 54 55 56 57
	58 59 60 61 62 63 65 66 67 68
	69 70 71 72 73 74 75 76 77 78
	79 80 82 83 84 85 86 87 88 89
	90 91 92 93 94 95 96 97 98 99
]
```

Numbers that are not the sum of distinct Lucas numbers,
OEIS [A054770](https://oeis.org/A054770):

```
>>> 1:27.collect { :n |
>>> 	floor(n * ((5.sqrt + 5) / 2)) - 1
>>> }
[
	 2  6  9 13 17 20 24 27 31 35
	38 42 46 49 53 56 60 64 67 71
	74 78 82 85 89 93 96
]
```

One if _n_ is of the form _m(m+3)/2_ else zero,
OEIS [A023531](https://oeis.org/A023531):

```
>>> 0:27.collect { :n |
>>> 	(((9 + (8 * n)).sqrt - 3) / 2)
>>> 	.isInteger
>>> 	.boole
>>> }
[
	1
	0 1
	0 0 1
	0 0 0 1
	0 0 0 0 1
	0 0 0 0 0 1
	0 0 0 0 0 0 1
]
```

![](Help/Image/sqrt-D.svg)

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot(sqrt:/1)
~~~

![](Help/Image/sqrt-A.svg)

The signature sequence of √2,
OEIS [A007336](https://oeis.org/A007336):

~~~spl svg=B oeis=A007336
2.sqrt.signatureSequence(200)
.scatterPlot
~~~

![](Help/Image/sqrt-B.svg)

A permutation of the positive integers,
OEIS [A101369](https://oeis.org/A101369):

~~~spl svg=C oeis=A101369 permutation
let m = 2.sqrt;
1:65.collect { :n |
	n.isEven.if {
		n + (n / m - (1 / m)).floor
	} {
		1 + (n / m).floor
	}
}.discretePlot
~~~

![](Help/Image/sqrt-C.svg)

A self-generating sequence,
there are _a(n)_ threes between successive twos,
OEIS [A007538](https://oeis.org/A007538):

~~~spl svg=D oeis=A007538
let m = 1 + 3.sqrt;
let a = 1:65.collect { :n |
	(n * m).floor - ((n - 1) * m).floor
};
(a - 2).discretePlot
~~~

![](Help/Image/sqrt-D.svg)

Differences of _⌊(n*√2+½)_,
OEIS [A006338](https://oeis.org/A006338),
minus one:

~~~spl svg=E oeis=A006338 offset
let a = 1:85.collect { :n |
	(n * 2.sqrt + 0.5).floor
}.differences;
(a - 1).discretePlot
~~~

![](Help/Image/sqrt-E.svg)

First differences of the _√2_ Beatty sequence,
OEIS [A006337](https://oeis.org/A006337):

~~~spl svg=F oeis=A006337
65.beattySequence(2.sqrt)
.differences
.stepPlot
~~~

![](Help/Image/sqrt-F.svg)

`sqrt` is an alias for `squareRoot`.

Where supported `sqrt` is displayed as √.

* * *

See also: cubeRoot, integerSquareRoot, nthRoot, square

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareRoot.html)
[2](https://reference.wolfram.com/language/ref/Sqrt.html),
_OEIS_
[1](https://oeis.org/A007336)
[2](https://oeis.org/A000037),
_Smalltalk_
5.6.2.34,
_W_
[1](https://en.wikipedia.org/wiki/Square_root)
[2](https://en.wikipedia.org/wiki/Square_root_of_2)

Unicode: U+221A √ Square Root

Categories: Math, Operator
