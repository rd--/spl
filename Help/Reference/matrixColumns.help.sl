# matrixColumns

- _matrixColumns(m, c)_

Answer the columns of the matrix _m_ specified in the list _c_ as a matrix.

The first and last column of a 3×3 matrix:

```
>>> [3 3].iota.matrixColumns([1 3])
[
	1 3;
	4 6;
	7 9
]
```

The middle column, i.e. a column vector:

```
>>> [3 3].iota.matrixColumns([2])
[
	2;
	5;
	8
]
```

* * *

See also: at, List, matrixColumn, matrixRow, Matrix, submatrix, transposed

Guides: Matrix Functions
