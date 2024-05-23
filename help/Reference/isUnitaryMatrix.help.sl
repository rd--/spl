# isUnitaryMatrix

- _isUnitaryMatrix(aMatrix)_

Answer `true` if _aMatrix_ is a unitary matrix, else `false`.

Test if a 2×2 numerical matrix is unitary:

```
>>> let m = (1 / 2.sqrt) * [1 1.i; 1.i 1];
>>> m.isUnitaryMatrix
true
```

Test if a real matrix is unitary:

```
>>> let m = (1 / 5.sqrt) * [1 2; -2 1];
>>> m.isUnitaryMatrix
true
```

Test if a diagonal matrix is unitary:

```
>>> let m = (-1.i # 5).diagonalMatrix;
>>> m.isUnitaryMatrix
true
```

The identity matrix is unitary:

```
>>> 3.identityMatrix.isUnitaryMatrix
true
```

Test if a rectangular matrix is semi-unitary.
If there are more columns than rows, this indicates that the rows are orthonormal:

```
>>> let m = [1 1 1 -1; -1.i 1.i 1.i 1.i] / 2;
>>> (m.isUnitaryMatrix, m.dot(conjugateTranspose(m)))
(true, [1 0; 0 1])
```

* * *

See also: conjugateTranspose, isSymmetricMatrix, normalize

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitaryMatrix.html)
[2](https://reference.wolfram.com/language/ref/UnitaryMatrixQ.html)
