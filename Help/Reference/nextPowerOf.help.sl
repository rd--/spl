# nextPowerOf

- _nextPowerOf(anInteger, base)_

Answers the next power of _base_ greater than or equal to _anInteger_.

```
>>> 300.nextPowerOf(3)
729

>>> 600.nextPowerOf(7)
2401
```

This works by taking the `ceiling` of the `log` of _anInteger_, and is subject to floating point errors:

```
>>> 729.nextPowerOf(3)
2187
```

* * *

See also: isPowerOfTwo, nextPowerOfTwo

Categories: Truncation, Rounding
