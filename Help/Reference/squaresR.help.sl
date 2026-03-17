# squaresR

- _squaresR(d, n)_

Answer the number of ways to represent the integer _n_ as a sum of _d_ squares.

Number of ways to represent _n_ as a sum of two squares:

```
>>> 2.squaresR(45)
8

>>> 2.squaresR(100)
12
```

Number of ways of writing _n_ as a sum of two squares,
OEIS [A004018](https://oeis.org/A004018):

```
>>> 0:28.collect { :n |
>>> 	2.squaresR(n)
>>> }
[
	1  4  4  0  4  8  0  0  4  4
	8  0  0  8  0  0  4  8  4  0
	8  0  0  0  0 12  8  0  0
]
```

First few terms with _d=4_,
OEIS [A000118](https://oeis.org/A000118):

```
>>> 0:28.collect { :n |
>>> 	4.squaresR(n)
>>> }
[
	  1   8  24  32  24
	 48  96  64  24 104
	144  96  96 112 192
	192  24 144 312 160
	144 256 288 192  96
	248 336 320 192
]
```

Number of lattice points inside the circle of radius twenty with center at the origin:

```
>>> [0 .. 20 ^ 2].sum { :k |
>>> 	2.squaresR(k)
>>> }
1257
```

Numbers that are the sum of two squares,
OEIS [A001481](https://oeis.org/A001481):

```
>>> 0:99.select { :n |
>>> 	2.squaresR(n) != 0
>>> }
[
	 0  1  2  4  5  8  9 10 13 16
	17 18 20 25 26 29 32 34 36 37
	40 41 45 49 50 52 53 58 61 64
	65 68 72 73 74 80 81 82 85 89
	90 97 98
]
```

Number of ways of writing _n_ as a square,
OEIS [A000122](https://oeis.org/A000122):

```
>>> 0:104.collect { :n |
>>> 	1.squaresR(n)
>>> }
[
	1 2 0 0 2 0 0 0 0 2 0 0 0 0 0 0 2 0 0 0
	0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 2 0 0 0
	0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0
	0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	2 0 0 0 0
]
```

Running total of the excess of the _4k+1_ divisors of the natural numbers over their _4k+3_ divisors,
OEIS [A014200](https://oeis.org/A014200):

```
>>> let a = 1:25.collect { :n |
>>> 	2.squaresR(n)
>>> };
>>> (a / 4).prefixSum
[
	 1  2  2  3  5  5  5  6  7  9
	 9  9 11 11 11 12 14 15 15 17
	17 17 17 17 20
]

>>> (1:25 / 4).pi.round
[
	 1  2  2  3  4  5  5  6  7  8
	 9  9 10 11 12 13 13 14 15 16
	16 17 18 19 20
]
```

Number of ways of writing _n_ as a sum of two squares,
OEIS [A004018](https://oeis.org/A004018):

~~~spl svg=A oeis=A004018
1:100.collect { :n |
	2.squaresR(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-A.svg)

The characteristic function of the triangular numbers,
one if _n_ is a triangular number otherwise zero,
OEIS [A010054](https://oeis.org/A010054):

~~~spl svg=B oeis=A010054
0:200.collect { :n |
	1.squaresR(8 * n + 1) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-B.svg)

Number of ways of writing _n_ as a sum of four squares,
OEIS [A000118](https://oeis.org/A000118):

~~~spl svg=C oeis=A000118
0:250.collect { :n |
	4.squaresR(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/squaresR-C.svg)

* * *

See also: divisors, isSumOfTwoSquares, square

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SumofSquaresFunction.html)
[2](https://reference.wolfram.com/language/ref/SquaresR.html),
_OEIS_
[1](https://oeis.org/A000118)
[2](https://oeis.org/A004018)
[3](https://oeis.org/A001481)
[4](https://oeis.org/A010054),
_W_
[1](https://en.wikipedia.org/wiki/Sum_of_squares_function)
