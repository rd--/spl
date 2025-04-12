# submatrix

- _submatrix(m, r, c)_

Answer a sub-matrix of a matrix _m_ given sequences of row indices _r_ and column indices _c_.
A submatrix of a matrix is a matrix obtained by retaining any specified collection of rows and or columns.

A 2×2 block sub-matrix of a 3×3 matrix:

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

Two submatrices of a 4×6 matrix obtained by deleting the first row and first column,
and by deleting the second and third rows and the sixth column:

```
>>> let a = [
>>> 	1 5 0 1 8 2;
>>> 	6 8 4 9 3 3;
>>> 	1 3 7 7 8 1;
>>> 	3 9 2 9 3 7
>>> ];
>>> (
>>> 	a.submatrix(2:4,2:6),
>>> 	a.submatrix([1 4], 1:5)
>>> )
(
	[
		8 4 9 3 3;
		3 7 7 8 1;
		9 2 9 3 7
	],
	[
		1 5 0 1 8;
		3 9 2 9 3
	]
)
```

_Note:_
For the answer to be a proper submatrix _r_ and _c_ should specify each row and column at most once.
For the answer to be a block submatrix _r_ and _c_ should contain only proper substrings of the row and column indices.

* * *

See also: at, atAll, Matrix, part, subarray

References:
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=LinearAlgebra%2FSubMatrix),
_Mathematica_
[1](https://mathworld.wolfram.com/Submatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/math/array-indexing.html)
