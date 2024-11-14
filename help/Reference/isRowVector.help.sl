# isRowVector

- _isRowVector(aSequence | aMatrix)_

A _row vector_ is a _matrix_ with a single row, ie. a _1×n_ matrix.

At `List`:

```
>>> [[1 2 3]].isRowVector
true
```

At `Matrix`:

```
>>> [[1 2 3]].asMatrix.isRowVector
true
```

A _vector_ is not a _row vector_:

```
>>> [1 2 3].isRowVector
false
```

* * *

See also: isColumnVector, isMatrix, isVector, List, Matrix

Categories: Testing
