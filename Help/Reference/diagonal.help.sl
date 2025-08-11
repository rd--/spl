# diagonal

- _diagonal(m, n=0)_

Answer the list of elements on the leading diagonal,
or on the _n-th_ diagonal,
of the matrix _m_.
Diagonal works even if _m_ is not a square matrix.

```
>>> [3 3].iota.diagonal
[1 5 9]

>>> [
>>> 	1.1 12.2 3.23;
>>> 	2.3 42.2 35.3;
>>> 	1.2 3.1 2.3
>>> ].diagonal
[1.1 42.2 2.3]

>>> [2 3 1; 2 2 1; 3 1 2].diagonal
[2 2 2]
```

Obtain the superdiagonal:

```
>>> [3 3].iota.diagonal(1)
[2 6]

>>> [
>>> 	1J1 2 3J-2;
>>> 	0 4.pi 0J5;
>>> 	1.e 0 6
>>> ].diagonal(1)
[2 0J5]
```

Obtain the subdiagonal:

```
>>> [3 3].iota.diagonal(-1)
[4 8]
```

The diagonal of a non-square matrix:

```
>>> [3 4].iota.diagonal
[1 6 11]

>>> [
>>> 	3  2  2;
>>> 	2  3 -2;
>>> 	4  2  1;
>>> 	3  7  9
>>> ].diagonal
[3 3 1]
```

_diagonal(m, k)_ for an _n × n_ matrix gives non-empty results for _1 - n <= k <= n - 1_:

```
>>> let m = [4 4].fill { :index |
>>> 	index[2] - index[1]
>>> };
>>> (
>>> 	m,
>>> 	(-3 .. 3).collect { :k |
>>> 		m.diagonal(k)
>>> 	}
>>> )
(
	[
		 0  1  2  3;
		-1  0  1  2;
		-2 -1  0  1;
		-3 -2 -1  0
	],
	[
		-3;
		-2 -2;
		-1 -1 -1;
		 0  0  0  0;
		 1  1  1;
		 2  2;
		 3
	]
)
```

Construct an off-diagonal matrix:

```
>>> let m = [4 4].iota;
>>> let d = m.diagonal;
>>> m - d.diagonalMatrix
[
	 0  2  3  4;
	 5  0  7  8;
	 9 10  0 12;
	13 14 15  0
]
```

* * *

See also: antidiagonal, diagonalMatrix, isDiagonalMatrix, trace

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Diagonal.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/diag.html)

Categories: Math, Matrix
