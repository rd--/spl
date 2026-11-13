# cyclotomic

- _cyclotomic(n)_

Answer the _n_-th cyclotomic polynomial.

The fifth, sixth, and thirtieth cyclotomic polynomial:

```
>>> 5L.cyclotomic
>>> .coefficientList
[1 1 1 1 1]

>>> 6L.cyclotomic
>>> .coefficientList
[1 -1 1]

>>> 30L.cyclotomic
>>> .coefficientList
[1 1 0 -1 -1 -1 0 1 1]
```

Table of the first few cyclotomic polynomials,
OEIS [A013595](https://oeis.org/A013595),
also,
with rows reversed,
OEIS [A013596](https://oeis.org/A013596),
though see not about symmetry below:

```
>>> 1L:22L.collect { :n |
>>> 	n.cyclotomic.coefficientList
>>> }
[
	-1 1;
	1 1;
	1 1 1;
	1 0 1;
	1 1 1 1 1;
	1 -1 1;
	1 1 1 1 1 1 1;
	1 0 0 0 1;
	1 0 0 1 0 0 1;
	1 -1 1 -1 1;
	1 1 1 1 1 1 1 1 1 1 1;
	1 0 -1 0 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 -1 1 -1 1 -1 1;
	1 -1 0 1 -1 1 0 -1 1;
	1 0 0 0 0 0 0 0 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 0 0 -1 0 0 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 0 -1 0 1 0 -1 0 1;
	1 -1 0 1 -1 0 1 0 -1 1 0 -1 1;
	1 -1 1 -1 1 -1 1 -1 1 -1 1
]
```

From _n=2_ coefficient lists are generally symmetrical:

```
>>> 2L:50L.allSatisfy { :n |
>>> 	n.cyclotomic.coefficientList
>>> 	.isPalindrome
>>> }
true
```

The prime cyclotomic polynomial are uniformly `one` and have degree :

```
>>> 11L.cyclotomic.coefficientList
[1 1 1 1 1 1 1 1 1 1 1]
```

The first cyclotomic polynomial with a coefficient other than 1, 0, or −1:

```
>>> 105L.cyclotomic.coefficientList
[
	 1  1  1  0  0 -1 -1 -2 -1 -1
	 0  0  1  1  1  1  1  1  0  0
	-1  0 -1  0 -1  0 -1  0 -1  0
	 0  1  1  1  1  1  1  0  0 -1
	-1 -2 -1 -1  0  0  1  1  1
]

>>> 105L.cyclotomic.degree
48
```

Values of successive cyclotomic polynomials at _x=1_,
OEIS [A020500](https://oeis.org/A020500):

```
>>> 0L:20L.collect { :n |
>>> 	n.cyclotomic.at(1L)
>>> }
[
	1  0  2  3  2  5  1  7  2  3
	1 11  1 13  1  1  2 17  1 19
	1
]
```

Central polygonal numbers,
OEIS [A002061](https://oeis.org/A002061):

```
>>> 0:13.collect(6L.cyclotomic.unaryBlock)
[1 1 3 7 13 21 31 43 57 73 91 111 133 157]
```

Table of resultants for cyclotomic polynomials,
OEIS [A054372](https://oeis.org/A054372):

```
>>> 1L:4L.triangularArray { :n :k |
>>> 	k.cyclotomic.resultant(
>>> 		n.cyclotomic
>>> 	)
>>> }
[
	0;
	2 0;
	3 1 0;
	2 2 1 0
]
```

Cyclotomic polynomials evaluated at _x=-1_,
OEIS [A020513](https://oeis.org/A020513):

```
>>> 1L:20L.collect { :n |
>>> 	cyclotomic(n).at(-1L)
>>> }
[-2 0 1 2 1 3 1 2 1 5 1 1 1 7 1 2 1 3 1 1]
```

The answers are cached for efficiency:

```
>>> system.cachedCyclotomic
>>> .isMap
true
```

Plot first few cyclotomic polynomials:

~~~spl svg=A
(-1 -- 1).functionPlot(
	2L:7L.collect { :n |
		n.cyclotomic.unaryBlock
	}
)
~~~

![](Help/Image/cyclotomic-A.svg)

Plot `degree`, or `exponent`, of first few cyclotomic polynomials:

~~~spl svg=B
1L:75L.collect { :n |
	n.cyclotomic.degree
}.scatterPlot
~~~

![](Help/Image/cyclotomic-B.svg)

Plot number of non-zero coefficients of the first few cyclotomic polynomials:

~~~spl svg=C
1L:75L.collect { :n |
	n.cyclotomic
	.coefficientList
	.count(isNonZero/1)
}.scatterPlot
~~~

![](Help/Image/cyclotomic-C.svg)

Nonzero coefficients of successive cyclotomic polynomials:

~~~spl svg=D
1L:20L.collect { :n |
	n.cyclotomic
	.coefficientList.abs
}.padRight.matrixPlot
~~~

![](Help/Image/cyclotomic-D.svg)

Quotients of consecutive values of `lcm`,
OEIS [A051417](https://oeis.org/A051417):

~~~spl svg=E oeis=A051417
1L:60L.collect { :n |
	(2L * n + 1L).cyclotomic.at(1L)
}.discretePlot
~~~

![](Help/Image/cyclotomic-E.svg)

Cyclotomic polynomials evaluated at _x=-1_,
OEIS [A020513](https://oeis.org/A020513):

~~~spl svg=F oeis=A020513
1L:65L.collect { :n |
	cyclotomic(n).at(-1L)
}.discretePlot
~~~

![](Help/Image/cyclotomic-F.svg)

Values of successive cyclotomic polynomials at _x=1_,
OEIS [A020500](https://oeis.org/A020500):

~~~spl svg=G oeis=A020500
1L:65L.collect { :n |
	n.cyclotomic.at(1L)
}.discretePlot
~~~

![](Help/Image/cyclotomic-G.svg)

Table of the first few cyclotomic polynomials,
OEIS [A013595](https://oeis.org/A013595):

~~~spl svg=H oeis=A013595
1L:17L.collect { :n |
	n.cyclotomic.coefficientList
}.catenate.discretePlot
~~~

![](Help/Image/cyclotomic-H.svg)

* * *

See also: UnivariatePolynomial, polynomialQuotient

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclotomicPolynomial.html)
[2](https://reference.wolfram.com/language/ref/Cyclotomic.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclotomic_polynomial)
