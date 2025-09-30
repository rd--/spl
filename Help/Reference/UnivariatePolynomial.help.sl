# UnivariatePolynomial

- _UnivariatePolynomial(c)_

A `Type` representing a univariate polynomial.
Coefficients at _c_ may be specified either as an ascending sequence,
or as a dictionary of terms.

The `degree` of the polynomial is the largest exponent,
`coefficientList` is the list of ascending coefficients,
`terms` is a `Map` of terms,
`leadingCoefficient` is the coefficient of the term with the highest degree:

```
>>> let p = UnivariatePolynomial([-2 0 1 5]);
>>> (
>>> 	p.degree,
>>> 	p.coefficientList,
>>> 	p.terms,
>>> 	p.leadingCoefficient
>>> )
(3, [-2 0 1 5], [0: -2, 2: 1, 3: 5], 5)
```

Construct from a `Map`, entries are _(exponent, coefficient)_ terms:

```
>>> UnivariatePolynomial([1: -3, 3: 1])
UnivariatePolynomial([0 -3 0 1])
```

Polynomials are normalized by construction:

```
>>> let p = UnivariatePolynomial([1 0 0]);
>>> (p.degree, p.coefficientList)
(0, [1])
```

Copying:

```
>>> let a = UnivariatePolynomial([1 2 3]);
>>> let b = a.deepCopy;
>>> a.coefficientList !== b.coefficientList
true
```

Evaluate at `Symbol`:

```
>> UnivariatePolynomial([1 2 3]).at(`x`)
(+ (* x (+ (* x 3) 2)) 1)
```

Addition:

```
>>> let a = UnivariatePolynomial([5 3 3]);
>>> let b = UnivariatePolynomial([-2 -1 2]);
>>> a + b
UnivariatePolynomial([3 2 5])

>>> let a = UnivariatePolynomial([1 2]);
>>> let b = UnivariatePolynomial([3 4 8]);
>>> a + b
UnivariatePolynomial([4 6 8])
```

Subtraction:

```
>>> let a = UnivariatePolynomial([-2 5 2]);
>>> let b = UnivariatePolynomial([-1 -3 6]);
>>> a - b
UnivariatePolynomial([-1 8 -4])

>>> let a = UnivariatePolynomial([-2 5 2]);
>>> let b = a - a;
>>> (b.isZero, b.isNormal)
(true, true)
```

Multiplication:

```
>>> let a = UnivariatePolynomial([47 -12 6]);
>>> let b = UnivariatePolynomial([7 -3 14]);
>>> a * b
UnivariatePolynomial([329 -225 736 -186 84])
```

Quotient and remainder:

```
>>> let a = UnivariatePolynomial([-42 0 -12 1]);
>>> let b = UnivariatePolynomial([-3 1]);
>>> a.quotientRemainder(b)
[
	UnivariatePolynomial([-27 -9 1]),
	UnivariatePolynomial([-123])
]

>>> let a = UnivariatePolynomial([3 5 6 -4 1]);
>>> let b = UnivariatePolynomial([1 2 1]);
>>> a.quotientRemainder(b)
[
	UnivariatePolynomial([17 -6 1]),
	UnivariatePolynomial([-14 -23])
]
```

Greatest common divisor:

```
>>> let a = UnivariatePolynomial([6 7 1]);
>>> let b = UnivariatePolynomial([-6 -5 1]);
>>> a.gcd(b)
UnivariatePolynomial([12 12])

>>> let a = UnivariatePolynomial([4 4 1]);
>>> let b = UnivariatePolynomial([1 2 2]);
>>> a.gcd(b)
UnivariatePolynomial([25/18])

>>> let a = UnivariatePolynomial([-4 0 0 0 1]);
>>> let b = UnivariatePolynomial([4 0 4 0 1]);
>>> a.gcd(b)
UnivariatePolynomial([-8 0 -4])

>>> let a = UnivariatePolynomial([-4 0 1]);
>>> let b = UnivariatePolynomial([4 4 1]);
>>> (a.gcd(b), a.resultant(b))
(UnivariatePolynomial([-8, -4]), 0)

>>> let a = UnivariatePolynomial([9 3]);
>>> let b = UnivariatePolynomial([12 -3 0 6]);
>>> (a.gcd(b), a.resultant(b))
(UnivariatePolynomial([-141]), -3807)
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

Periodic rational polynomials:

```
>>> UnivariatePolynomial(
>>> 	[1 -1243/35 123/7 348/35 1]
>>> ).asBlock
>>> .nestList(0, 4)
[0 1 -6 -5 0]

>>> UnivariatePolynomial(
>>> 	[3889/11 -7629/13 37797/143 -4292/143 1]
>>> ).asBlock
>>> .nestList(1, 4)
[1 2 13 14 1]
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

See also: degree, coefficientList, evaluateUnivariatePolynomial, functionPlot, chebyshevT, chebyshevU

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnivariatePolynomial.html)
[2](https://reference.wolfram.com/language/ref/CoefficientList.html)
_W_
[1](https://en.wikipedia.org/wiki/Polynomial)
[2](https://en.wikipedia.org/wiki/Polynomial_long_division)
