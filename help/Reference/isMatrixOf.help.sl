# isMatrixOf

_isMatrixOf(aSequence | aMatrix, aString)_

Answers _true_ if _aSequence_ is a matrix with the indicated _elementType_,
else _false_.

At `List`:

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

At `Matrix`:

```
>>> [1 2 3; 4 5 6].asMatrix.isMatrixOf('SmallFloat')
true

>>> [1 2 3; 4 5 6].asMatrix.elementType
'SmallFloat'
```

* * *

See also: elementType, isMatrix, isSequence, isVector, isVectorOf, typeOf
