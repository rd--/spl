# upperTriangularize

- _upperTriangularize(m, n=0)_

Set the _n_-th lower triangle of the matrix _m_ to `zero`.
Answer _m_.

Upper triangular part of a 3×3 matrix:

```
>>> [3 3].iota.upperTriangularize
[
	1 2 3;
	0 5 6;
	0 0 9
]
```

Strictly upper triangular part of a 3×3 matrix:

```
>>> [3 3].iota.upperTriangularize(1)
[
	0 2 3;
	0 0 6;
	0 0 0
]
```

The upper triangular part of a 3×3 matrix plus the diagonal above the main diagonal:

```
>>> [3 3].iota.upperTriangularize(-1)
[
	1 2 3;
	4 5 6;
	0 8 9
]
```

Upper triangular part of a 3×4 matrix:

```
>>> [3 4].iota.upperTriangularize
[
	1 2 3 4;
	0 6 7 8;
	0 0 11 12
]
```

Upper triangular part of a 4×3 matrix:

```
>>> [4 3].iota.upperTriangularize
[
	1 2 3;
	0 5 6;
	0 0 9;
	0 0 0
]
```

* * *

See also: diagonal, isUpperTriangularMatrix, lowerTriangularize, luDecomposition

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UpperTriangularize.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/triu.html)
