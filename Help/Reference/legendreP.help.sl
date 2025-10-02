# legendreP

- _legendreP(n)_

Answer the _n_-th Legendre polynomial,
calculated using Bonnet’s recursion formula.

Evaluate numerically:

```
>>> 2.legendreP.at(2)
11/2
```

At `zero`,
the line _y=1_:

```
>>> 0.legendreP.coefficientList
[1]
```

At `one`,
the line _y=x_:

```
>>> 1.legendreP.coefficientList
[0 1]
```

Integer form of first few polynomials:

```
>>> (0L .. 10).collect { :n |
>>> 	let a = n.legendreP;
>>> 	let b = a.coefficientList;
>>> 	let c = b.select(isNonZero:/1);
>>> 	let d = c.abs.gcd;
>>> 	(d, b / d)
>>> }
[
	(1, [1]),
	(1, [0 1]),
	(1/2, [-1 0 3]),
	(1/2, [0 -3 0 5]),
	(1/8, [3 0 -30 0 35]),
	(1/8, [0 15 0 -70 0 63]),
	(1/16, [-5 0 105 0 -315 0 231]),
	(1/16, [0 -35 0 315 0 -693 0 429]),
	(
		1/128,
		[
			35 0 -1260 0 6930 0
			-12012 0 6435
		]
	),
	(
		1/128,
		[
			0 315 0 -4620 0 18018
			0 -25740 0 12155
		]
	),
	(
		1/256,
		[
			-63 0 3465 0 -30030 0
			90090 0 -109395 0 46189
		]
	)
]
```

Plot Legendre polynomials two through five:

~~~spl svg=A
(-1 -- 1).functionPlot(
	2:5.collect { :n |
		n.legendreP.asBlock
	}
)
~~~

![](sw/spl/Help/Image/legendreP-A.svg)

Generalized Lissajous figures:

~~~spl svg=B
(-1 -- 1).parametricPlot(
	400,
	7.legendreP.asBlock,
	13.legendreP.asBlock
)
~~~

![](sw/spl/Help/Image/legendreP-B.svg)

* * *

See also: UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LegendrePolynomial.html)
[2](https://reference.wolfram.com/language/ref/LegendreP.html),
_OEIS_
[1](https://oeis.org/A008316),
_W_
[1](https://en.wikipedia.org/wiki/Legendre_polynomials)
