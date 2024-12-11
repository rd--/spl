# isUpperTriangularMatrix

- _isUpperTriangularMatrix(aMatrix)_

Answer `true` if _aMatrix_ is upper triangular, else `false`.

An upper triangular matrix:

```
>>> [
>>> 	1 2 3;
>>> 	0 4 5;
>>> 	0 0 6
>>> ].isUpperTriangularMatrix
true
```

Test if a matrix is upper triangular starting from the first superdiagonal:

```
>>> [
>>> 	0 1 2;
>>> 	0 0 3;
>>> 	0 0 0
>>> ].isUpperTriangularMatrix(1)
true

>>> [
>>> 	0 1 2 3;
>>> 	0 0 4 5;
>>> 	0 0 0 6;
>>> 	0 0 0 0
>>> ].isUpperTriangularMatrix(1)
true
```

Test if a matrix is upper triangular starting from the first subdiagonal:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	0 7 8
>>> ].isUpperTriangularMatrix(-1)
true
```

Test rectangular matrices:

```
>>> [1 2 3; 0 4 5]
>>> .isUpperTriangularMatrix
true

>>> [1 2; 0 3; 0 0]
>>> .isUpperTriangularMatrix
true
```

* * *

See also: isLowerTriangularMatrix, isMatrix, isSquareMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularMatrix.html)
[2](https://mathworld.wolfram.com/UpperTriangularMatrix.html)
[3](https://reference.wolfram.com/language/ref/UpperTriangularMatrixQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_matrix)

Categories: Testing, Collection
