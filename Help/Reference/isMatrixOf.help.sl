# isMatrixOf

- _isMatrixOf(aList, aString)_

Answers `true` if _aList_ is a matrix with the indicated _elementType_,
else `false`.

At `List`:

```
>>> [1 2 3; 4 5 6]
>>> .isMatrixOf('SmallFloat')
true

>>> [1/2 3/4; 5/6 7/6]
>>> .isMatrixOf('Fraction')
true

>>> [1J2 3J4; 5J6 7J6]
>>> .isMatrixOf('Complex')
true

>>> ['a' 'b'; 'c' 'd']
>>> .isMatrixOf('String')
true

>>> [1L 2L; 3L 4L]
>>> .isMatrixOf('LargeInteger')
true

>>> [1 2; 3 4:; 5 6; 7 8]
>>> .isMatrixOf('List')
true
```

* * *

See also: elementType, isMatrix, isVector, isVectorOf, typeOf

Categories: Testing, Collection
