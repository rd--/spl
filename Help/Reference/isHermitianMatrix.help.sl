# isHermitianMatrix

- _isHermitianMatrix(m)_

Answer `true` if _m_ is a Hermitian matrix, else `false`.
A matrix m is Hermitian if _m_ is equal to the `conjugateTranspose` of _m_.

Test if a 2×2 matrix is Hermitian:

```
>>> [1 3J4; 3J-4 2].isHermitianMatrix
true

>>> [1 2.3; 2.3 4].isHermitianMatrix
true
```

Test if a 3×3 matrix is Hermitian:

```
>>> [-1 1J-2 0; 1J2 0 0J-1; 0 0J1 1]
>>> .isHermitianMatrix
true

>>> [1 1J1 0J2; 1J-1 5 -3; 0J-2 -3 0]
>>> .isHermitianMatrix
true
```

A real Hermitian matrix is also symmetric:

```
>>> [1 2.3; 2.3 4].isSymmetricMatrix
true
```

Test if a complex matrix is Hermitian:

```
>>> [1 2J-3; 2J3 4].isHermitianMatrix
true
```

A complex Hermitian matrix has symmetric real part and antisymmetric imaginary part:

```
>>> let m = [1 2J-3; 2J3 4];
>>> (
>>> 	m.real.isSymmetricMatrix,
>>> 	m.imaginary.isAntisymmetricMatrix
>>> )
(true, true)
```

Test if an exact matrix is Hermitian:

```
>>> let m = [4 -5 2; 3 -3 -3; 5 5 5];
>>> m.isHermitianMatrix
false
```

Make the matrix Hermitian:

```
>>> let m = [4 -5 2; 3 -3 -3; 5 5 5];
>>> ((m + m.transpose) / 2).isHermitianMatrix
true
```

A random matrix is typically not Hermitian:

```
>>> Sfc32(327814).randomReal([0 5], [3 3])
>>> .isHermitianMatrix
false
```

* * *

See also: conjugateTranspose, isSymmetricMatrix, isVeryCloseTo

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HermitianMatrix.html)
[2](https://reference.wolfram.com/language/ref/HermitianMatrixQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Hermitian_matrix)
