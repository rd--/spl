# lowerTriangularize

- _lowerTriangularize(m, n=0)_

Set the _n_-th upper triangle of the matrix _m_ to `zero`.
Answer _m_.

Lower triangular part of a 3×3 matrix:

```
>>> [3 3].iota.lowerTriangularize
[
	1 0 0;
	4 5 0;
	7 8 9
]
```

Strictly lower triangular part of a 3×3 matrix:

```
>>> [3 3].iota.lowerTriangularize(-1)
[
	0 0 0;
	4 0 0;
	7 8 0
]
```

The lower triangular part of a 3×3 matrix plus the diagonal above the main diagonal:

```
>>> [3 3].iota.lowerTriangularize(1)
[
	1 2 0;
	4 5 6;
	7 8 9
]
```

Lower triangular part of a 3×4 matrix:

```
>>> [3 4].iota.lowerTriangularize
[
	1  0  0  0;
	5  6  0  0;
	9 10 11  0
]
```

Lower triangular part of a 4×3 matrix:

```
>>> [4 3].iota.lowerTriangularize
[
	 1  0  0;
	 4  5  0;
	 7  8  9;
	10 11 12
]
```

* * *

See also: diagonal, isLowerTriangularMatrix, luDecomposition, upperTriangularize

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LowerTriangularize.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/tril.html)
