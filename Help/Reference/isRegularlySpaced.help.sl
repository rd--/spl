# isRegularlySpaced

- _isRegularlySpaced(x)_

Answer `true` if _x_ is regularly spaced, and `false` otherwise.

An irregularly spaced `List`:

```
>>> [1 -1 3 -3 5 -5].isRegularlySpaced
false

>>> [1 -1 3 -3 5 -5].differences
[-2 4 -6 8 -10]
```

A regularly spaced `List`:

```
>>> [1 3 5 7 9].isRegularlySpaced
true

>>> [1 3 5 7 9].differences
[2 2 2 2]
```

All `Range` values are regularly spaced:

```
>>> 1:9.isRegularlySpaced
true

>>> (9, 8 .. 1).isRegularlySpaced
true
```

* * *

See also: isMonotonicallyIncreasing, isRegularlySampled
