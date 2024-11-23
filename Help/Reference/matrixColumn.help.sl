# matrixColumn

- _matrixColumn(aMatrix, n)_

Answer the _n_-th column of _aMatrix_ as a vector.

The second column of a 3×3 matrix:

```
>>> [3 3].iota.matrixColumn(2)
[2 5 8]
```

C.f. `submatrix` to answer a column vector:

```
>>> [3 3].iota.submatrix(1:3, 2:2)
[2; 5; 8]
```

C.f. `transposed` to answer all columns:

```
>>> [3 3].iota.transposed
[1 4 7; 2 5 8; 3 6 9]
```

* * *

See also: at, matrixRow, submatrix, transposed
