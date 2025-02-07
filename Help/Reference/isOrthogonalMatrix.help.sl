# isOrthogonalMatrix

- _isOrthogonalMatrix(aMatrix)_

Answer `true` if _aMatrix_ is orthogonal, else `false`.

Test if a 2×2 matrix is orthogonal:

```
>>> ([1 -1; 1 1] / 2.sqrt).isOrthogonalMatrix
true
```

Test if a 3×3 symbolic matrix is orthogonal:

```
>>> let a = 1/3.pi;
>>> let m = [
>>> 	[1, 0, 0],
>>> 	[0, a.cos, a.sin.-],
>>> 	[0, a.sin, a.cos]
>>> ];
>>> m.isOrthogonalMatrix
true
```

A real orthogonal matrix is also unitary:

```
>>> let m = ([1 2; -2 1] / 5.sqrt);
>>> (m.isOrthogonalMatrix, m.isUnitaryMatrix)
(true, true)
```

Test if an integer matrix is orthogonal:

```
>>> [4 -5 2; 3 -3 -3; 5 5 5].isOrthogonalMatrix
false
```

The identity matrix is orthogonal:

```
>>> 9.identityMatrix.isOrthogonalMatrix
true
```

Test if a rectangular matrix is semi-orthogonal:

```
>>> let m = 1/2 * [1 1 1 -1; -1 1 1 1];
>>> m.isOrthogonalMatrix
true
```

Rotation matrices are orthogonal:

```
>>> 1/7.pi.rotationMatrix.isOrthogonalMatrix
true

>>> (1.pi / [3 5 7]).eulerMatrix.isOrthogonalMatrix
true
```

* * *

See also: isUnitaryMatrix, isSymmetricMatrix, normalize, transpose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/OrthogonalMatrixQ.html)

Categories: Testing, Matrix
