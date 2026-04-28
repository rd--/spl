# isAntihermitianMatrix

- _isAntihermitianMatrix(m)_

Answer `true` if _m_ is an anti-Hermitian matrix,
also called skew-Hermitian,
else `false`.

Test if a 2×2 matrix is anti-Hermitian:

```
>>> [0J1 3J4; -3J4 0]
>>> .isAntihermitianMatrix
true

>>> [0 -2.3; 2.3 0]
>>> .isAntihermitianMatrix
true

>>> [0J-1 2J1; -2J1 0]
>>> .isAntihermitianMatrix
true
```

Test if a 3×3 matrix is anti-Hermitian:

```
>>> [0J1 1J1 0J2; -1J1 0J5 3; 0J2 -3 0]
>>> .isAntihermitianMatrix
true
```

A real anti-Hermitian matrix is also anti-symmetric:

```
>>> [0 -2.3; 2.3 0]
>>> .isAntisymmetricMatrix
true
```

Test if a complex matrix is anti-Hermitian:

```
>>> [0J1 2J-3; -2J-3 0J-1]
>>> .isAntihermitianMatrix
true
```

A complex Antihermitian matrix has symmetric real part and antisymmetric imaginary part:

```
>>> let m = [0J1 2J-3; -2J-3 0J-1];
>>> (
>>> 	m.real.isAntisymmetricMatrix,
>>> 	m.imaginary.isSymmetricMatrix
>>> )
(true, true)
```

Test if an exact matrix is anti-Hermitian:

```
>>> let m = [4 -5 2; 3 -3 -3; 5 5 5];
>>> m.isAntihermitianMatrix
false
```

Make the matrix anti-Hermitian:

```
>>> let m = [4 -5 2; 3 -3 -3; 5 5 5];
>>> ((m - m.transpose) / 2)
>>> .isAntihermitianMatrix
true
```

A random matrix is typically not anti-Hermitian:

```
>>> Sfc32(327814)
>>> .randomReal([0 5], [3 3])
>>> .isAntihermitianMatrix
false
```

* * *

See also: conjugateTranspose, isHermitianMatrix, isSymmetricMatrix, isVeryCloseTo

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AntihermitianMatrix.html)
[2](https://reference.wolfram.com/language/ref/AntihermitianMatrixQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Antihermitian_matrix)
[2](https://en.wikipedia.org/wiki/Skew-Hermitian_matrix)
