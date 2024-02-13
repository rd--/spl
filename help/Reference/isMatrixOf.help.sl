# isMatrixOf

_isMatrixOf(aSequence, aString)_

Answers _true_ if _aSequence_ is a matrix with the indicated _elementType_,
else _false_.

```
>>> [1 2 3; 4 5 6].isMatrixOf('SmallFloat')
true

>>> [1/2 3/4; 5/6 7/6].isMatrixOf('Fraction')
true

>>> [1j2 3j4; 5j6 7j6].isMatrixOf('Complex')
true

>>> ['a' 'b'; 'c' 'd'].isMatrixOf('String')
true

>>> [1n 2n; 3n 4n].isMatrixOf('LargeInteger')
true
```

* * *

See also: elementType, isMatrix, isSequence, isVector, isVectorOf, typeOf
