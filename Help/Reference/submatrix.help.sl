# submatrix

- _submatrix(aMatrix, rows, columns)_

Answer a sub-matrix of _aMatrix_ given sequences of row and column indices.
A submatrix of a matrix is a matrix obtained by retaining any specified collection of rows and or columns.

A 2×2 sub-matrix of a 3×3 matrix:

```
>>> [3 3].iota.submatrix(1:2, 2:3)
[
	2 3;
	5 6
]

>>> [3 3].iota.subarray([1:2, 2:3])
[2 3; 5 6]
```

A 2×4 sub-matrix of a 3×4 matrix,
the row and column indices need not be in order and may have repetitions:

```
>>> let m = [1 2 3 4; 5 6 7 8; 9 0 1 2];
>>> m.submatrix([3 1], [2 3 4 3])
[
	0 1 2 1;
	2 3 4 3
]

>>> let m = [1 2 3 4; 5 6 7 8; 9 0 1 2];
>>> m.subarray([3 1; 2 3 4 3])
[0 1 2 1; 2 3 4 3]
```

A 2×3 sub-matrix of a 3×4 matrix by deleting row three and column two:

```
>>> [3 4].iota.submatrix([1 2], [1 3 4])
[
	1 3 4;
	5 7 8
]

>>> [3 4].iota.subarray([1 2; 1 3 4])
[1 3 4; 5 7 8]
```

The interior 2×3 sub-matrix of a 4×5 matrix:

```
>>> [4 5].iota.submatrix(2:3, 2:4)
[
	 7  8  9;
	12 13 14
]

>>> [4 5].iota.subarray([2:3, 2:4])
[7 8 9; 12 13 14]
```

The third column of a 5×5 matrix:

```
>>> [5 5].iota.submatrix(1:5, 3:3)
[
	 3;
	 8;
	13;
	18;
	23
]

>>> [5 5].iota.subarray([1:5, 3:3])
[3; 8; 13; 18; 23]
```

The middle two columns of a 4×4 matrix:

```
>>> [4 4].iota.submatrix(1:4, 2:3)
[
	 2  3;
	 6  7;
	10 11;
	14 15
]

>>> [4 4].iota.subarray([1:4, 2:3])
[2 3; 6 7; 10 11; 14 15]
```

A 1×1 sub-matrix of a 3×3 matrix:

```
>>> [3 3].iota.submatrix([2], [2])
[
	[
		5
	]
]

>>> [3 3].iota.subarray([2; 2])
[[5]]
```

* * *

See also: at, atAll, Matrix, subarray

References:
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=LinearAlgebra%2FSubMatrix),
_Mathematica_
[1](https://mathworld.wolfram.com/Submatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/math/array-indexing.html)
