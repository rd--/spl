# identityMatrix

- _identityMatrix(n)_
- _identityMatrix(n, m)_

Answers the _n x n_ identity matrix.
In the binary case answer an _n x m_ matrix with ones on the main diagonal and zeros elsewhere.

A 2×2 identity matrix:

```
>>> 2.identityMatrix
[
	1 0;
	0 1
]
```

A 3×3 identity matrix:

```
>>> 3.identityMatrix
[
	1 0 0;
	0 1 0;
	0 0 1
]
```

A 4×4 identity matrix:

```
>>> 4.identityMatrix
[
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1
]
```

A 2×3 identity matrix:

```
>>> 2.identityMatrix(3)
[
	1 0 0;
	0 1 0
]
```

A 3×2 identity matrix:

```
>>> 3.identityMatrix(2)
[
	1 0;
	0 1;
	0 0
]
```

* * *

See also: diagonalMatrix, exchangeMatrix, kroneckerDelta, unitVector, permutationMatrix, table

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IdentityMatrix.html)
[2](https://reference.wolfram.com/language/ref/IdentityMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/eye.html)

Categories: Math, Matrix
