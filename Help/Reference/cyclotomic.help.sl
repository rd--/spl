# cyclotomic

- _cyclotomic(n)_

Answer the _n_-th cyclotomic polynomial.

The fifth and thirtieth cyclotomic polynomial:

```
>>> 5.cyclotomic.coefficientList
[1 1 1 1 1]

>>> 30.cyclotomic.coefficientList
[1 1 0 -1 -1 -1 0 1 1]
```

Table of the first few cyclotomic polynomials:

```
>>> 1:22.collect { :n |
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

The prime cyclotomic polynomial are uniformly `one` and have degree :

```
>>> 11.cyclotomic.coefficientList
[1 1 1 1 1 1 1 1 1 1 1]
```

The first cyclotomic polynomial with a coefficient other than 1, 0, or −1:

```
>>> 105.cyclotomic.coefficientList
[
	 1  1  1  0  0 -1 -1 -2 -1 -1
	 0  0  1  1  1  1  1  1  0  0
	-1  0 -1  0 -1  0 -1  0 -1  0
	 0  1  1  1  1  1  1  0  0 -1
	-1 -2 -1 -1  0  0  1  1  1
]

>>> 105.cyclotomic.degree
48
```

Values of successive cyclotomic polynomials at one:

```
>>> 2:20.collect { :n |
>>> 	cyclotomic(n).at(1)
>>> }
[
	2  3  2  5  1  7  2  3  1 11
	1 13  1  1  2 17  1 19  1
]
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
	2:7.collect { :n |
		n.cyclotomic.asBlock
	}
)
~~~

![](sw/spl/Help/Image/cyclotomic-A.svg)

Plot `degree`, or `exponent`, of first few cyclotomic polynomials:

~~~spl svg=B
1:75.collect { :n |
	n.cyclotomic.degree
}.scatterPlot
~~~

![](sw/spl/Help/Image/cyclotomic-B.svg)

Plot number of non-zero coefficients of the first few cyclotomic polynomials:

~~~spl svg=C
1:75.collect { :n |
	n.cyclotomic
	.coefficientList
	.count(isNonZero:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/cyclotomic-C.svg)

Nonzero coefficients of successive cyclotomic polynomials:

~~~spl svg=D
1:40.collect { :n |
	n.cyclotomic
	.coefficientList
}.padRight.matrixPlot
~~~

![](sw/spl/Help/Image/cyclotomic-D.svg)

* * *

See also: polynomialQuotient, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclotomicPolynomial.html)
[2](https://reference.wolfram.com/language/ref/Cyclotomic.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclotomic_polynomial)
