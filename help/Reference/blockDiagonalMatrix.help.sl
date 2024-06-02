# blockDiagonalMatrix

- _blockDiagonalMatrix(aSequence)_

Answer a matrix which places the matrices at _aSequence_ on the block diagonal, and zeroes elsewhere.

If the submatrices are 1×1 the answer is a diagonal matrix:

```
>>> [1:; 2:; 3:; 4].blockDiagonalMatrix
[
	1 0 0 0;
	0 2 0 0;
	0 0 3 0;
	0 0 0 4
]
```

A 4×7 block diagonal matrix of 1×1, 2×2 and 1×4 submatrices:

```
>>> let d = [1:; 1 1; 1 1:; 1 1 1 1];
>>> d.blockDiagonalMatrix
[
	1 0 0 0 0 0 0;
	0 1 1 0 0 0 0;
	0 1 1 0 0 0 0;
	0 0 0 1 1 1 1
]
```

A 5×5 block diagonal matrix of 3×3 and 2×2 submatrices:

```
>>> let d = [1 1/3 -2; 1/2 2 6; 1 8 -1:; 8/7 -1/3; -1/2 6/5];
>>> d.blockDiagonalMatrix
[
	1    1/3 -2    0    0;
	1/2  2    6    0    0;
	1    8   -1    0    0;
	0    0    0  8/7   -1/3;
	0    0    0 -1/2    6/5
]
```

A 5×5 block diagonal matrix of two 2×2 and one 1×1 submatrices:

```
>>> [3 -1; 1 0:; 2:; -2 3; 3 0].blockDiagonalMatrix
[
	3 -1  0  0  0;
	1  0  0  0  0;
	0  0  2  0  0;
	0  0  0 -2  3;
	0  0  0  3  0
]
```

A 7×7 block diagonal matrix of 2×2, 3×2 and 2×3 submatrices:

```
>>> let d = [1 1; 1 1:; 2 2; 2 2; 2 2:; 3 3 3; 3 3 3];
>>> d.blockDiagonalMatrix
[
	1 1 0 0 0 0 0;
	1 1 0 0 0 0 0;
	0 0 2 2 0 0 0;
	0 0 2 2 0 0 0;
	0 0 2 2 0 0 0;
	0 0 0 0 3 3 3;
	0 0 0 0 3 3 3
]
```

* * *

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/arrays/#Base.cat),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BlockDiagonalMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/blkdiag.html)
