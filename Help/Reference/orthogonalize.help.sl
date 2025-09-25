# orthogonalize

- _orthogonalize(m)_

Answer an orthonormal basis found by orthogonalizing the vectors of the matrix _m_ using the Gram–Schmidt procedure.

Two integer two-vectors (a 2×2 matrix):

```
>>> [3 1; 2 2].orthogonalize
[
	[ 3  1] / 10.sqrt,
	[-1  3] / 10.sqrt
]
```

Two real two-vectors (a 2×2 matrix):

```
>>> [1.25 3; 7.9 -1.4].orthogonalize
[
	0.38462  0.92308;
	0.92308 -0.38462
]
```

Two three-vectors (a 2×3 matrix):

```
>>> [1 0 1; 1 1 1].orthogonalize
[
	[1 0 1] / 2.sqrt,
	[0 1 0]
]
```

Three two-vectors (a 3×2 matrix):

```
>>> [2 3; 0 2; 3 1].orthogonalize
[
	[ 2  3] / 13.sqrt,
	[-3  2] / 13.sqrt,
	[0   0]
]
```

Three three-vectors (a 3×3 matrix):

```
>>> [1 1 0; 0 1 1; 1 0 1].orthogonalize
[
	[ 1  1  0] / 2.sqrt,
	[-1  1  2] / 6.sqrt,
	[ 1 -1  1] / 3.sqrt
]
```

Four three-vectors (a 4×3 matrix):

```
>>> let m = [1 0 1; 2 6 3; 1 1 1; 2 3 5];
>>> m.orthogonalize
[
	[ 1   0   1] / 2.sqrt,
	[-1  12   1] / 146.sqrt,
	[ 6   1  -6] / 73.sqrt,
	[ 0   0   0]
]
```

Three four-vectors (a 3×4 matrix):

```
>>> [1 -1 0 0; 0 1 -1 0; 0 0 1 -1].orthogonalize
[
	[1 -1  0  0] / 2.sqrt,
	[1  1 -2  0] / 6.sqrt,
	[1  1  1 -3] / 12.sqrt
]
```

Three five-vectors (a 3×5 matrix):

```
>>> let m = [1 -1 -1 1 1; 3 2 2 -4 2; 7 -3 -9 7 1];
>>> m.orthogonalize
[
	[ 1  -1   -1   1   1] / 5.sqrt,
	[18   7    7 -17  13] / (4 * 55.sqrt),
	[16  16  -17   2 -19] / 1166.sqrt
]
```

Calculate the orthonormal basis vectors for the range of a rank deficient matrix:

```
>>> [1 0 1; 0 1 0; 1 0 1].orthogonalize
[
	0.7071 0     0.7071;
	0      1     0;
	0      0     0
]
```

* * *

See also: dot, inner, gramSchmidtProcess, isOrthogonalMatrix, isUnitaryMatrix, normalize, projection, qrDecomposition

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Orthogonal.html)
[2](https://reference.wolfram.com/language/ref/Orthogonalize.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/orth.html),
_W_
[1](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)

Categories: Math, Vector
