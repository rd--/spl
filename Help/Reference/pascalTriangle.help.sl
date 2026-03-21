# pascalTriangle

- _pascalTriangle(n, m=1)_

Answer the first _n_ rows of Pascal’s triangle,
also known as meru-prastāra, مثلث خیام and Yang Hui’s triangle.

The first eleven rows of Pascal’s triangle,
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

Sierpiński’s triangle,
each row interpreted as an integer in binary notation,
OEIS [A001317](https://oeis.org/A001317):

```
>>> (17.pascalTriangle % 2).collect { :n |
>>> 	n.fromDigits(2)
>>> }
[
	1 3 5 15 17 51 85 255 257 771 1285
	3855 4369 13107 21845 65535 65537
]
```

Pascal _1,2_ triangle,
also called the Lucas triangle or Vieta’s array,
OEIS [A029635](https://oeis.org/A029635):

```
>>> 9.pascalTriangle(2)
[
	2;
	1 2;
	1 3 2;
	1 4 5 2;
	1 5 9 7 2;
	1 6 14 16 9 2;
	1 7 20 30 25 11 2;
	1 8 27 50 55 36 13 2;
	1 9 35 77 105 91 49 15 2;
	1 10 44 112 182 196 140 64 17 2
]
```

Pascal _1,3_ triangle,
OEIS [A095660](https://oeis.org/A095660):

```
>>> 9.pascalTriangle(3)
[
	3;
	1 3;
	1 4 3;
	1 5 7 3;
	1 6 12 10 3;
	1 7 18 22 13 3;
	1 8 25 40 35 16 3;
	1 9 33 65 75 51 19 3;
	1 10 42 98 140 126 70 22 3;
	1 11 52 140 238 266 196 92 25 3
]
```

Pascal _1,4_ triangle,
OEIS [A095666](https://oeis.org/A095666):

```
>>> 9.pascalTriangle(4)
[
	4;
	1 4;
	1 5 4;
	1 6 9 4;
	1 7 15 13 4;
	1 8 22 28 17 4;
	1 9 30 50 45 21 4;
	1 10 39 80 95 66 25 4;
	1 11 49 119 175 161 91 29 4;
	1 12 60 168 294 336 252 120 33 4
]
```

Pascal _1,5_ triangle,
OEIS [A096940](https://oeis.org/A096940):

```
>>> 9.pascalTriangle(5)
[
	5;
	1 5;
	1 6 5;
	1 7 11 5;
	1 8 18 16 5;
	1 9 26 34 21 5;
	1 10 35 60 55 26 5;
	1 11 45 95 115 81 31 5;
	1 12 56 140 210 196 112 36 5;
	1 13 68 196 350 406 308 148 41 5
]
```

Pascal’s triangle,
row-order sequence,
log scaled scatter plot,
OEIS [A007318](https://oeis.org/A007318):

~~~spl svg=A oeis=A007318
21.pascalTriangle
.catenate
.log
.scatterPlot
~~~

![](Help/Image/pascalTriangle-A.svg)

Pascal’s triangle,
linear discrete plot,
OEIS [A007318](https://oeis.org/A007318):

~~~spl svg=B oeis=A007318
11.pascalTriangle
.catenate
.discretePlot
~~~

![](Help/Image/pascalTriangle-B.svg)

Sierpiński’s triangle,
matrix plot,
OEIS [A047999](https://oeis.org/A047999):

~~~spl svg=C oeis=A047999
(24.pascalTriangle % 2)
.padRight
.matrixPlot
~~~

![](Help/Image/pascalTriangle-C.svg)

Sierpiński’s triangle,
row-order discrete plot,
OEIS [A047999](https://oeis.org/A047999):

~~~spl svg=D oeis=A047999
(11.pascalTriangle % 2)
.catenate
.discretePlot
~~~

![](Help/Image/pascalTriangle-D.svg)

Matrix plot of the first few rows of Pascal’s triangle modulo five,
OEIS [A095140](https://oeis.org/A095140):

~~~spl svg=E oeis=A095140
(20.pascalTriangle % 5)
.padRight
.rescale
.matrixPlot
~~~

![](Help/Image/pascalTriangle-E.svg)

Sierpiński’s triangle,
OEIS [A047999](https://oeis.org/A047999):

~~~spl svg=F oeis=A047999
(16.pascalTriangle % 2)
.triangularArrayPlot
~~~

![](Help/Image/pascalTriangle-F.svg)

Pascal’s triangle modulo three,
OEIS [A083093](https://oeis.org/A083093),
offset to _-1,0,1_:

~~~spl svg=G oeis=A083093 variant
(16.pascalTriangle % 3 - 1)
.catenate
.discretePlot
~~~

![](Help/Image/pascalTriangle-G.svg)

Row sums of Pascal’s triangle modulo three,
OEIS [A051638](https://oeis.org/A051638):

~~~spl svg=H oeis=A051638
(85.pascalTriangle % 3)
.collect(sum:/1)
.scatterPlot
~~~

![](Help/Image/pascalTriangle-H.svg)

Pascal’s triangle negated modulo three,
OEIS [A090044](https://oeis.org/A090044),
offset to _-1,0,1_:

~~~spl svg=I oeis=A090044 variant
(16.pascalTriangle.negate % 3 - 1)
.catenate
.discretePlot
~~~

![](Help/Image/pascalTriangle-I.svg)

Pascal’s triangle modulo four,
OEIS [A034931](https://oeis.org/A034931):

~~~spl svg=J oeis=A034931
(14.pascalTriangle % 4)
.catenate
.stepPlot
~~~

![](Help/Image/pascalTriangle-J.svg)

Pascal’s triangle modulo six,
OEIS [A095141](https://oeis.org/A095141):

~~~spl svg=K oeis=A095141
(14.pascalTriangle % 6)
.catenate
.stepPlot
~~~

![](Help/Image/pascalTriangle-K.svg)

* * *

See also: bernoulliTriangle, binomial, gouldsSequence, leibnizHarmonicTriangle, pascalMatrix, stolarskyHarborthConstant, table, triangularNumber

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
