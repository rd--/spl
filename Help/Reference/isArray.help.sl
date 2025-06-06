# isArray

- _isArray(e)_
- _isArray(e, r)_

A `List` is an _array_ if it is has a `shape`.
In the binary case require in addition that the array have `rank` _r_.

Vectors are arrays:

```
>>> [1 2 3 4 5 6].isArray
true

>>> [1 2 3 4 5 6].isArray(1)
true
```

Matrices are arrays:

```
>>> [1 2 3; 4 5 6].isArray
true

>>> [1 2 3; 4 5 6].isArray(2)
true
```

Volumes, or boxes, are arrays:

```
>>> [1 2; 3 4:; 5 6; 7 8].isArray
true

>>> [1 2; 3 4:; 5 6; 7 8].isArray(3)
true
```

In the Apl model scalars are zero dimensional arrays.
However `isArray` is not implemented for Object.

```
>>> { 1.isArray = nil }.ifError { true }
true
```

A vector in which one element is itself a list is not a full array:

```
>>> [1, 2, [3], 4].isArray
false
```

A ragged collection of nested lists is not a full array:

```
>>> [1 2; 3].isArray
false

>>> [1 2; 3 4].isArray
true
```

* * *

See also: elementType, isMatrix, isVector, rank, shape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayQ.html)

Categories: Testing, Collection
