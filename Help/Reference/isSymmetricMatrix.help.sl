# isSymmetricMatrix

- _isSymmetricMatrix(m)_

Answer `true` if the matrix _m_ is symmetric, else `false`.

Test if a 2×2 numeric matrix is symmetric:

```
>>> [
>>> 	1 2;
>>> 	2 3
>>> ].isSymmetricMatrix
true

>>> [
>>> 	1   2.3;
>>> 	2.3 3
>>> ].isSymmetricMatrix
true
```

Test if a 3×3 matrix is symmetric:

```
>>> [
>>> 	1 7 3;
>>> 	7 4 5;
>>> 	3 5 2
>>> ].isSymmetricMatrix
true

>>> [
>>> 	1 2 3;
>>> 	2 4 5;
>>> 	3 5 6
>>> ].isSymmetricMatrix
true

>>> let a = [
>>> 	4 -5  2;
>>> 	3 -3 -3;
>>> 	5  5  5
>>> ];
>>> let b = (a + a.transpose) / 2;
>>> (
>>> 	a.isSymmetricMatrix,
>>> 	b.isSymmetricMatrix
>>> )
(false, true)
```

* * *

See also: isMatrix, isSquareMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SymmetricMatrix.html),
[2](https://reference.wolfram.com/language/ref/SymmetricMatrixQ.html)
_W_
[1](https://en.wikipedia.org/wiki/Symmetric_matrix)

Categories: Testing, Matrix
