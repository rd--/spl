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
>>> let a = Polynomial([6 7 1]);
>>> let b = Polynomial([-6 -5 1]);
>>> a.euclideanAlgorithm(b)
Polynomial([12 12])

>>> let a = Polynomial([4 4 1]);
>>> let b = Polynomial([1 2 2]);
>>> a.euclideanAlgorithm(b)
Polynomial([25/18])

>>> let a = Polynomial([-4 0 0 0 1]);
>>> let b = Polynomial([4 0 4 0 1]);
>>> a.euclideanAlgorithm(b)
Polynomial([-8 0 -4])

>>> let a = Polynomial([-4 0 1]);
>>> let b = Polynomial([4 4 1]);
>>> (a.euclideanAlgorithm(b), a.resultant(b))
(Polynomial([-8, -4]), 0)

>>> let a = Polynomial([9 3]);
>>> let b = Polynomial([12 -3 0 6]);
>>> (a.euclideanAlgorithm(b), a.resultant(b))
(Polynomial([-141]), -3807)
```

* * *

See also: extendedEuclideanAlgorithm, gcd, polynomialGcd

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EuclideanAlgorithm.html),
_W_
[1](https://en.wikipedia.org/wiki/Euclidean_algorithm)
