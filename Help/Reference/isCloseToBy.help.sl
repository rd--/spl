# isCloseToBy

- _isCloseToBy(n, m, ε)_

Answer `true` if a number _n_ is close to another number _m_,
according to _ε_,
else `false`.

At `SmallFloat`:

```
>>> 1.isCloseToBy(1.001, 1E-3)
true

>>> 1.isCloseToBy(1.01, 1E-3)
false
```

Note that this method may take magnitude into account,
so that a million is close to a million and one,
but one is not close to two:

```
>>> 1E6.isCloseToBy(1E6 + 1, 1E-3)
true

>>> 1.isCloseToBy(2, 1E-3)
false
```

A `SmallFloat` can be close to a `LargeInteger`:

```
>>> 1.001.isCloseToBy(1L, 1E-3)
true
```

A `Number` is not close to a `String`:

```
>>> 1.isCloseToBy('1', 1E-3)
false
```

* * *

See also: =, <~, >~, isCloseTo, isVeryCloseTo

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Categories: Comparing
