# isSmallFloat

- _isSmallFloat(anObject)_

Answers `true` if _anObject_ is a `SmallFloat`, else `false`.

Floating point literal:

```
>>> 3.141.isSmallFloat
true
```

Integer literals define `SmallFloat` values:

```
>>> 23.isSmallFloat
true
```

Fraction literals:

```
>>> (2/3.isSmallFloat, 2/3.isFraction)
(false, true)
```

Complex literals:

```
>>> (2J3.isSmallFloat, 2J3.isComplex)
(false, true)
```

Large integer literals:

```
>>> (23n.isSmallFloat, 23n.isLargeInteger)
(false, true)
```

* * *

See also: isComplex, isFraction, isLargeInteger, isNumber, SmallFloat

Categories: Testing, Math
