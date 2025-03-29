# isRegularlySpaced

- _isRegularlySpaced(aList)_

Answer `true` if _aList_ is a regular spaced, and `false` otherwise.

An irregularly spaced list:

```
>>> [1 -1 3 -3 5 -5].isRegularlySpaced
false

>>> [1 -1 3 -3 5 -5].differences
[-2 4 -6 8 -10]
```

A regularly spaced list:

```
>>> [1 3 5 7 9].isRegularlySpaced
true

>>> [1 3 5 7 9].differences
[2 2 2 2]
```

* * *

See also: isRegularlySampled
