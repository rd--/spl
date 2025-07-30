# UnivariatePolynomial

- _UnivariatePolynomial(c)_

A `Type` representing a univariate polynomial, specified as the sequence of ascending coefficients _c_.

The `degree` of the polynomial is the largest exponent,
`coefficientList` is the list of ascending coefficients:

```
>>> let p = UnivariatePolynomial([1 2 3]);
>>> (p.degree, p.coefficientList)
(2, [1 2 3])
```

The sum of two univariate polynomials of degrees seven and eleven:

```
>>> 7.chebyshevT + 11.chebyshevT
UnivariatePolynomial(
	[
		0 -18
		0 276
		0 -1344
		0 2880
		0 -2816
		0 1024
	]
)
```

The product of two univariate polynomials:

```
>>> let a = UnivariatePolynomial([3 2]);
>>> let b = UnivariatePolynomial([-4 1]);
>>> a * b
UnivariatePolynomial([-12 -5 2])

>>> let a = 7.chebyshevT;
>>> let b = 11.chebyshevT;
>>> let c = a * b;
>>> let x = 0.75;
>>> (a[x] * b[x], c[x])
(-0.03261, -0.03261)
```

The product of a univariate polynomial and a constant:

```
>>> 7.chebyshevT * 2
UnivariatePolynomial(
	[0 -14 0 112 0 -224 0 128]
)
```

Evaluate numerically:

```
>>> let x = 2;
>>> UnivariatePolynomial([1 2 3]).at(x)
(((x * 3) + 2) * x) + 1
```

Evaluate symbolically:

```
>> UnivariatePolynomial([1 2 3]).at(𝒙)
(+ (* x (+ (* x 3) 2)) 1)
```

Polynomial of degree two, a parabola:

~~~spl svg=A
let p = UnivariatePolynomial([-2 -1 1]);
(-2 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-A.svg)

Polynomial of degree three:

~~~spl svg=B
let p = UnivariatePolynomial([-8 -6 3 1]);
(-5 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-B.svg)

Polynomial of degree four:

~~~spl svg=C
let p = UnivariatePolynomial([0 1 -2 0 1]);
(-1.75 -- 1.5).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-C.svg)

Polynomial of degree six:

~~~spl svg=D
let c = [720 -1764 1624 -735 175 -21 1];
let p = UnivariatePolynomial(c);
(1 -- 6).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-D.svg)

Polynomial of degree seven, in this case the seventh Chebyshev polynomial of the first kind:

~~~spl svg=E
let c = [0 -7 0 56 0 -112 0 64];
let p = UnivariatePolynomial(c);
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-E.svg)

Sum of two polynomials of degrees seven and eleven:

~~~spl svg=F
let p1 = 7.chebyshevT;
let p2 = 11.chebyshevT;
let p3 = p1 + p2;
(-1 -- 1).functionPlot { :x |
	p3[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-F.svg)

* * *

See also: degree, evaluateUnivariatePolynomial, functionPlot, chebyshevT, chebyshevU

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnivariatePolynomial.html)
[2](https://reference.wolfram.com/language/ref/CoefficientList.html)
