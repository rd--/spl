# antidiagonalArray

- _antidiagonalArray(n, f:/2)_

Answer the first _n_ rows of the triangular array given by the falling diagonals of the matrix function _f_.

Wythoff array in (falling) antidiagonals:

```
>>> 8.antidiagonalArray(wythoffArray:/2)
[
	1;
	2 4;
	3 7 6;
	5 11 10 9;
	8 18 16 15 12;
	13 29 26 24 20 14;
	21 47 42 39 32 23 17;
	34 76 68 63 52 37 28 19
]
```

Indices:

```
>>> 6.antidiagonalArray { :i :j |
>>> 	[i, j]
>>> }
[
	1 1:;
	1 2; 2 1:;
	1 3; 2 2; 3 1:;
	1 4; 2 3; 3 2; 4 1:;
	1 5; 2 4; 3 3; 4 2; 5 1:;
	1 6; 2 5; 3 4; 4 3; 5 2; 6 1
]
```

* * *

See also: antidiagonal, antidiagonalIndicesDo, antidiagonalMatrix, triangularArray

Guides: Array Functions, Matrix Functions
