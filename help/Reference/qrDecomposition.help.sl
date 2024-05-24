# qrDecomposition

- _qrDecomposition(aMatrix)_

Answer the _QR_ decompositionof a matrix _A_ into a product _A = QR_ of an orthonormal matrix _Q_ and an upper triangular matrix _R_.

```
>>> let m = [12 -51 4; 6 167 -68; -4 24 -41];
>>> let [q, r] = m.qrDecomposition;
>>> let cQ = q * 175;
>>> (q, cQ, r, q.isOrthogonalMatrix, r.isUpperTriangularMatrix, q.dot(r) ~ m, q.dot(r))
(
	[
		-6/7   69/175 -58/175;
		-3/7 -158/175   6/175;
		 2/7    -6/35  -33/35
	],
	[
		-150   69  -58;
		 -75 -158    6;
		  50  -30 -165
	],
	[
		-14  -21 14;
		  0 -175 70;
		  0    0 35
	],
	true,
	true,
	true,
	[
		12 -51   4;
		 6 167 -68;
		-4  24 -41
	]
)
```

* * *

See also: isOrthogonalMatrix, isUpperTriangularMatrix, luDecomposition

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QRDecomposition.html)
[1](https://reference.wolfram.com/language/ref/QRDecomposition.html),
_W_
[1](https://en.wikipedia.org/wiki/QR_decomposition)
