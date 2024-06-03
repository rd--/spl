# qrDecomposition

- _qrDecomposition(aMatrix)_


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
>>> (q, r, m ~ q.dot(r))
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
	true
)
```

Answer the _QR_ decomposition of a matrix _A_ into a product _A = QR_ of an orthonormal matrix _Q_ and an upper triangular matrix _R_.

```
>>> let m = [12 -51 4; 6 167 -68; -4 24 -41];
>>> let [q, r] = m.qrDecomposition;
>>> let cQ = q * 175;
>>> (q, cQ, r, q.isOrthogonalMatrix, r.isUpperTriangularMatrix, q.dot(r) ~ m, q.dot(r))
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
>>> (q, r, q.dot(r) ~ m)
(
	[
		-0.764510   0.267789   0.542046   0.223607;
		-0.143346  -0.620001   0.380855  -0.670820;
		-0.095564  -0.733804  -0.048990   0.670820;
		-0.621164  -0.073617  -0.747486  -0.223607
	],
	[
		-20.92845  -11.27652  -15.86357   -7.16727;
		        0  -13.52184   -7.32993  -18.57573;
		        0          0   -2.14922    6.44777;
		        0          0          0          0
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
