# inf

- _inf(aNumber)_

Answer `Infinity` times _aNumber_,
a constant representing either positive or negative floating point infinity.

```
>>> 1.inf > 0
true

>>> -1.inf < 0
true

>>> 1.inf - 1
1.inf

>>> -1.inf + 1
-1.inf
```

Infinity is a `SmallFloat` value:

```
>>> 1.inf.isSmallFloat
true
```

Where supported `inf` is displayed as ∞.

* * *

See also: eulerGamma, e, i, pi

Unicode: U+221E ∞ Infinity

Categories: Math, Constant
