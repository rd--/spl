# isLowerTriangularMatrix

- _isLowerTriangularMatrix(aMatrix)_

Answer `true` if _aMatrix_ is lower triangular, else `false`.

A lower triangular matrix:

```
>>> [
>>> 	1 0 0;
>>> 	2 3 0;
>>> 	4 5 6
>>> ].isLowerTriangularMatrix
true
```

Test if a matrix is lower triangular starting from the first superdiagonal:

```
>>> [
>>> 	1 2 0;
>>> 	3 4 5;
>>> 	6 7 8
>>> ].isLowerTriangularMatrix(1)
true

>>> [
>>> 	1 2 0 0;
>>> 	3 4 5 0;
>>> 	6 7 8 9;
>>> 	1 2 3 4
>>> ].isLowerTriangularMatrix(1)
true
```

Test if a matrix is lower triangular starting from the first subdiagonal:

```
>>> [
>>> 	0 0 0;
>>> 	1 0 0;
>>> 	2 3 0
>>> ].isLowerTriangularMatrix(-1)
true

>>> [
>>> 	0 0 0 0;
>>> 	1 0 0 0;
>>> 	2 3 0 0;
>>> 	4 5 6 0
>>> ].isLowerTriangularMatrix(-1)
true
```

Test rectangular matrices:

```
>>> [1 0 0; 2 3 0].isLowerTriangularMatrix
true

>>> [1 0; 2 3; 4 5].isLowerTriangularMatrix
true
```

The Hermite normal form is lower triangular:

```
>>> let a = [2 5 8; 3 6 3; 6 1 1; 2 6 1];
>>> let u = [9 5 11; -5 -2 -6; 1 0 1];
>>> let h = a.dot(u);
>>> (h.isLowerTriangularMatrix, h)
(true, [1 0 0;0 3 0;50 28 61;-11 -2 -13])
```

* * *

See also: isMatrix, isSquareMatrix, isUpperTriangularMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularMatrix.html)
[2](https://mathworld.wolfram.com/LowerTriangularMatrix.html)
[3](https://reference.wolfram.com/language/ref/LowerTriangularMatrixQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_matrix)
