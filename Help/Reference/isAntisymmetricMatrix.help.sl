# isAntisymmetricMatrix

- _isAntisymmetricMatrix(m)_

Answer `true` if the matrix _m_ is antisymmetric, else `false`.

Test if a 2×2 numeric matrix is antisymmetric:

```
>>> [
>>> 	0 -1;
>>> 	1  0
>>> ].isAntisymmetricMatrix
true

>>> [0 2 -45; -2 0 -4; 45 4 0]
>>> .isAntisymmetricMatrix
true
```

At `Complex` matrix:

```
>>> [0 2J-3; -2J3 0].isAntisymmetricMatrix
true
```

Any matrix generated from an antisymmetric function is antisymmetric:

```
>>> -.table(1:5, 1:5).isAntisymmetricMatrix
true
```

* * *

See also: isMatrix, isSquareMatrix, isSymmetricMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AntisymmetricMatrix.html),
[2](https://reference.wolfram.com/language/ref/AntisymmetricMatrixQ.html)
_W_
[1](https://en.wikipedia.org/wiki/Antisymmetric_matrix)

Categories: Testing, Matrix
