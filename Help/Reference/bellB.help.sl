# bellB

- _bellB(n)_
- _bellB(n, x)_

In the unary case,
answer a `UnivariatePolynomial` holding the Bell polynomial of degree _n_.

Coefficient for the first few Bell polynomials,
OEIS [A106800](http://oeis.org/A106800):

```
>>> 0:6.collect { :n |
>>> 	let p = n.bellB;
>>> 	let c = p.coefficientList;
>>> 	c.without(0)
>>> }
[
	1;
	1;
	1 1;
	1 3 1;
	1 7 6 1;
	1 15 25 10 1;
	1 31 90 65 15 1
]
```

Evaluate at specific _x_:

```
>>> 10.bellB(1)
115975
```

Compute the first 10 complementary Bell numbers:

```
>>> 1:10.collect { :n |
>>> 	n.bellB(-1)
>>> }
[-1 0 1 1 -2 -9 -9 50 267 413]

>>> 1:10.collect { :n |
>>> 	0:n.sum { :k |
>>> 		(-1 ^ k) * stirlingS2(n, k)
>>> 	}
>>> }
[-1 0 1 1 -2 -9 -9 50 267 413]
```

Plot the seven degree Bell polynomial over a subset of the reals:

~~~spl svg=A
(-2 -- 0.75).functionPlot(
	7.bellB.asBlock
)
~~~

![](sw/spl/Help/Image/bellB-A.svg)

Plot the first five polynomials over a subset of the reals:

~~~spl svg=B
(-1 -- 1).functionPlot(
	1:5.collect { :n |
		n.bellB
		.asBlock
		.clip([-2 3])
	}
)
~~~

![](sw/spl/Help/Image/bellB-B.svg)

Evaluate symbolically:

```
>> 3.bellB.at(`x`)
(+ (* x (+ (* x (+ (* x 1) 3)) 1)) 0)
```

* * *

See also: bellY, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BellPolynomial.html)
[2](https://mathworld.wolfram.com/ComplementaryBellNumber.html)
[3](https://reference.wolfram.com/language/ref/BellB.html),
_OEIS_
[1](https://oeis.org/A106800),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.bell),
_W_
[1](https://en.wikipedia.org/wiki/Bell_polynomials)
