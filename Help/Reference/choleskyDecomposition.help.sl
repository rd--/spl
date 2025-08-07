# choleskyDecomposition

- _choleskyDecomposition(aMatrix)_

Answer the Cholesky decomposition of _aMatrix_.
The matrix must be Hermitian and positive definite.

Compute the Cholesky decomposition of a 2×2 integer matrix:

```
>>> [2 1; 1 2].choleskyDecomposition
[
	[2.sqrt,     0    ],
	[1 / 2.sqrt, 3/2.sqrt]
]
```

Find the Cholesky decomposition of two 3×3 integer matrices:

```
>>> [4 12 -16; 12 37 -43; -16 -43 98]
>>> .choleskyDecomposition
[
	 2 0 0;
	 6 1 0;
	-8 5 3
]

>>> [25 15 -5; 15 18 0; -5 0 11]
>>> .choleskyDecomposition
[
	 5 0 0;
	 3 3 0;
	-1 1 3
]
```

Find the Cholesky decomposition of a 3×3 real matrix:

```
>>> let m = [
>>> 	0.5  0.3  0.4;
>>> 	0.3  1.1 -0.2;
>>> 	0.4 -0.2  0.7
>>> ];
>>> let l = m.choleskyDecomposition;
>>> (
>>> 	l,
>>> 	l.isLowerTriangularMatrix,
>>> 	l.dot(l.transposed) ~ m
>>> )
(
	[
		0.7071  0      0;
		0.4243  0.9592 0;
		0.5657 -0.4587 0.4118
	],
	true,
	true
)
```

Find the Cholesky decomposition of a 4×4 integer matrix:

```
>>> [
>>> 	18 22  54  42;
>>> 	22 70  86  62;
>>> 	54 86 174 134;
>>> 	42 62 134 106
>>> ].choleskyDecomposition
[
	 4.2426 0      0      0;
	 5.1855 6.5659 0      0;
	12.7279 3.0460 1.6497 0;
	9.89949 1.6246 1.8497 1.3926
]
```

Find the Cholesky decomposition of a 6×6 real matrix:

```
>>> let m = [
>>> 	1.0000   0.5000   0.3333   0.2500   0.2000   0.1667;
>>> 	0.5000   1.0000   0.6667   0.5000   0.4000   0.3333;
>>> 	0.3333   0.6667   1.0000   0.7500   0.6000   0.5000;
>>> 	0.2500   0.5000   0.7500   1.0000   0.8000   0.6667;
>>> 	0.2000   0.4000   0.6000   0.8000   1.0000   0.8333;
>>> 	0.1667   0.3333   0.5000   0.6667   0.8333   1.0000
>>> ];
>>> let l = m.choleskyDecomposition;
>>> (
>>> 	l,
>>> 	l.isLowerTriangularMatrix,
>>> 	l.dot(l.transposed) ~ m
>>> )
(
	[
		1      0      0      0      0      0;
		0.5    0.8660 0      0      0      0;
		0.3333 0.5774 0.7453 0      0      0;
		0.25   0.4330 0.5590 0.6614 0      0;
		0.2    0.3464 0.4472 0.5291 0.6    0;
		0.1667 0.2886 0.3727 0.4410 0.4999 0.5528
	],
	true,
	true
)
```

* * *

See also: luDecomposition, qrDecomposition

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CholeskyDecomposition.html)
[2](https://reference.wolfram.com/language/ref/CholeskyDecomposition.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/chol.html),
_W_
[1](https://en.wikipedia.org/wiki/Cholesky_decomposition)
