# isSmallInteger

- _isSmallInteger(anObject)_

Answers `true` if _anObject_ is a `SmallFloat` and an integer, else `false`.

```
>>> 23.isSmallInteger
true

>>> 3.141.isSmallInteger
false
```

At `LargeInteger` and `Fraction` answers `false`:

```
>>> 23n.isSmallInteger
false

>>> 2/1.isSmallInteger
false
```

* * *

See also: isGaussianInteger, isInteger, isNumber, isSmallFloat, SmallFloat

Categories: Testing
