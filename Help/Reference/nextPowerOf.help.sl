# nextPowerOf

- _nextPowerOf(n, b)_

Answers the next power of base _b_ greater than or equal to the integer _n_.

```
>>> 300.nextPowerOf(3)
729

>>> 600.nextPowerOf(7)
2401
```

This works by taking the `ceiling` of the `log` of _n_, and is subject to floating point errors:

```
>>> 729.nextPowerOf(3)
2187

>>> 3 ^ 7
2187
```

* * *

See also: isPowerOfTwo, nextPowerOfTwo

Guides: Integer Functions

Categories: Truncation, Rounding
