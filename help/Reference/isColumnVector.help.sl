# isColumnVector

- _isColumnVector(aSequence | aMatrix)_

A _column vector_ is a _matrix_ with a single column, ie. an _n×1_ matrix.

At `List`:

```
>>> [1; 2; 3].isColumnVector
true
```

At `Matrix`:

```
>>> [1; 2; 3].asMatrix.isColumnVector
true
```

A _vector_ is not a _column vector_:

```
>>> [1 2 3].isColumnVector
false
```

* * *

See also: isRowVector, isMatrix, isVector

Categories: Testing
