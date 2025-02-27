# isRowVector

- _isRowVector(aMatrix)_

A _row vector_ is a _matrix_ with a single row, ie. a _1×n_ matrix.

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

A _vector_ is not a _row vector_:

```
>>> [1 2 3].isRowVector
false
```

* * *

See also: isColumnVector, isMatrix, isVector, List, Matrix

Categories: Testing
