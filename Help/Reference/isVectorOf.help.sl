# isVectorOf

- _isVectorOf(v, k)_

Answers `true` if the list _v_ is a vector with the indicated element type _k_,
else `false`.

```
>>> [1 2 3 4].isVectorOf('SmallFloat')
true

>>> [1/2 3/4 5/6].isVectorOf('Fraction')
true

>>> [1J2 3J4 5J6].isVectorOf('Complex')
true

>>> ['a' 'b' 'c'].isVectorOf('String')
true

>>> [1L 2L].isVectorOf('LargeInteger')
true
```

At `Range`:

```
>>> 1:9.isVectorOf('SmallFloat')
true
```

* * *

See also: elementType, isMatrix, isVector, typeOf

Guides: Vector Functions

Categories: Testing
