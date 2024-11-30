# isCloseToBy

- _isCloseToBy(aNumber, anotherNumber, anEpsilon)_

Answer `true` if _aNumber_ is close to _anotherNumber_,
according to _anEpsilon_,
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
