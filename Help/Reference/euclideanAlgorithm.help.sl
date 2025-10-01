# euclideanAlgorithm

- _euclideanAlgorithm(a, b)_

The Euclidean algorithm is an efficient method for computing the greatest common divisor of two integers.

```
>>> 42823.euclideanAlgorithm(6409)
17

>>> [3 7 40].collect { :each |
>>> 	12.euclideanAlgorithm(each)
>>> }
[3 1 4]
```

At `UnivariatePolynomial`:

```
>>> let a = UnivariatePolynomial([6 7 1]);
>>> let b = UnivariatePolynomial([-6 -5 1]);
>>> a.euclideanAlgorithm(b)
UnivariatePolynomial([12 12])

>>> let a = UnivariatePolynomial([4 4 1]);
>>> let b = UnivariatePolynomial([1 2 2]);
>>> a.euclideanAlgorithm(b)
UnivariatePolynomial([25/18])

>>> let a = UnivariatePolynomial([-4 0 0 0 1]);
>>> let b = UnivariatePolynomial([4 0 4 0 1]);
>>> a.euclideanAlgorithm(b)
UnivariatePolynomial([-8 0 -4])

>>> let a = UnivariatePolynomial([-4 0 1]);
>>> let b = UnivariatePolynomial([4 4 1]);
>>> (a.euclideanAlgorithm(b), a.resultant(b))
(UnivariatePolynomial([-8, -4]), 0)

>>> let a = UnivariatePolynomial([9 3]);
>>> let b = UnivariatePolynomial([12 -3 0 6]);
>>> (a.euclideanAlgorithm(b), a.resultant(b))
(UnivariatePolynomial([-141]), -3807)
```

* * *

See also: extendedEuclideanAlgorithm, gcd, polynomialGcd

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EuclideanAlgorithm.html),
_W_
[1](https://en.wikipedia.org/wiki/Euclidean_algorithm)
