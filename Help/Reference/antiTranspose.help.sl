# antiTranspose

- _antiTranspose(m)_

Answer the anti-transposition of the matrix _m_.

A 3×3 matrix:

```
>>> [3 3].iota
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

Transpose, reflected across the diagonal:

```
>>> [3 3].iota.transpose
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

Anti-transpose, reflected across the antidiagonal:

```
>>> [3 3].iota.antiTranspose
[
	9 6 3;
	8 5 2;
	7 4 1
]
```

Anti-transpose of a diagonal matrix:

```
>>> [1 .. 5].diagonalMatrix
>>> .antiTranspose
[
	5 0 0 0 0;
	0 4 0 0 0;
	0 0 3 0 0;
	0 0 0 2 0;
	0 0 0 0 1
]
```

The anti-transpose of an antidiagonal matrix is the identity:

```
>>> let m = [1 2 3].antidiagonalMatrix;
>>> m.antiTranspose = m
true
```

The anti-transpose of a Hankel matrix:

```
>>> 3.hankelMatrix.antiTranspose
[
	0 0 3;
	0 3 2;
	3 2 1
]
```

* * *

See also: transpose

Guides: Matrix Functions

References:
_Factor_
[1](https://docs.factorcode.org/content/word-anti-transpose%2Cmath.matrices.html)
