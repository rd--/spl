# isGaussianInteger

- _isGaussianInteger(x)_

A Gaussian integer is a `Complex` number _a+bi_ where _a_ and _b_ are integers.

```
>>> 2J3.isGaussianInteger
true
```

The sum, difference, and product of two Gaussian integers are Gaussian integers:

```
>>> let a = 3J4;
>>> let b = 7J9;
>>> (a + b, a - b, a * b)
(10J13 -4J-5 -15J55)
```

Integers are Gaussian integers with a zero imaginary part:

```
>>> 23.isGaussianInteger
true

>>> 23J0.isGaussianInteger
true
```

* * *

See also: Complex, isGaussianPrime, isInteger

Guides: Complex Functions, Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_integer)

Categories: Testing
