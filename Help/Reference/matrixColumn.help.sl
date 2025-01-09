# matrixColumn

- _matrixColumn(aMatrix, n)_

Answer the _n_-th column of _aMatrix_ as a vector.

The second column of a 3×3 matrix:

```
>>> [3 3].iota.matrixColumn(2)
[2 5 8]
```

C.f. `matrixColumns` to answer a column vector:

```
>>> [3 3].iota.matrixColumns(2:2)
[2; 5; 8]
```

C.f. `submatrix` to answer a column vector:

```
>>> [3 3].iota.submatrix(1:3, 2:2)
[2; 5; 8]
```

C.f. `transposed` to answer all columns as rows:

```
>>> [3 3].iota.transposed
[1 4 7; 2 5 8; 3 6 9]
```

It is an error if the column is out of bounds:

```
>>> {
>>> 	[5 5].iota.matrixColumn(9)
>>> }.ifError { true }
true
```

* * *

See also: at, List, matrixColumns, matrixRow, Matrix, submatrix, transposed
