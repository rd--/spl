# qrDecomposition

- _qrDecomposition(aMatrix)_

Answer the QR decomposition for _aMatrix_, which must be numerical.
The answer is a `List` _[q, r]_,
where _q_ is a unitary matrix and _r_ is a lower-triangular matrix.

The QR decomposition of a 2×2 matrix:

```
>>> let m = [1 2; 3 4];
>>> let [q, r] = m.qrDecomposition;
>>> (q, r, q.dot(r) ~ m)
(
	[
		[-1 / 10.sqrt,  3 / 10.sqrt],
		[-3 / 10.sqrt, -1 / 10.sqrt]
	],
	[
		[10.sqrt.-, -7 * 2/5.sqrt],
		[0,      2/5.sqrt]
	],
	true
)
```

The QR decomposition for a 3×2 matrix,
zero padded to be 3×3:

```
>>> let m = [1 2 0; 3 4 0; 5 6 0];
>>> let [q, r] = m.qrDecomposition;
>>> (q, r, m ~ q.dot(r), q.transposed.dot(q))
(
	[
		-0.16903   0.89709   0.40825;
		-0.50709   0.27603  -0.81650;
		-0.84515  -0.34503   0.40825
	],
	[
		-5.91608  -7.43736   0;
		 0         0.82808   0;
		 0         0         0
	],
	true,
	[
		1 0 0;
		0 1 0;
		0 0 1
	]
)
```

The QR decomposition for a 5×3 matrix,
zero padded to be 5×5:

```
>>> let [q, r] = [
>>> 	1 3 7 0 0;
>>> 	-1 2 -3 0 0;
>>> 	-1 2 -9 0 0;
>>> 	1 -4 7 0 0;
>>> 	1 2 1 0 0
>>> ].qrDecomposition;
>>> (q.roundTo(1E-3), r.roundTo(1E-3))
(
	[
		-0.447  -0.607   0.469   0.063  -0.456;
		 0.447  -0.236   0.469   0.578   0.437;
		 0.447  -0.236  -0.498   0.400  -0.580;
		-0.447   0.573   0.059   0.662  -0.172;
		-0.447  -0.438  -0.556   0.252   0.485
	],
	[
		-2.236   1.342  -12.075   0.000   0.000;
		 0.000  -5.933    2.157   0.000   0.000;
		 0.000   0.000    6.208   0.000   0.000;
		 0.000   0.000    0.000   0.000   0.000;
		 0.000   0.000    0.000   0.000   0.000
	]
)
```

Answer the _QR_ decomposition of a matrix _A_ into a product _A = QR_ of an orthonormal matrix _Q_ and an upper triangular matrix _R_.

```
>>> let m = [12 -51 4; 6 167 -68; -4 24 -41];
>>> let [q, r] = m.qrDecomposition;
>>> let cQ = q * 175;
>>> (
>>> 	q,
>>> 	cQ,
>>> 	r,
>>> 	q.isOrthogonalMatrix,
>>> 	r.isUpperTriangularMatrix,
>>> 	q.dot(r) ~ m,
>>> 	q.dot(r)
>>> )
(
	[
		-6/7   69/175  -58/175;
		-3/7 -158/175    6/175;
		 2/7    -6/35   -33/35
	],
	[
		-150   69  -58;
		 -75 -158    6;
		  50  -30 -165
	],
	[
		-14  -21   14;
		  0 -175   70;
		  0    0   35
	],
	true,
	true,
	true,
	[
		12  -51    4;
		 6  167  -68;
		-4   24  -41
	]
)
```

QR decomposition of a magic square,
note that corresponding rows and columns in _Q_ and _R_ can flip their signs,
since this does not affect the value of the expression _A = Q*R_:

```
>>> let m = [16 5 9 4; 3 10 6 15; 2 11 7 14; 13 8 12 1];
>>> let [q, r] = m.qrDecomposition;
>>> (q.roundTo(1E-3), r.roundTo(1E-2), q.dot(r) ~ m)
(
	[
		-0.765   0.268   0.542   0.224;
		-0.143  -0.620   0.381  -0.671;
		-0.096  -0.734  -0.049   0.671;
		-0.621  -0.074  -0.747  -0.224
	],
	[
		-20.93  -11.28  -15.86   -7.17;
		     0  -13.52   -7.33  -18.58;
		     0       0   -2.15    6.45;
		     0       0       0       0
	],
	true
)
```

The Gram-Schmidt process also answers an orthogonal matrix:

```
>>> let m = [3 4 2; 2 5 2; 1 2 6];
>>> let [q, _] = m.transposed.qrDecomposition;
>>> let z = q.transposed.negated;
>>> (m.gramSchmidtProcess ~ z, z)
(
	true,
	[
		 0.55708  0.74278  0.37139;
		-0.78707  0.61489 -0.04919;
		-0.26491 -0.26491  0.92717
	]
)
```

* * *

See also: isOrthogonalMatrix, isUpperTriangularMatrix, luDecomposition

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QRDecomposition.html)
[2](https://reference.wolfram.com/language/ref/QRDecomposition.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/qr.html),
_W_
[1](https://en.wikipedia.org/wiki/QR_decomposition)

Categories: Math, Matrix
