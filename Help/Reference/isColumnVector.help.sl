# isColumnVector

- _isColumnVector(m)_

Answer `true` if the matrix _m_ is a column vector.
A column vector is a matrix with a single column, ie. an _n×1_ matrix.

At `List`:

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

Guides: Predicate Functions

Categories: Testing
