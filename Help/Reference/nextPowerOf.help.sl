# nextPowerOf

- _nextPowerOf(n, b)_

Answers the next power of base _b_ greater than or equal to the integer _n_.

```
>>> 300.nextPowerOf(3)
729

>>> 600.nextPowerOf(7)
2401
```

This works by taking the `ceiling` of the `log` of _n_,
and is subject to floating point errors,
in some contexts the following may answer the next next power of two:

```
>>> 729.nextPowerOf(3)
729

>>> 3 ^ [6 7]
[729 2187]
```

* * *

See also: isPowerOfTwo, nextPowerOfTwo

Guides: Integer Functions, Rounding Functions
