# bernoulliPolynomial

- _bernoulliPolynomial(n)_

Answer the `UnivariatePolynomial` for the Bernoulli polynomial _B(n)_.

```
>>> 5.bernoulliPolynomial
UnivariatePolynomial(
	[0 -1/6 0 5/3 -5/2 1]
)
```

Plot the polynomial _B(3)_:

~~~spl svg=A
let p = 3.bernoulliPolynomial;
(0 -- 1).functionPlot(p.asBlock)
~~~

![](sw/spl/Help/Image/bernoulliPolynomial-A.svg)

Plot the polynomials _B(5)_ and _B(6)_:

~~~spl svg=B
(-0.35 -- 1).functionPlot(
	[5 6].collect { :n |
		n.bernoulliPolynomial.asBlock
	}
)
~~~

![](sw/spl/Help/Image/bernoulliPolynomial-B.svg)

* * *

See also: bernoulliNumber, bernoulliSequence, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliPolynomial.html)
[2](https://reference.wolfram.com/language/ref/BernoulliB.html),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_polynomials)
