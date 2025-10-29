# pascalTriangle

- _pascalTriangle(n)_

Answer the first _n_ rows of Pascal’s triangle,
also known as meru-prastāra, مثلث خیام and Yang Hui’s Triangle

The first eleven rows,
OEIS [A007318](https://oeis.org/A007318):

```
>>> 11.pascalTriangle
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1;
	1 6 15 20 15 6 1;
	1 7 21 35 35 21 7 1;
	1 8 28 56 70 56 28 8 1;
	1 9 36 84 126 126 84 36 9 1;
	1 10 45 120 210 252 210 120 45 10 1
]
```

The number of odd entries in the first _n_ rows of Pascal’s triangle is given by Gould’s sequence,
OEIS [A001316](https://oeis.org/A001316):

```
>>> 11.pascalTriangle
>>> .collect { :each |
>>> 	each.count(isOdd:/1)
>>> }
[1 2 2 4 2 4 4 8 2 4 4]

>>> 11.gouldsSequence
[1 2 2 4 2 4 4 8 2 4 4]
```

The sums of the number of odd entries in the first _n_ rows of Pascal’s triangle,
OEIS [A006046](https://oeis.org/A006046):

```
>>> 1:11.collect { :n |
>>> 	n.pascalTriangle.collect { :each |
>>> 		each.count(isOdd:/1)
>>> 	}.sum
>>> }
[1 3 5 9 11 15 19 27 29 33 37]

>>> 11.gouldsSequence.prefixSum
[1 3 5 9 11 15 19 27 29 33 37]
```

Sierpiński’s triangle,
OEIS [A047999](https://oeis.org/A047999):

```
>>> 15.pascalTriangle % 2
[
	1;
	1 1;
	1 0 1;
	1 1 1 1;
	1 0 0 0 1;
	1 1 0 0 1 1;
	1 0 1 0 1 0 1;
	1 1 1 1 1 1 1 1;
	1 0 0 0 0 0 0 0 1;
	1 1 0 0 0 0 0 0 1 1;
	1 0 1 0 0 0 0 0 1 0 1;
	1 1 1 1 0 0 0 0 1 1 1 1;
	1 0 0 0 1 0 0 0 1 0 0 0 1;
	1 1 0 0 1 1 0 0 1 1 0 0 1 1;
	1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
]
```

A `log` scaled scatter plot of the row-order sequence:

~~~spl svg=A
21.pascalTriangle
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-A.svg)

A linear discrete plot:

~~~spl svg=B
11.pascalTriangle
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-B.svg)

Plot Sierpiński’s triangle:

~~~spl svg=C
(24.pascalTriangle % 2)
.padRight
.matrixPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-C.svg)

Discrete plot of row-order Sierpiński’s triangle:

~~~spl svg=D
(11.pascalTriangle % 2)
.++
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-D.svg)

Matrix plot of the first few rows of Pascal’s triangle modulo five:

~~~spl svg=E
(20.pascalTriangle % 5)
.padRight
.rescale
.matrixPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-E.svg)

* * *

See also: bernoulliTriangle, binomial, gouldsSequence, leibnizHarmonicTriangle, stolarskyHarborthConstant, table, triangularNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PascalsTriangle.html)
[2](https://mathworld.wolfram.com/SierpinskiSieve.html),
_OEIS_
[1](https://oeis.org/A007318)
[2](https://oeis.org/A001316)
[3](http://oeis.org/A006046)
[4](https://oeis.org/A047999),
_W_
[1](https://en.wikipedia.org/wiki/Pascal%27s_triangle)
[2](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle)
