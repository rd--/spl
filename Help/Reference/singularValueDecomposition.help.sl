# singularValueDecomposition

- _singularValueDecomposition(aMatrix)_

Answer the singular value decomposition for _aMatrix_ as a list of matrices _[u, σ, v]_,
where σ is a diagonal matrix.
This method is aliased as `svd`.

At 2×2 integer matrix:

```
>>> let [u, s, v] = [
>>> 	1 2;
>>> 	1 2
>>> ].singularValueDecomposition;
>>> (s, u.dot(s).dot(v.transposed))
([0 0; 0 10.sqrt], [1 2; 1 2])
```

At 2×2 integer matrix:

```
>>> let [u, s, v] = [
>>> 	2 3;
>>> 	0 2
>>> ] .singularValueDecomposition;
>>> (s, u.dot(s).dot(v.transposed))
([1 0; 0 4], [2 3; 0 2])
```

At 2×2 real matrix:

```
>>> let [u, s, v] = [
>>> 	0.76 -0.32;
>>> 	0.26 -0.75
>>> ].singularValueDecomposition;
>>> (s, u.dot(s).dot(v.transposed))
(
	[0.46555 0; 0 1.04564],
	[0.76 -0.32; 0.26 -0.75]
)
```

At 2×2 real invertible matrix:

```
>>> let m = [0.5 1; 2 2.5];
>>> let [u, s, v] = m.svd;
>>> (s, u.dot(s).dot(v.transposed))
([0.22163 0; 0 3.38391], m)
```

At 3×2 real matrix:

```
>>> let m = [1.2 3.4; 5.6 7.8; 9.0 1.2];
>>> let [u, s, v] = m.svd;
>>> (u, s, v)
(
	[
		-0.23676 -0.36571;
		-0.72873 -0.54589;
		-0.64258  0.75383
	],
	[
		12.47777  0;
		0         5.65202;
		0         0
	],
	[
		-0.81330  0.581846;
		-0.58185 -0.813299
	]
)
```

At 3×3 integer matrix:

```
>>> let m = [1 0 1; -1 -2 0; 0 1 -1];
>>> let [u, s, v] = m.svd;
>>> (s, u.dot(s).dot(v.transposed))
([2.4605 0 0; 0 0.2391 0; 0 0 1.6996], m)
```

At 3×3 real matrix:

```
>>> let m = [
>>> 	1.1 1.3 2.1;
>>> 	2.2 2.2 3.3;
>>> 	3.3 -3.0 4.7
>>> ];
>>> let [u, s, v] = m.svd;
>>> (s, u.dot(s).dot(v.transposed))
([7.41607 0 0; 0 0.21464 0; 0 0 3.84912], m)
```

At 3×3 real matrix:

```
>>> let m = [
>>> 	-0.069 0.35 0.98;
>>> 	0.5 -0.072 0.64;
>>> 	0.92 0.93 0.15
>>> ];
>>> let [u, s, v] = m.svd;
>>> (s, u.dot(s).dot(v.transposed))
([1.49805 0 0; 0 0.49661 0; 0 0 0.99772], m)
```

The algorithm is Golub-Reinsch:

```
>>> [1 2; 1 2].singularValueDecomposition
[
	[
		[ 1 / 2.sqrt, -1 / 2.sqrt],
		[-1 / 2.sqrt, -1 / 2.sqrt]
	],
	[
		[0, 0],
		[0, 10.sqrt]
	],
	[
		[ 2 / 5.sqrt, -1 / 5.sqrt],
		[-1 / 5.sqrt, -2 / 5.sqrt]
	]
]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SingularValueDecomposition.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.svd.html),
_W_
[1](https://en.wikipedia.org/wiki/Singular_value_decomposition)
