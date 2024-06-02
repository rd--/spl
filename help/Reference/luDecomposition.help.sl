# luDecomposition

- _luDecomposition(m)_

Answer the LU decomposition of the square matrix _m_.
The decomposition is to three matrices _(l, u, p)_,
where _l_ is lower triangular,
_u_ is upper triangular,
and _l.u = p.m_.

LU decomposition of a 2×2 matrix:

```
>>> let m = [4 3; 6 3];
>>> let [l, u, p] = m.luDecomposition;
>>> (l, u, p, p.dot(m) = l.dot(u))
(
	[1 0; 2/3 1],
	[6 3; 0 1],
	[0 1; 1 0],
	true
)
```

LU decomposition of three 3×3 matrices:

```
>>> let m = [1 3 5; 2 4 7; 1 1 0];
>>> let [l, u, p] = m.luDecomposition;
>>> (l, u, p, p.dot(m) = l.dot(u))
(
	[1 0 0; 0.5 1 0; 0.5 -1 1],
	[2 4 7; 0 1 1.5; 0 0 -2],
	[0 1 0; 1 0 0; 0 0 1],
	true
)

>>> let m = [1 1 1; 2 4 8; 3 9 27];
>>> let [l, u, p] = m.luDecomposition;
>>> (l, u, p, p.dot(m) = l.dot(u))
(
	[1 0 0; 1/3 1 0; 2/3 1 1],
	[3 9 27; 0 -2 -8; 0 0 -2],
	[0 0 1; 1 0 0; 0 1 0],
	true
)

>>> let m = [0 5 22/3; 4 2 1; 2 7 9];
>>> let [l, u, p] = m.luDecomposition;
>>> (l, u, p, p.dot(m) = l.dot(u))
(
	[1 0 0; 1/2 1 0; 0 5/6 1],
	[4 2 1; 0 6 17/2; 0 0 1/4],
	[0 1 0; 0 0 1; 1 0 0],
	true
)
```

LU decomposition of two 4×4 matrices:

```
>>> [4 3 2 1; 3 3 2 1; 2 2 2 1; 1 1 1 1].luDecomposition
[
	[
		1   0   0   0;
		3/4 1   0   0;
		1/2 2/3 1   0;
		1/4 1/3 1/2 1
	],
	[
		4   3   2   1;
		0   3/4 1/2 1/4;
		0   0   2/3 1/3;
		0   0   0   1/2
	],
	[
		1 0 0 0;
		0 1 0 0;
		0 0 1 0;
		0 0 0 1
	]
]

>>> let m = [11 9 24 2; 1 5 2 6; 3 17 18 1; 2 5 7 1];
>>> let [l, u, p] = m.luDecomposition;
>>> let t = (l.isLowerTriangularMatrix, u.isUpperTriangularMatrix);
>>> (l, u, p, t, p.dot(m) = l.dot(u))
(
	[
		1 0 0 0;
		0.272727 1 0 0;
		0.090909 0.28750 1 0;
		0.181818 0.23125 0.003597 1
	],
	[
		11 9 24 2;
		0 14.545454 11.454545 0.454545;
		0 0 -3.475 5.6875;
		0 0 0 0.510791
	],
	[
		1 0 0 0;
		0 0 1 0;
		0 1 0 0;
		0 0 0 1
	],
	(true, true),
	true
)
```

* * *

See also: dot, isLowerTriangularMatrix, isUpperTriangularMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LUDecomposition.html),
_W_
[1](https://en.wikipedia.org/wiki/LU_decomposition)
