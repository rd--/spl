# isArray

_isArray(aSequence)_

A Sequence is an _array_ if it is has a _shape_.

Vectors are arrays:

```
>>> [1 2 3 4 5 6].isArray
true
```

Matrices are arrays:

```
>>> [1 2 3; 4 5 6].isArray
true
```

Volumes are arrays:

```
>>> [1 2; 3 4;; 5 6; 7 8].isArray
true
```

In the Apl model scalars are zero dimensional arrays.
However isArray is not implemented for Object.

```
>>> { 1.isArray = nil }.ifError { true }
true
```

A vector in which one element is itself a list is not a full array:

```
>>> [1 2 [3] 4].isArray
false
```

A ragged collection of nested lists is not a full array:

```
>>> [[1 2] [3]].isArray
false

>>> [[1 2] [3 4]].isArray
true
```

* * *

See also: isMatrix, isSequence, isVector, rank, shape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayQ.html)
