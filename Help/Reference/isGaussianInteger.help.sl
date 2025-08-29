# isGaussianInteger

- _isGaussianInteger(x)_

A Gaussian integer is a `Complex` number _a+bi_ where _a_ and _b_ are integers.

```
>>> 2J3.isGaussianInteger
true
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

Guides: Complex Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_integer)

Categories: Testing
