# isCloseTo

- _isCloseTo(n, m)_

Answer `true` if the number _n_ is close to another number _m_, else `false`.
This takes magnitude into account, so that a million is close to a million and one, but one is not close to two.
The operator form is `~`.

```
>>> 1000000 ~ 1000001
true

>>> 1 !~ 2
true
```

Operates over vectors, matrices and arrays:

```
>>> let l = [1 2 3];
>>> l.isCloseTo(l + 1E-4)
true

>>> let l = [1E5 2E5; 3E5 4E5];
>>> l.isCloseTo(l + 1)
true
```

* * *

See also: ~, !~, =, <~, >~, isCloseToBy, isVeryCloseTo, threshold

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Categories: Comparing
