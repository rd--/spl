# polynomialGcd

- _polynomialGcd(p₁, p₂)_

Answer the greatest common divisor of the polynomials _p_.
The answer is a monic polynomial.

At `List`,
which must be an ascending list of coefficients:

```
>>> [6 7 1].polynomialGcd([-6 -5 1])
[1 1]

>>> [4 4 1].polynomialGcd([1 2 2])
[1]

>>> [-4 0 0 0 1].polynomialGcd([4 0 4 0 1])
[2 0 1]

>>> [-4 0 1].polynomialGcd([4 4 1])
[2 1]

>>> [9 3].polynomialGcd([12 -3 0 6])
[1]
```

* * *

See also: euclideanAlgorithm, gcd, monicPolynomial, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolynomialGCD.html),
_W_
[1](https://en.wikipedia.org/wiki/Polynomial_greatest_common_divisor)
