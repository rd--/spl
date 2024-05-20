# isNonNegative

- _isNonNegative(aNumber)_

Answers `true` if _aNumber_ is greater than or equal to zero.

```
>>> [-1 0 1].collect(isNonNegative:/1)
[false true true]
```

Note that negative zero is not negative according to `isNonNegative`, see instead `isNegativeZero`:

```
>>> -0.isNonNegative
true
```

* * *

See also: >=, isNegative, isNegativeZero, isPositive, isZero, zero

References:
_Smalltalk_
5.6.2.24

Categories: Testing
