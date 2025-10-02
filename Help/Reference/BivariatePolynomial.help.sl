# BivariatePolynomial

- _BivariatePolynomial(c)_

A `Type` representing a bivariate polynomial.
Coefficients at _c_ are specified as a matrix telling terms _cᵢⱼxⁱyʲ_.

```
>>> let x = 5;
>>> let y = 7;
>>> Polynomial(
>>> 	[
>>> 		0  0  0 -1;
>>> 		0  2  0  0;
>>> 		3  0  0  0;
>>> 		0  0  0  0
>>> 	]
>>> ).evaluate(x, y)
-198
```

Written out:

```
>>> let x = 5;
>>> let y = 7;
>>> [
>>> 	3 * (x ^ 2),
>>> 	2 * (x ^ 1) * (y ^ 1),
>>> 	-1 * (y ^ 3)
>>> ].sum
-198
```

Grayscale plot of randomly generated coefficient matrix:

~~~spl svg=A
let i = (-1 -- 1).subdivide(20);
Polynomial(
	Sfc32(839724)
	.randomReal([-1 1], [4 4])
).asBlock.table(i, i)
.matrixPlot
~~~

![](sw/spl/Help/Image/BivariatePolynomial-A.svg)

* * *

See also: Polynomial, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BivariatePolynomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Bivariate_polynomial)
