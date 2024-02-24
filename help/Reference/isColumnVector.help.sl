# isColumnVector

- _isColumnVector(aMatrix)_

A _column vector_ is a _matrix_ with a single column, ie. a _n×1_ matrix:

```
>>> [1; 2; 3].isColumnVector
true
```

A _vector_ is not a _column vector_:

```
>>> [1 2 3].isColumnVector
false
```

* * *

See also: isRowVector, isMatrix, isVector

Category: Testing

