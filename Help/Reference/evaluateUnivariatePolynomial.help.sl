# evaluateUnivariatePolynomial

- _evaluateUnivariatePolynomial([c₁ c₂ …], x)_

Evaluate the univariate polynomial,
specified as a list of ascending coefficients _c_,
at value _x_.

Evaluate at symbol:

```
>> evaluateUnivariatePolynomial(
>> 	[3 -5 7],
>> 	`x`
>> )
(+ (* x (+ (* x 7) -5)) 3)
```

There is also a direct form evaluator:

```
>> evaluateUnivariatePolynomialDirectForm(
>> 	[3 -5 7],
>> 	`x`
>> )
(+ (- (* 7 (^ x 2)) (* 5 x)) 3)
```

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

Guides: Polynomial Functions
