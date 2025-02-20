# evaluateUnivariatePolynomial

- _evaluateUnivariatePolynomial(aList, aNumber)_

Evaluate the univariate polynomial,
specified as a `List` of ascending coefficients,
at value _aNumber_.

Plot a degree eleven polynomial:

~~~spl svg=A
let c = [
	0 -18
	0 276
	0 -1344
	0 2880
	0 -2816
	0 1024
];
(-1 -- 1).functionPlot { :x |
	c.evaluateUnivariatePolynomial(x)
}
~~~

![](sw/spl/Help/Image/evaluateUnivariatePolynomial-A.svg)

* * *

See also: UnivariatePolynomial
