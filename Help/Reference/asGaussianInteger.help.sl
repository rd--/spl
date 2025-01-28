# asGaussianInteger

- _asGaussianInteger(aComplex)_

Round the real and imaginary components of a `Complex` number.

This may be required when using operations that introduce errors when operating on `Complex` numbers with `SmallFloat` components.

```
>>> (1J1 ^ 3.0000001).isGaussianInteger
false

>>> (1J1 ^ 3.0000001).asGaussianInteger
-2J2
```

* * *

See also: isGaussianInteger

Categories: Converting
