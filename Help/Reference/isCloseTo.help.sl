# isCloseTo

- _isCloseTo(aNumber, anotherNumber)_

Answer `true` if _aNumber_ is close to _anotherNumber_, else `false`.
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

_Rationale_:
The use of ~ as the operator to indicate _similar to_ is a standard mathematical notation.
However it is a little confusing in this context because in Smalltalk ~= is the binary operator for _not equal to_,
and ~~ is the binary operator for _not identical to_.

* * *

See also: ~, !~, =, <~, >~, isCloseToBy, isVeryCloseTo

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Categories: Comparing
