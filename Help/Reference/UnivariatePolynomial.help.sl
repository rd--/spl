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
>>> let p = Polynomial([-2 0 1 5]);
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
>>> Polynomial([1: -3, 3: 1])
Polynomial([0 -3 0 1])
```

Polynomials are normalized by construction:

```
>>> let p = Polynomial([1 0 0]);
>>> (p.degree, p.coefficientList)
(0, [1])
```

Copying:

```
>>> let a = Polynomial([1 2 3]);
>>> let b = a.copy;
>>> a.coefficientList !== b.coefficientList
true
```

Evaluate at `Symbol`:

```
>> Polynomial([1 2 3]).at(`x`)
(+ (* x (+ (* x 3) 2)) 1)
```

Addition:

```
>>> let a = Polynomial([5 3 3]);
>>> let b = Polynomial([-2 -1 2]);
>>> a + b
Polynomial([3 2 5])

>>> let a = Polynomial([1 2]);
>>> let b = Polynomial([3 4 8]);
>>> a + b
Polynomial([4 6 8])
```

Subtraction:

```
>>> let a = Polynomial([-2 5 2]);
>>> let b = Polynomial([-1 -3 6]);
>>> a - b
Polynomial([-1 8 -4])

>>> let a = Polynomial([-2 5 2]);
>>> let b = a - a;
>>> (b.isZero, b.isNormal)
(true, true)
```

Multiplication:

```
>>> let a = Polynomial([47 -12 6]);
>>> let b = Polynomial([7 -3 14]);
>>> a * b
Polynomial([329 -225 736 -186 84])
```

Quotient and remainder,
see also `polynomialQuotientRemainder`:

```
>>> let a = Polynomial([-42 0 -12 1]);
>>> let b = Polynomial([-3 1]);
>>> a.quotientRemainder(b)
[
	Polynomial([-27 -9 1]),
	Polynomial([-123])
]

>>> let a = Polynomial([3 5 6 -4 1]);
>>> let b = Polynomial([1 2 1]);
>>> a.quotientRemainder(b)
[
	Polynomial([17 -6 1]),
	Polynomial([-14 -23])
]
```

Greatest common divisor,
see also `polynomialGcd`:

```
>>> let a = Polynomial([6 7 1]);
>>> let b = Polynomial([-6 -5 1]);
>>> a.gcd(b)
Polynomial([1 1])

>>> let a = Polynomial([4 4 1]);
>>> let b = Polynomial([1 2 2]);
>>> a.gcd(b)
Polynomial([1])

>>> let a = Polynomial([-4 0 0 0 1]);
>>> let b = Polynomial([4 0 4 0 1]);
>>> a.gcd(b)
Polynomial([2 0 1])

>>> let a = Polynomial([-4 0 1]);
>>> let b = Polynomial([4 4 1]);
>>> (a.gcd(b), a.resultant(b))
(Polynomial([2 1]), 0)

>>> let a = Polynomial([9 3]);
>>> let b = Polynomial([12 -3 0 6]);
>>> (a.gcd(b).degree, a.resultant(b))
(0, -3807)
```

The sum of two univariate polynomials of degrees seven and eleven:

```
>>> 7.chebyshevT + 11.chebyshevT
Polynomial(
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
>>> Polynomial(
>>> 	[1 -1243/35 123/7 348/35 1]
>>> ).asBlock
>>> .nestList(0, 4)
[0 1 -6 -5 0]

>>> Polynomial(
>>> 	[
>>> 		3889/11 -7629/13
>>> 		37797/143 -4292/143 1
>>> 	]
>>> ).asBlock
>>> .nestList(1, 4)
[1 2 13 14 1]
```

The product of two univariate polynomials:

```
>>> let a = Polynomial([3 2]);
>>> let b = Polynomial([-4 1]);
>>> a * b
Polynomial([-12 -5 2])

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
Polynomial(
	[0 -14 0 112 0 -224 0 128]
)
```

Evaluate numerically:

```
>>> let x = 2;
>>> Polynomial([1 2 3]).at(x)
(((x * 3) + 2) * x) + 1
```

Evaluate symbolically:

```
>> Polynomial([1 2 3]).at(𝒙)
(+ (* x (+ (* x 3) 2)) 1)
```

Polynomial of degree two, a parabola:

~~~spl svg=A
let p = Polynomial([-2 -1 1]);
(-2 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-A.svg)

Polynomial of degree three:

~~~spl svg=B
let p = Polynomial([-8 -6 3 1]);
(-5 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-B.svg)

Polynomial of degree four:

~~~spl svg=C
let p = Polynomial([0 1 -2 0 1]);
(-1.75 -- 1.5).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-C.svg)

Polynomial of degree six:

~~~spl svg=D
let c = [720 -1764 1624 -735 175 -21 1];
let p = Polynomial(c);
(1 -- 6).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-D.svg)

Polynomial of degree seven, in this case the seventh Chebyshev polynomial of the first kind:

~~~spl svg=E
let c = [0 -7 0 56 0 -112 0 64];
let p = Polynomial(c);
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

See also: coefficientList, chebyshevT, chebyshevU, cyclotomic, legendreP, Polynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnivariatePolynomial.html)
[2](https://reference.wolfram.com/language/ref/CoefficientList.html),
_W_
[1](https://en.wikipedia.org/wiki/Polynomial)
[2](https://en.wikipedia.org/wiki/Polynomial_long_division)
