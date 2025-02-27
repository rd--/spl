# isMatrixOf

- _isMatrixOf(aSequence | aMatrix, aString)_

Answers _true_ if _aSequence_ is a matrix with the indicated _elementType_,
else _false_.

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
```

* * *

See also: elementType, isMatrix, isSequence, isVector, isVectorOf, typeOf

Categories: Testing, Collection
