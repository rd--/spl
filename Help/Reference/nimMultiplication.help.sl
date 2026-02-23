# nimMultiplication

- _nimMultiplication(x, y)_

Answer the Nim product of _x_ and _y_,
written _x⊗y_.

Nim multiplication table,
from `zero`:

```
>>> nimMultiplication:/2.table(0:9, 0:9)
[
	0  0  0  0  0  0  0  0  0  0;
	0  1  2  3  4  5  6  7  8  9;
	0  2  3  1  8 10 11  9 12 14;
	0  3  1  2 12 15 13 14  4  7;
	0  4  8 12  6  2 14 10 11 15;
	0  5 10 15  2  7  8 13  3  6;
	0  6 11 13 14  8  5  3  7  1;
	0  7  9 14 10 13  3  4 15  8;
	0  8 12  4 11  3  7 15 13  5;
	0  9 14  7 15  6  1  8  5 12
]
```

Lower left triangle of Nim multiplication table,
from `one`,
OEIS [A051911](https://oeis.org/A051911):

```
>>> 1:13.triangularArray(
>>> 	nimMultiplication:/2
>>> )
[
	1;
	2 3;
	3 1 2;
	4 8 12 6;
	5 10 15 2 7;
	6 11 13 14 8 5;
	7 9 14 10 13 3 4;
	8 12 4 11 3 7 15 13;
	9 14 7 15 6 1 8 5 12;
	10 15 5 3 9 12 6 1 11 14;
	11 13 6 7 12 10 1 9 2 4 15;
	12 4 8 13 1 9 5 6 10 2 14 11;
	13 6 11 9 4 15 2 14 3 8 5 7 10
]
```

The Nim-square of _n_,
OEIS [A006042](https://oeis.org/A006042):

```
>>> 0:49.collect(nimSquare:/1)
[
	 0  1  3  2  6  7  5  4 13 12
	14 15 11 10  8  9 24 25 27 26
	30 31 29 28 21 20 22 23 19 18
	16 17 52 53 55 54 50 51 49 48
	57 56 58 59 63 62 60 61 44 45
]
```

Nim product _2^n×2^n_
OEIS [A006017](https://oeis.org/A006017):

```
>>> (2 ^ 0:29).nimSquare
[
	1 3 6 13 24 52 103 222 384 832 1648
	3552 6237 13563 26511 56906 98304
	212992 421888 909312 1596672
	3472128 6786816 14567936 25190110
	54589881 108036850 232800673
	408783316 888883132
]
```

Nim multiplication table,
read by antidiagonals,
from `zero`,
OEIS [A051775](https://oeis.org/A051775):

~~~spl svg=A
0:17.antidiagonalArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-A.svg)

Nim multiplication table,
read by antidiagonals,
from `one`,
OEIS [A051776](https://oeis.org/A051776):

~~~spl svg=B
1:16.antidiagonalArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-B.svg)

Nim multiplication table,
lower left triangle,
read by rows,
from `zero`
OEIS [A051910](https://oeis.org/A051910):

~~~spl svg=C
0:15.triangularArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-C.svg)

Nim multiplication table,
lower left triangle,
read by rows,
from `one`
OEIS [A051911](https://oeis.org/A051911):

~~~spl svg=D
1:15.triangularArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-D.svg)

The Nim-square of _n_,
_n⊗n_,
OEIS [A006042](https://oeis.org/A006042):

~~~spl svg=E
0:255.collect(nimSquare:/1).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-E.svg)

_n⊗2_,
OEIS [A006015](https://oeis.org/A006015):

~~~spl svg=F
0:255.nimMultiplication(2).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-F.svg)

_n⊗3_,
OEIS [A004468](https://oeis.org/A004468):

~~~spl svg=G
0:255.nimMultiplication(3).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-G.svg)

_n⊗4_,
OEIS [A004469](https://oeis.org/A004469):

~~~spl svg=H
0:255.nimMultiplication(4).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-H.svg)

_n⊗5_,
OEIS [A004470](https://oeis.org/A004470):

~~~spl svg=I
0:255.nimMultiplication(5).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-I.svg)

_n⊗6_,
OEIS [A004471](https://oeis.org/A004471):

~~~spl svg=J
0:255.nimMultiplication(6).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-J.svg)

_n⊗7_,
OEIS [A004472](https://oeis.org/A004472):

~~~spl svg=K
0:255.nimMultiplication(7).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-K.svg)

_n⊗8_,
OEIS [A004473](https://oeis.org/A004473):

~~~spl svg=L
0:255.nimMultiplication(8).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-L.svg)

_n⊗9_,
OEIS [A004474](https://oeis.org/A004474):

~~~spl svg=M
0:255.nimMultiplication(9).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-M.svg)

Composite plot of Nim-multiplication by one through fifteen,
OEIS [A004475](https://oeis.org/A004475) _n=10_,
OEIS [A004476](https://oeis.org/A004476) _n=11_,
OEIS [A004477](https://oeis.org/A004477) _n=12_,
OEIS [A004478](https://oeis.org/A004478) _n=13_,
OEIS [A004479](https://oeis.org/A004479) _n=14_,
OEIS [A004480](https://oeis.org/A004480) _n=15_:

~~~spl svg=N
16:143.functionPlot(
	1:15.collect { :n |
		{ :x |
			x.nimMultiplication(n)
		}
	}
)
~~~

![](sw/spl/Help/Image/nimMultiplication-N.svg)

_n⊗(n+1)_,
OEIS [A058734](https://oeis.org/A058734):

~~~spl svg=O
0:254.collect { :n |
	n.nimMultiplication(n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-O.svg)

Inverse of _n_ under Nim multiplication,
_n⊗m=1_,
OEIS [A051917](https://oeis.org/A051917):

~~~spl svg=P
1:255.collect { :n |
	1:255.detect { :m |
		n.nimMultiplication(m) = 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-P.svg)

Matrix plot of 16×16 Nim multiplication table:

~~~spl svg=Q
let n = 1:15;
nimMultiplication:/2.table(n, n)
.matrixPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-Q.svg)

Matrix plot of 64×64 Nim multiplication table:

~~~spl png=R
let n = 0:63;
nimMultiplication:/2.table(n, n)
.rescale.Greymap
~~~

![](sw/spl/Help/Image/nimMultiplication-R.png)

Nim multiplication table of _2^n_,
read by antidiagonals,
from `one`,
OEIS [A223541](https://oeis.org/A223541):

~~~spl svg=S
1:21.antidiagonalArray { :m :n |
	(2 ^ n).nimMultiplication(2 ^ m)
}.++.log.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-S.svg)

Lower left triangle of Nim multiplication table of _2^n_,
read by rows,
from `zero`,
OEIS [A223540](https://oeis.org/A223540):

~~~spl svg=T
0:15.triangularArray{ :m :n |
	(2 ^ n).nimMultiplication(2 ^ m)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-T.svg)

Nim-products of powers of two,
OEIS [A223543](https://oeis.org/A223543):

~~~spl svg=U
let k = 2 ^ 5 - 1;
let i = 2 ^ 0:k;
nimMultiplication:/2.table(i, i)
.catenate.unique.log.linePlot
~~~

![](sw/spl/Help/Image/nimMultiplication-U.svg)

* * *

See also: bitXor, times

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)

Further Reading: Conway 1976

Unicode: U+2297 ⊗ Circled Times
