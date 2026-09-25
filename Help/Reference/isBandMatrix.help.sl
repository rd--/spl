# isBandMatrix

- _isBandMatrix(m, k₁, k₂)_

Answer `true` if _m_ is a band matrix with lower bandwidth _k₁_ and upper bandwidth _k₂_.

Diagonal matrix:

```
>>> [1 0 0; 0 1 0; 0 0 1]
>>> .isBandMatrix(0, 0)

>>> [1 0 0; 0 1 0; 0 0 1]
>>> .isDiagonalMatrix
true
```

Super- and sub-diagonals:

```
>>> [1 1 0 0; 0 1 1 0; 0 0 1 1; 0 0 0 1]
>>> .isBandMatrix(0, 1)
true

>>> [1 0 0 0; 1 1 0 0; 0 1 1 0; 0 0 1 1]
>>> .isBandMatrix(1, 0)
true
```

Tridiagonal matrix:

```
>>> [1 1 0 0; 1 1 1 0; 0 1 1 1; 0 0 1 1]
>>> .isBandMatrix(1, 1)
true

>>> [1 1 0 0; 1 1 1 0; 0 1 1 1; 0 0 1 1]
>>> .isTridiagonalMatrix
true
```

Upper triangular matrix:

```
>>> [1 1 1 1; 0 1 1 1; 0 0 1 1; 0 0 0 1]
>>> .isBandMatrix(0, 4 - 1)
true

>>> [1 1 1 1; 0 1 1 1; 0 0 1 1; 0 0 0 1]
>>> .isUpperTriangularMatrix
true
```

* * *

See also: isDiagonalMatrix, isTridiagonalMatrix, isUpperTriangularMatrix

Guides: Matrix Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Band_matrix)
[2](https://en.wikipedia.org/wiki/Tridiagonal_matrix)
