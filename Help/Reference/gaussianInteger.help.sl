# gaussianInteger

- _gaussianInteger(c)_

Round the real and imaginary components of a `Complex` number.
This is an alias for `round`.

This may be required when using operations that introduce errors when operating on `Complex` numbers with `SmallFloat` components.

```
>>> (1J1 ^ 3.0000001).isGaussianInteger
false

>>> (1J1 ^ 3.0000001).gaussianInteger
-2J2
```

* * *

See also: Complex, isGaussianInteger, round

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_integer)

Categories: Converting
