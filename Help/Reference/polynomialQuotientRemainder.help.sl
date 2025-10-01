# polynomialQuotientRemainder

- _polynomialQuotientRemainder(p₁, p₂)_

Answer the quotient and remainder of the polynomials _p_.

At `List`,
which must be an ascending list of coefficients:

```
>>> [-42 0 -12 1]
>>> .polynomialQuotientRemainder(
>>> 	[-3 1]
>>> )
[-27 -9 1; -123]

>>> [-42 0 -12 1]
>>> .polynomialQuotientRemainder(
>>> 	[-3 1 1]
>>> )
[-13 1; -81 16]

>>> [3 5 6 -4 1]
>>> .polynomialQuotientRemainder(
>>> 	[1 2 1]
>>> )
[17 -6 1; -14 -23]

>>> [1 2 0 0 1]
>>> .polynomialQuotientRemainder(
>>> 	[1 0 1]
>>> )
[-1 0 1; 2 2]

>>> [1 1 1]
>>> .polynomialQuotientRemainder(
>>> 	[1 2]
>>> )
[1/4 1/2; 3/4]

>>> [-7 0 5 6]
>>> .polynomialQuotientRemainder(
>>> 	[-1 -2 3]
>>> )
[3 2; -4 8]

>>> [-4 0 -2 1]
>>> .polynomialQuotientRemainder(
>>> 	[-3 1]
>>> )
[3 1 1; 5]

>>> [-42 0 -12 1]
>>> .polynomialQuotientRemainder(
>>> 	[1 -2 1]
>>> )
[-10 1; -32 -21]
```

Sequence of steps for Euclidean algorithm:

```
>>> [-5 2 8 -3 -3 0 1 0 1]
>>> .polynomialQuotientRemainder(
>>> 	[21 -9 -4 0 5 0 3]
>>> )
[-2/9 0 1/3; -1/3 0 1/9 0 -5/9]

>>> [21 -9 -4 0 5 0 3]
>>> .polynomialQuotientRemainder(
>>> 	[-1/3 0 1/9 0 -5/9]
>>> )
[-252/25 0 -27/5; 441/25 -9/1 -117/25]

>>> [-1/3 0 1/9 0 -5/9]
>>> .polynomialQuotientRemainder(
>>> 	[441/25 -9/1 -117/25]
>>> )
[
	51175/59319 -3125/13689 125/1053;
	-102500/6591 233150/19773
]

>>> [441/25 -9/1 -117/25]
>>> .polynomialQuotientRemainder(
>>> 	[-102500/6591 233150/19773]
>>> )
[
	-1398919977/1087178450
	-2313441/5828750
	;
	-1288744821/543589225
]
```

* * *

See also: quotientRemainder, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolynomialQuotientRemainder.html),
_W_
[1](https://en.wikipedia.org/wiki/Polynomial_long_division)
[2](https://en.wikipedia.org/wiki/Synthetic_division)
