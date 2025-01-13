# isVectorOf

- _isVectorOf(aSequence, elementType)_

Answers `true` if _aSequence_ is a vector with the indicated _elementType_,
else `false`.

```
>>> [1 2 3 4].isVectorOf('SmallFloat')
true

>>> [1/2 3/4 5/6].isVectorOf('Fraction')
true

>>> [1j2 3j4 5j6].isVectorOf('Complex')
true

>>> ['a' 'b' 'c'].isVectorOf('String')
true

>>> [1n 2n].isVectorOf('LargeInteger')
true
```

* * *

See also: elementType, isMatrix, isSequence, isVector, typeOf

Categories: Testing
