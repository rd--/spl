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

See also: isMatrix, isRowVector, isVector

Guides: Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ColumnVector.html),
_W_
[1](https://en.wikipedia.org/wiki/Column_vector)

Categories: Testing
