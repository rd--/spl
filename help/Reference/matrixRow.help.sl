# matrixRow

- _matrixRow(aMatrix, n)_

Answer the _n_-th row of _aMatrix_ as a vector.

The second row of a 3×3 matrix:

```
>>> [3 3].iota.matrixRow(2)
[4 5 6]
```

C.f. `subMatrix` to answer a one row matrix:

```
>>> [3 3].iota.subMatrix(2:2, 1:3)
[[4 5 6]]
```

C.f. `at`, which does not require the input be a matrix:

```
>>> [3 3].iota[2]
[4 5 6]
```

* * *

See also: at, matrixColumn, subMatrix
