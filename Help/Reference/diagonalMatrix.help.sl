# diagonalMatrix

- _diagonalMatrix(aList, k, n)_

Answer a matrix with the elements of _aList_ on the leading `diagonal`, and `zero` elsewhere.
In the binary case answer super- or sub-diagonal matrices.

A 3×3 diagonal matrix:

```
>>> [1 2 3].diagonalMatrix
[
	1 0 0;
	0 2 0;
	0 0 3
]
```

A 3×3 superdiagonal matrix:

```
>>> [1 2].diagonalMatrix(1)
[
	0 1 0;
	0 0 2;
	0 0 0
]
```

A 3×3 subdiagonal matrix:

```
>>> [1 2].diagonalMatrix(-1)
[
	0 0 0;
	1 0 0;
	0 2 0
]
```

Pad with zeros to make a larger square matrix:

```
>>> [1 2 3].diagonalMatrix(0, [5 5])
[
	1 0 0 0 0;
	0 2 0 0 0;
	0 0 3 0 0;
	0 0 0 0 0;
	0 0 0 0 0
]
```

Rectangular diagonal matrices:

```
>>> [1 2 3].diagonalMatrix(0, [3 5])
[
	1 0 0 0 0;
	0 2 0 0 0;
	0 0 3 0 0
]

>>> [1 2 3].diagonalMatrix(0, [5 3])
[
	1 0 0;
	0 2 0;
	0 0 3;
	0 0 0;
	0 0 0
]
```

A 5×5 diagonal matrix:

```
>>> [2 1 -1 -2 -5].diagonalMatrix
[
	2  0  0  0  0;
	0  1  0  0  0;
	0  0 -1  0  0;
	0  0  0 -2  0;
	0  0  0  0 -5
]
```

A 6×6 superdiagonal matrix:

```
>>> [2 1 -1 -2 -5].diagonalMatrix(1)
[
	0  2  0  0  0  0;
	0  0  1  0  0  0;
	0  0  0 -1  0  0;
	0  0  0  0 -2  0;
	0  0  0  0  0 -5;
	0  0  0  0  0  0
]
```

An `identityMatrix` is a special case of a `diagonalMatrix`:

```
>>> 3.identityMatrix
[1 1 1].diagonalMatrix
```

* * *

See also: antidiagonalMatrix, exchangeMatrix, identityMatrix, scalingMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiagonalMatrix.html)
[2](https://reference.wolfram.com/language/ref/DiagonalMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/diag.html)

Categories: Math, Matrix
