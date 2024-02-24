# isSmallFloat

- _isSmallFloat(anObject)_

Answers `true` if _anObject_ is a `SmallFloat`, else `false`.

```
>>> 23.isSmallFloat
true

>>> 3.141.isSmallFloat
true

>>> (2/3.isSmallFloat, 2/3.isFraction)
(false, true)

>>> (2j3.isSmallFloat, 2j3.isComplex)
(false, true)

>>> (23n.isSmallFloat, 23n.isLargeInteger)
(false, true)
```

* * *

See also: isComplex, isFraction, isLargeInteger, isNumber, SmallFloat

Categories: Testing
