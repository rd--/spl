# isIeeeInteger

- _isIeeeInteger(x)_

Answer `true` if the `SmallFloat` _x_ is an integer,
though it would answer `false` to `isInteger`.

```
>>> SmallFloat(2L ^ 54)
>>> .isIeeeInteger
true

>>> SmallFloat(2L ^ 54)
>>> .isInteger
false
```

* * *

See also: SmallFloat, SmallInteger, isInteger

Guides: Floating Point Functions
