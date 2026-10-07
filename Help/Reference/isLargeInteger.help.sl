# isLargeInteger

- _isLargeInteger(x)_

Answers `true` if the object _x_ is a `LargeInteger`, else `false`.
This is the type predicate for `LargeInteger`.

```
>>> 23L.isLargeInteger
true

>>> 23.isLargeInteger
false

>>> 3.141.isLargeInteger
false
```

A `List` is not a number:

```
>>> [1L 2L 3L].isLargeInteger
false

>>> [1L 2L 3L].allTrue(isLargeInteger/1)
true
```

* * *

See also: isInteger, isNumber, isSmallFloat, LargeInteger

Guides: Integer Functions, Type Predicates

Categories: Testing, Math
