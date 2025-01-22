# rowReduce

- _rowReduce(aMatrix)_

Answer the row-reduced form of _aMatrix_.
`rowReduce` performs a version of Gaussian elimination,
adding multiples of rows together so as to produce zero elements when possible.
The final matrix is in reduced row echelon form.

Row reduction on square 3×3 integer matrices:

```
>>> [1 2 3; 4 5 6; 7 8 9].rowReduce
[
	1  0 -1;
	0  1  2;
	0  0  0
]

>>> [2 1 -1; -3 -1 2; -2 1 2].rowReduce
3.identityMatrix
```

The 3×3 magic square matrix is full rank, so the reduced row echelon form is an identity matrix.

```
>>> [8 1 6; 3 5 7; 4 9 2].rowReduce
3.identityMatrix
```

Use Gauss-Jordan elimination on augmented matrices to solve a linear system and calculate the matrix inverse.
These techniques are mainly of academic interest.
Create a 3*3 magic square matrix.
Add an additional column to the end of the matrix.
This augmented matrix represents a linear system _ax=b_, with the extra column corresponding to _b_.

```
>>> let a = [8 1 6; 3 5 7; 4 9 2];
>>> let b = [1 1 1];
>>> let m = [a, [b].transposed].rowConcatenation;
>>> let x = m.rowReduce.matrixColumn(4);
>>> (x, a.dot(x) ~ b)
(
	[1/15 1/15 1/15],
	true
)
```

The 4×4 magic square matrix is rank deficient, the result is not an identity matrix:

```
>>> [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1].rowReduce
[
	1  0  0  1;
	0  1  0  3;
	0  0  1 -3;
	0  0  0  0
]
```

Square 5×5 matrix:

```
>>> [
>>> 	2 0 -1  0  0;
>>> 	1 0  0 -1  0;
>>> 	3 0  0 -2 -1;
>>> 	0 1  0  0 -2;
>>> 	0 1 -1  0  0
>>> ].rowReduce
[
	1 0 0 0 -1;
	0 1 0 0 -2;
	0 0 1 0 -2;
	0 0 0 1 -1;
	0 0 0 0 0
]
```

Row reduction on rectangular integer matrices.
A 2×3 matrix:

```
>>> [1 3 -1; 0 1 7].rowReduce
[
	1  0 -22;
	0  1   7
]
```

Four 3×4 matrices:

```
>>> [2 1 -1 8; -3 -1 2 -11; -2 1 2 -3].rowReduce
[
	 1  0  0  2;
	 0  1  0  3;
	 0  0  1 -1
]

>>> [1 2 -1 -4; 2 3 -1 -11; -2 0 -3 22].rowReduce
[
	 1  0  0 -8;
	-0  1  0  1;
	 0  0  1 -2
]

>>> [1 3 1 9; 1 1 -1 1; 3 11 5 35].rowReduce
[
	 1  0 -2 -3;
	 0  1  1  4;
	 0  0  0  0
]

>>> [8 1 6 1; 3 5 7 1; 4 9 2 1].rowReduce
[
	1 0 0 1/15;
	0 1 0 1/15;
	0 0 1 1/15
]
```

Two 3×6 matrices:

```
>>> [1 2 3 1 0 0; 4 5 6 0 1 0; 7 8 9 0 0 1].rowReduce
[
	1   0   -1   0 -8/3  5/3;
	0   1    2   0  7/3 -4/3;
	0   0    0   1 -2    1
]

>>> [8 1 6 1 0 0; 3 5 7 0 1 0; 4 9 2 0 0 1].rowReduce
[
	 1 0 0  0.147222 -0.144444  0.063888;
	 0 1 0 -0.061111  0.022222  0.105555;
	 0 0 1 -0.019444  0.188888 -0.102777
]
```

A 5×6 matrix:

```
>>> [
>>> 	1  2  3  4  3  1;
>>> 	2  4  6  2  6  2;
>>> 	3  6 18  9  9 -6;
>>> 	4  8 12 10 12  4;
>>> 	5 10 24 11 15 -4
>>> ].rowReduce
[
	1  2  0  0  3  4;
	0  0  1  0  0 -1;
	0  0  0  1  0  0;
	0  0  0  0  0  0;
	0  0  0  0  0  0
]
```

The reduced form further reduces to itself:

```
>>> let p = [0 0 -1 2 0; 0 0 -1 1 1; 2 8 1 -4 2];
>>> let q = p.rowReduce;
>>> (q, q.rowReduce = q)
(
	[
		1  4  0  0  0;
		0  0  1  0 -2;
		0  0  0  1 -1
	],
	true
)
```

Find the row reduction of a real-valued square matrix:

```
>>> [1.5 4.75 -3.2; -1.7 6.7 -9.3; 4.9 -8.65 15.4].rowReduce
[1 0 1.25434; 0 1 -1.06979; 0 0 0]
```

Find the row reduction of a real-valued rectangular matrix:

```
>>> [1.2 3.4; 5.6 7.8; 9.10 11.12].rowReduce
[1 0; 0 1; 0 0]
```

Does not alter an identity matrix:

```
>>> let m = 5.identityMatrix;
>>> m.rowReduce
m
```

A square matrix is invertible if `rowReduce` answers the identity matrix:

```
>>> [1 0 4; 2 0 3; 2 1 2].rowReduce
3.identityMatrix
```

Indeed, the inverse can be found using `rowReduce`:

```
>>> let m = [1 0 4; 2 0 3; 2 1 2];
>>> let i = 3.identityMatrix;
>>> (m ++.each i).rowReduce.collect { :each |
>>> 	each.drop(3)
>>> }
[-3/5 4/5 0; 2/5 -6/5 1; 2/5 -1/5 0]
```

Compute the rank of a matrix using `rowReduce`,
the rank is the number of non-zero rows in the reduced matrix,
in this case two:

```
>>> [
>>> 	+1 +2 +1;
>>> 	-2 -3 +1;
>>> 	+3 +5 +0
>>> ].rowReduce
[
	1  0 -5;
	0  1  3;
	0  0  0
]
```

* * *

See also: determinant, inverse, permanent, reducedRowEchelonForm

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianElimination.html)
[2](https://reference.wolfram.com/language/ref/RowReduce.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rref.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_elimination)
[2](https://en.wikipedia.org/wiki/Row_echelon_form)

Categories: Math, Matrix
