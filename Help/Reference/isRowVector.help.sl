# isRowVector

- _isRowVector(m)_

Answer `true` if the matrix _m_ is a row vector.
A row vector is a matrix with a single row, ie. a _1×n_ matrix.

At `List`:

```
>>> [[1 2 3]].isRowVector
true
```

A 1×4 matrix is a row vector:

```
>>> let m = [[1 2 3 4]];
>>> (m.shape, m.isRowVector)
([1 4], true)
```

A vector is not a row vector:

```
>>> [1 2 3].isRowVector
false
```

* * *

See also: isColumnVector, isMatrix, isVector, List, Matrix

Guides: Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RowVector.html),
_W_
[1](https://en.wikipedia.org/wiki/Row_vector)

Categories: Testing
