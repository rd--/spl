# antidiagonalMatrix

- _antidiagonalMatrix(aList)_

Answer a matrix with the elements of _aList_ on the antidiagonal, and `zero` elsewhere.

```
>>> [1 2 3].antidiagonalMatrix
[
	0 0 1;
	0 2 0;
	3 0 0
]
```

An `exchangeMatrix` is a special case of an `antidiagonalMatrix`:

```
>>> 3.exchangeMatrix
[1 1 1].antidiagonalMatrix
```

* * *

See also: antidiagonal, diagonal, diagonalMatrix, exchangeMatrix, identityMatrix, scalingMatrix

References:
_W_
[1](https://en.wikipedia.org/wiki/Anti-diagonal_matrix)

Categories: Math, Matrix
