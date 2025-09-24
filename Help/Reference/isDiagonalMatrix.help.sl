# isDiagonalMatrix

- _isDiagonalMatrix(m)_

Answer `true` if the matrix _m_ is a diagonal matrix.

At three 3×3 matrices:

```
>>> 3.identityMatrix
>>> .isDiagonalMatrix
true

>>> [1 5 9].diagonalMatrix
>>> .isDiagonalMatrix
true

>>> [3 3].iota
>>> .isDiagonalMatrix
false
```

At superdiagonal matrix:

```
>>> [0 1 0; 0 0 2; 0 0 0]
>>> .isDiagonalMatrix(1)
true

>>> [0 0 1; 0 0 0; 0 0 0]
>>> .isDiagonalMatrix(2)
true
```

At subdiagonal matrices:

```
>>> [0 0 0; 1 0 0; 0 2 0]
>>> .isDiagonalMatrix(-1)
true

>>> [0 0 0; 0 0 0; 1 0 0]
>>> .isDiagonalMatrix(-2)
true
```

At rectangular diagonal matrices:

```
>>> [1 0 0; 0 2 0]
>>> .isDiagonalMatrix
true

>>> [1 0; 0 2; 0 0]
>>> .isDiagonalMatrix
true
```

A random matrix is typically non-diagonal:

```
>>> Sfc32(671841)
>>> .randomReal([0 5], [3 3])
>>> .isDiagonalMatrix
false
```

* * *

See also: diagonalMatrix, identityMatrix, isMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiagonalMatrixQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Diagonal_matrix)
