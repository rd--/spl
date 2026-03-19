# square

- _square(n)_

Answer the square of _n_,
the number _n_ multiplied by itself.

```
>>> (3 * 3, 3 ^ 2, 3.square)
(9, 9, 9)

>>> 12.square + 33.square
1233

>>> 25840.square + 43776.square
2584043776

>>> 1675455088L.square
>>> +
>>> 3734621953L.square
16754550883734621953L
```

At `List`,
OEIS [A000290](https://oeis.org/A000290):

```
>>> [0 1 2 3 4 5 6 7 8 9].square
[0 1 4 9 16 25 36 49 64 81]
```

The inverse is `sqrt`:

```
>>> 3.square.sqrt
3
```

Threads over lists:

```
>>> 1:9.sum.square
2025

>>> [1 11 111 1111].square
[1 121 12321 1234321]
```

More generally, the difference of the squares of two numbers is the product of their sum and their difference:

```
>>> let a = 47;
>>> let b = 53;
>>> a.square - b.square
(a + b) * (a - b)
```

The sum of the n first square numbers,
the square pyramidal numbers,
OEIS [A000330](https://oeis.org/A000330):

```
>>> 0:15.collect { :n |
>>> 	n * (n + 1) * ((2 * n) + 1)
>>> } / 6
[
	   0    1    5   14   30
	  55   91  140  204  285
	 385  506  650  819 1015
	1240
]
```

_n^2-1_,
or equally _n(n+2)_,
OEIS [A005563](https://oeis.org/A005563):

```
>>> 1:13.square - 1
[0 3 8 15 24 35 48 63 80 99 120 143 168]

>>> 0:12.collect { :n | n * (n + 2) }
[0 3 8 15 24 35 48 63 80 99 120 143 168]

>>> linearRecurrence([3 -3 1], [0 3 8], 13)
[0 3 8 15 24 35 48 63 80 99 120 143 168]
```

_2(n^2)-1_,
OEIS [A056220](https://oeis.org/A056220):

```
>>> 2 * 0:9.square - 1
[-1 1 7 17 31 49 71 97 127 161]
```

Binary expansion of square numbers,
matrix plot,
OEIS [A000290](https://oeis.org/A000290):

~~~spl svg=A oeis=A000290 variant
1:42.square
.binaryExpansion
.padLeft
.transpose
.matrixPlot
~~~

![](Help/Image/square-A.svg)

Square roots of unity modulo _m_,
OEIS [A060594](https://oeis.org/A060594):

~~~spl svg=B oeis=A060594
1:103.collect { :n |
	1:n.sum { :i |
		((i.square - 1) % n = 0).boole
	}
}.discretePlot
~~~

![](Help/Image/square-B.svg)

_a(n)_ is the smallest integer _m_ not equal to _n_ such that _n=(⌊(n²/m)+m)/2_,
OEIS [A134986](https://oeis.org/A134986):

~~~spl svg=C oeis=A134986
1:65.collect { :n |
	1:Infinity.detect { :m |
		m != n & {
			let o = n.square / m;
			n = ((o.floor + m) / 2)
		}
	}
}.scatterPlot
~~~

![](Help/Image/square-C.svg)

Square numbers,
OEIS [A000290](https://oeis.org/A000290):

~~~spl svg=D oeis=A000290
0:65.square.discretePlot
~~~

![](Help/Image/square-D.svg)

_x²_ plotted on a Cartesian plane:

~~~spl svg=E
(-2 -- 2).functionPlot(square:/1)
~~~

![](Help/Image/square-E.svg)

The quarter-squares sequence,
OEIS [A002620](https://oeis.org/A002620):

~~~spl svg=F oeis=A002620
(0:65.square / 4).floor.discretePlot
~~~

![](Help/Image/square-F.svg)

Coordination sequence for cubic lattice,
_4n²+2_,
OEIS [A005899](https://oeis.org/A005899):

~~~spl svg=G oeis=A005899
((4 * 1:65.square) + 2).discretePlot
~~~

![](Help/Image/square-G.svg)

Where supported `square` is displayed as ².

* * *

See also: ^, *, cube, squarePyramidalNumber, sqrt

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareNumber.html),
_OEIS_
[1](https://oeis.org/A000290),
_Smalltalk_
5.6.2.35,
_W_
[1](https://en.wikipedia.org/wiki/Square_number)

Unicode: U+00B2 ² Superscript Two
