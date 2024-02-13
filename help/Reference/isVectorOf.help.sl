# isVectorOf

_isVectorOf(aSequence, aString)_

Answers _true_ if _aSequence_ is a vector with the indicated _elementType_,
else _false_.

```
>>> [1 2 3 4 5 6].isVectorOf('SmallFloat')
true

>>> [1/2 3/4 5/6 7/6].isVectorOf('Fraction')
true

>>> [1j2 3j4 5j6 7j6].isVectorOf('Complex')
true

>>> ['a' 'b' 'c' 'd'].isVectorOf('String')
true

>>> [1n 2n 3n 4n].isVectorOf('LargeInteger')
true
```

* * *

See also: elementType, isMatrix, isSequence, isVector, typeOf
