# Octave Perspective

## Arithmetic Operators

Matrix multiplication is spelled `dot` in Spl and _mtimes_ or _*_ in Octave,
likewise for `power` and `matrixPower`:

```
>>> [[1 3 -5]].dot([4; -2; -1])
[[3]]

>>> [1 3 -5].dot([4; -2; -1])
[3]

>>> [1 3 -5].dot([4 -2 -1])
3
```

Elementwise multiplication is spelled `times` or `*` in Spl and _times_ or _.*_ in Octave:

```
>>> [1 2 3] * [4 5 6]
[4 10 18]

>>> [1 2; 3 4] * [5 6; 7 8]
[5 12; 21 32]
```

## Broadcasting

A 3×3 matrix plus a 1×3 row vector:

```
>>> let x = [1 2 3; 4 5 6; 7 8 9];
>>> let y = [10 20 30].rowVector;
>>> x + y
[
	11   22   33;
	14   25   36;
	17   28   39
]
```

Pairwise differences of a 1×3 row vector and a 3×1 column vector:

```
>>> let y = [10 20 30];
>>> y.rowVector - y.columnVector
[0 10 20; -10 0 10; -20 -10 0]

>>> [[10 20 30]] - [10; 20; 30]
[0 10 20; -10 0 10; -20 -10 0]
```

## Matrix Operations in Octave

Multiplication by a scalar,
matrix addition & subtraction,
matrix multiplication,
dot product,
and
matrix transposition:

```
>>> let a = [2 1; 3 2; -2 2];
>>> let b = [1 1; 4 2; -2 1];
>>> let c = [2 1 3; -2 2 1];
>>> let d = [2 1 3];
>>> (
>>> 	3 * a,
>>> 	a + b,
>>> 	a - b,
>>> 	c * a,
>>> 	c.dot(a),
>>> 	a.dot(c),
>>> 	d * a,
>>> 	d.dot(a),
>>> 	a.transpose
>>> )
(
	[6 3; 9 6; -6 6],
	[3 2; 7 4; -4 3],
	[1 0; -1 0; 0 1],
	[4 1 6; -6 4 3; -4 2 -6],
	[1 10; 0 4],
	[2 4 7; 2 7 11; -8 2 -4],
	[4 2; 3 2; -6 6],
	[1 10],
	[2 3 -2; 1 2 2]
)
```

## Common Vectors and Matrices

Unit vector & matrix:

```
>>> [3 1].ones
[1; 1; 1]

>>> [3 2].ones
[1 1; 1 1; 1 1]
```

Diagonal matrix:

```
>>> let m = [2 1 4; 3 2 2; -2 2 3];
>>> let d = m.diagonal;
>>> (d.columnVector, d.diagonalMatrix)
([2; 2; 3], [2 0 0; 0 2 0; 0 0 3])
```

Identity matrix:

```
>>> 3.identityMatrix
[1 0 0; 0 1 0; 0 0 1]
```

Symmetric matrix:

```
>>> [2 1 5; 1 3 4; 5 4 -2]
>>> .isSymmetricMatrix
true
```

Inverse matrix:

```
>>> let m = [4 2 2; 4 6 8; -2 2 4];
>>> let i = m.inverseMatrix;
>>> (i, m.dot(i), i.dot(m))
(
	[1 -0.5 0.5; -4 2.5 -3; 2.5 -1.5 2],
	[1 0 0; 0 1 0; 0 0 1],
	[1 0 0; 0 1 0; 0 0 1]
)
```

Determinant:

```
>>> let m = [2 1 6; 1 3 4; 6 4 -2];
>>> (m.inverseMatrix, m.determinant)
(
	[
		+0.215686  -0.254902  +0.137255;
		-0.254902  +0.392157  +0.019608;
		+0.137255  +0.019608  -0.049020
	],
	-102
)
```

* * *

References:
_Octave_
[1](https://docs.octave.org/v11.1.0/Broadcasting.html),
_P.B. Ender_
[1](http://www.philender.com/courses/multivariate/notes/matoctave.html)
