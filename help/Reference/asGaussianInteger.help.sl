# asGaussianInteger

- _asGaussianInteger(aComplex)_

Round the real and imaginary components of a `Complex` number.

This may be required when using operations that introduce errors when operating on `Complex` numbers with `SmallFloat` components.

```
>>> (1j1 ^ 3.0000001).isGaussianInteger
false

>>> (1j1 ^ 3.0000001).asGaussianInteger
-2j2
```

* * *

See also: isGaussianInteger

Categories: Converting
