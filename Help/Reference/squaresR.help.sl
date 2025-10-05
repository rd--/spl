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

First few terms with _d=2_:

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

First few terms with _d=4_:

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
>>> (0 .. 20 ^ 2).sum { :k |
>>> 	2.squaresR(k)
>>> }
1257
```

Plot first few terms:

~~~spl svg=A
1:100.collect { :n |
	2.squaresR(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-A.svg)

* * *

See also: divisors, isSumOfTwoSquares, square

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SumofSquaresFunction.html)
[2](https://reference.wolfram.com/language/ref/SquaresR.html),
_OEIS_
[1](https://oeis.org/A000118)
[2](https://oeis.org/A004018),
_W_
[1](https://en.wikipedia.org/wiki/Sum_of_squares_function)
