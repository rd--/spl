# arithmeticDerivative

- _arithmeticDerivative(n)_

Answer the arithmetic derivative of _n_,
also called the Lagarias arithmetic derivative or number derivative.

Find the arithmetic derivative of one hundred:

```
>>> 100.arithmeticDerivative
140
```

Find the arithmetic derivative of the fraction _3/10_

```
>>> 3/10.arithmeticDerivative
-11/100
```

The arithmetic derivate for any prime is one:

```
>>> 23.arithmeticDerivative
1
```

At negative ten:

```
>>> -10.arithmeticDerivative
-7

>>> 10.arithmeticDerivative
7
```

Find the arithmetic derivative of a prime tower:

```
>>> (3 ^ 11).arithmeticDerivative
649539

>>> 11 * (3 ^ 10)
649539
```

For all _i,j_ _D(ij)=iD(j)+jD(i)_:

```
>>> (15 * 60).arithmeticDerivative
1860

>>> (15 * 60.arithmeticDerivative)
>>> +
>>> (60 * 15.arithmeticDerivative)
1860
```

Higher order arithmetic derivatives are defined successively by iteration:

```
>>> arithmeticDerivative:/1
>>> .nestList(100, 5)
[100 140 188 192 640 2368]
```

First few terms of the arithmetic derivative of _n_,
OEIS [A003415](https://oeis.org/A003415):

```
>>> 0:23.arithmeticDerivative
[
	0 0 1 1 4 1 5 1 12 6
	7 1 16 1 9 8 32 1 21 1
	24 10 13 1
]
```

First few terms of the second arithmetic derivative of _n_,
OEIS [A068346](https://oeis.org/A068346):

```
>>> 0:23.arithmeticDerivative
>>> .arithmeticDerivative
[
	0 0 0 0 4 0 1 0 16 5
	1 0 32 0 6 12 80 0 10 0
	44 7 1 0
]
```

First few terms of the third arithmetic derivative of _n_,
OEIS [A099306](https://oeis.org/A099306):

```
>>> 0:23.arithmeticDerivative
>>> .arithmeticDerivative
>>> .arithmeticDerivative
[
	0 0 0 0 4 0 0 0 32 1
	0 0 80 0 5 16 176 0 7 0
	48 1 0 0
]
```

First few terms of the _n_-th arithmetic derivative of _n_,
OEIS [A185232](https://oeis.org/A185232):

```
>>> 0:23.collect { :n |
>>> 	arithmeticDerivative:/1
>>> 	.iterate(n, n)
>>> }
[
	0 0 0 0 4
	0 0 0 1520 0
	0 0 235072 0 0
	705280 278539264 0 0 0
	226593936 0 0 0
]
```

Table of derivatives of _i/j_ for small _i,j_:

```
>>> { :i :j |
>>> 	Fraction(i, j)
>>> 	.arithmeticDerivative
>>> }.table(1:10, 1:7)
[
	1 -1/4 -1/9 -1/4 -1/25 -5/36 -1/49;
	1 1 1/9 -1/4 3/25 -1/9 5/49;
	1 -1/4 1 -1/2 2/25 -1/4 4/49;
	4 1 8/9 1 16/25 1/9 24/49;
	1 -3/4 -2/9 -1 1 -19/36 2/49;
	5 1 1 -1/4 19/25 1 29/49;
	1 -5/4 -4/9 -3/2 -2/25 -29/36 1;
	12 4 28/9 1 52/25 8/9 76/49;
	6 3/4 1 -3/4 21/25 -1/4 33/49;
	7 1 11/9 -3/4 1 -2/9 39/49
]
```

The arithmetic derivative of _n_,
OEIS [A003415](https://oeis.org/A003415):

~~~spl svg=A oeis=A003415
0:85.arithmeticDerivative.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-A.svg)

The second arithmetic derivative of _n_,
OEIS [A068346](https://oeis.org/A068346):

~~~spl svg=B oeis=A068346
0:85.arithmeticDerivative
.arithmeticDerivative
.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-B.svg)

The third arithmetic derivative of _n_,
OEIS [A099306](https://oeis.org/A099306):

~~~spl svg=C oeis=A099306
0:85.arithmeticDerivative
.arithmeticDerivative
.arithmeticDerivative
.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-C.svg)

The array,
read by antidiagonals,
of the _k_-th derivative of _n_,
OEIS [A258651](https://oeis.org/A258651):

~~~spl svg=D oeis=A258651
0:27.antidiagonalArray { :n :k |
	arithmeticDerivative:/1.iterate(n, k)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-D.svg)

Log scale matrix plot of table of derivatives of _i/j_ for small _i,j_:

~~~spl svg=E
{ :i :j |
	Fraction(i, j)
	.arithmeticDerivative
}.table(1:10, 1:10).logScale.matrixPlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-E.svg)

* * *

See also: factorInteger

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic_derivative)

Further Reading: Barbeau 1961, Ufnarovski 2003
