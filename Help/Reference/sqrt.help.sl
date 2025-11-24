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

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot(sqrt:/1)
~~~

![](sw/spl/Help/Image/sqrt-A.svg)

Plot the signature sequence of √2,
OEIS [A007336](https://oeis.org/A007336):

~~~spl svg=B
2.sqrt.signatureSequence(17, 13, 96)
.scatterPlot
~~~

![](sw/spl/Help/Image/sqrt-B.svg)

Where supported `sqrt` is displayed as √.

* * *

See also: cubeRoot, nthRoot, square

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
