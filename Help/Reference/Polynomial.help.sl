# Polynomial

- _Polynomial(c)_

Answer either a `UnivariatePolynomial` or a `BivariatePolynomial` depending on the type of _c_.

```
>>> Polynomial([1 2 3])
UnivariatePolynomial([1 2 3])

>>> Polynomial([1 2; 3 4])
BivariatePolynomial([1 2; 3 4])
```

Plot number of representations of _n_ as a sum of distinct Lucas numbers,
OEIS [A003263](https://oeis.org/A003263):

~~~spl svg=A
1:10.product { :n |
	Polynomial(
		[
			0: 1,
			n.lucasInteger: 1
		]
	)
}.coefficientList
.allButFirst
.take(105)
.discretePlot
~~~

![](sw/spl/Help/Image/Polynomial-A.svg)

* * *

See also: BivariatePolynomial, UnivariatePolynomial

Guides: Polynomial Functions

References:
_OEIS_
[1](https://oeis.org/A003263)
