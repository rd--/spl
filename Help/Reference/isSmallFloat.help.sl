# isFloat

- _isFloat(x)_

Answers `true` if the object _x_ is a `Float`, else `false`.

Floating point literal:

```
>>> 3.141.isFloat
true
```

Integer literals define `Float` values:

```
>>> 23.isFloat
true
```

Fraction literals:

```
>>> (2/3.isFloat, 2/3.isFraction)
(false, true)
```

Complex literals:

```
>>> (2J3.isFloat, 2J3.isComplex)
(false, true)
```

Large integer literals:

```
>>> (23L.isFloat, 23L.isInteger)
(false, true)
```

A `List` is not a number:

```
>>> [1 2 3].isFloat
false

>>> [1 2 3].allTrue(isFloat/1)
true
```

* * *

See also: Float, isComplex, isFraction, isInteger, isNumber

Guides: Floating Point Functions, Predicate Functions
