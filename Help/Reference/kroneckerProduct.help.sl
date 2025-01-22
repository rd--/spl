# kroneckerProduct

- _kroneckerProduct(aMatrix, anotherMatrix)_

Answer the Kronecker product of two matrices, which is a block matrix.

The product of two 2×2 matrices:

```
>>> [0 1; -1 0].kroneckerProduct(
>>> 	[1 2; 3 4]
>>> )
[
	0 0 1 2;
	0 0 3 4;
	-1 -2 0 0;
	-3 -4 0 0
]
```

The product of two 2×2 matrices:

```
>>> [1 2; 3 4].kroneckerProduct(
>>> 	[0 5; 6 7]
>>> )
[
	0 5 0 10;
	6 7 12 14;
	0 15 0 20;
	18 21 24 28
]
```

The product of 3×3 and 3×4 matrices:

```
>>> [0 1 0; 1 1 1; 0 1 0].kroneckerProduct(
>>> 	[1 1 1 1; 1 0 0 1; 1 1 1 1]
>>> )
[
	0 0 0 0 1 1 1 1 0 0 0 0;
	0 0 0 0 1 0 0 1 0 0 0 0;
	0 0 0 0 1 1 1 1 0 0 0 0;
	1 1 1 1 1 1 1 1 1 1 1 1;
	1 0 0 1 1 0 0 1 1 0 0 1;
	1 1 1 1 1 1 1 1 1 1 1 1;
	0 0 0 0 1 1 1 1 0 0 0 0;
	0 0 0 0 1 0 0 1 0 0 0 0;
	0 0 0 0 1 1 1 1 0 0 0 0
]
```

Create a block diagonal matrix:

```
>>> 4.identityMatrix.kroneckerProduct(
>>> 	[1 -1; -1 1]
>>> )
[
	1 -1 0 0 0 0 0 0;
	-1 1 0 0 0 0 0 0;
	0 0 1 -1 0 0 0 0;
	0 0 -1 1 0 0 0 0;
	0 0 0 0 1 -1 0 0;
	0 0 0 0 -1 1 0 0;
	0 0 0 0 0 0 1 -1;
	0 0 0 0 0 0 -1 1
]
```

Expand the size of a matrix by repeating elements:

```
>>> [3 3].iota.kroneckerProduct(
>>> 	1 ! [2 2]
>>> )
[
	1 1 2 2 3 3;
	1 1 2 2 3 3;
	4 4 5 5 6 6;
	4 4 5 5 6 6;
	7 7 8 8 9 9;
	7 7 8 8 9 9
]
```

Visualizes a Laplacian operator matrix:

~~~spl svg=A
let n = 5;
let i = n.identityMatrix;
let e = (1 # 4).diagonalMatrix(-1);
let d = (e + e.transposed) - (2 * i);
(
	d.kroneckerProduct(i)
	+
	i.kroneckerProduct(d)
).matrixPlot
~~~

![](sw/spl/Help/Image/kroneckerProduct-A.svg)

* * *

See also: cross, dot, inner, outer

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KroneckerProduct),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/kron.html)
