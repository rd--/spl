 matrixRows

- _matrixRows(m, c)_

Answer the rows of the matrix _m_ specified in the list _r_ as a matrix.

The first and last row of a 3×3 matrix:

```
>>> [3 3].iota.matrixRows([1 3])
[
	1 2 3;
	7 8 9
]
```

The middle row:

```
>>> [3 3].iota.matrixRows([2])
[
	[4 5 6]
]
```

* * *

See also: at, List, matrixColumn, matrixRow, Matrix, submatrix, transposed

Guides: Matrix Functions
