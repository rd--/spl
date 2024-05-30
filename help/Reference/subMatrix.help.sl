# subMatrix

- _subMatrix(aMatrix, rows, columns)_

Answer a sub-matrix of _aMatrix_ given sequences of row and column indices.
A submatrix of a matrix is a matrix obtained by deleting any collection of rows and or columns.

A 2×2 sub-matrix of a 3×3 matrix:

```
>>> [3 3].iota.subMatrix(1:2, 2:3)
[
	2 3;
	5 6
]
```

A 2×4 sub-matrix of a 3×4 matrix,
the row and column indices need not be in order and may have repetitions:

```
>>> let m = [1 2 3 4; 5 6 7 8; 9 0 1 2];
>>> m.subMatrix([3 1], [2 3 4 3])
[
	0 1 2 1;
	2 3 4 3
]
```

A 2×3 sub-matrix of a 3×4 matrix by deleting row three and column two:

```
>>> [3 4].iota.subMatrix([1 2], [1 3 4])
[
	1 3 4;
	5 7 8
]
```

The interior 2×3 sub-matrix of a 4×5 matrix:

```
>>> [4 5].iota.subMatrix(2:3, 2:4)
[
	 7  8  9;
	12 13 14
]
```

The third column of a 5×5 matrix:

```
>>> [5 5].iota.subMatrix(1:5, 3:3)
[
	 3;
	 8;
	13;
	18;
	23
]
```

* * *

See also: Matrix

References:
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=LinearAlgebra%2FSubMatrix),
_Mathematica_
[1](https://mathworld.wolfram.com/Submatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/math/array-indexing.html)
