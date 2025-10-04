# isArray

- _isArray(x)_
- _isArray(x, r)_
- _isArray(x, r, f:/1)_

Answer `true` if the object _x_ is an array.
A `List` is an array if it is has a `shape`.
In the binary case require in addition that the array have rank _r_.
In the ternary case require in addition that the each element of the array answer `true` to the predicate _f_.

Vectors are arrays:

```
>>> [1 2 3 4 5 6].isArray
true

>>> [1 2 3 4 5 6].isArray(1)
true

>>> [1 2 3 4 5 6].isArray(1, isInteger:/1)
true
```

Matrices are arrays:

```
>>> [1 2 3; 4 5 6].isArray
true

>>> [1 2 3; 4 5 6].isArray(2)
true

>>> [1 2 3; 4 5 6].isArray(2, isInteger:/1)
true
```

Volumes, or boxes, are arrays:

```
>>> [1 2; 3 4:; 5 6; 7 8].isArray
true

>>> [1 2; 3 4:; 5 6; 7 8].isArray(3)
true

>>> [1 2; 3 4:; 5 6; 7 8]
>>> .isArray(3, isInteger:/1)
true
```

In the Apl model scalars are zero dimensional arrays.
However `isArray` is not implemented for Object.

```
>>> {
>>> 	1.isArray = nil
>>> }.hasError
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

Guides: Array Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayQ.html)

Categories: Testing, Collection
