# isNonNegative

- _isNonNegative(x)_

Answers `true` if the number _x_ is greater than or equal to `zero`.

Threads over lists:

```
>>> [-1 0 1].isNonNegative
[false true true]
```

Note that negative zero is not negative according to `isNonNegative`, see instead `isNegativeZero`:

```
>>> -0.isNonNegative
true
```

* * *

See also: >=, isNegative, isNegativeZero, isPositive, isZero, zero

Guides: Predicate Functions

References:
_Smalltalk_
5.6.2.24

Categories: Testing, Math
