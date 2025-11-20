# hadamardMatrix

- _hadamardMatrix(n)_

Answer the _n×n_ Hadamard matrix, where _n_ is a power of two.
The ordering of rows is called the natural ordering,
see `walshMatrix` for the sequency ordering.

The first Hadamard matrix:

```
>>> 2.hadamardMatrix
[
	1  1;
	1 -1
]
```

The second Hadamard matrix:

```
>>> 4.hadamardMatrix
[
	1  1  1  1;
	1 -1  1 -1;
	1  1 -1 -1;
	1 -1 -1  1
]
```

The third Hadamard matrix,
the number of sign changes are _0,7,3,4,1,6,2,5_,
OEIS [A240908](https://oeis.org/A240908):

```
>>> 8.hadamardMatrix
[
	1  1  1  1  1  1  1  1;
	1 -1  1 -1  1 -1  1 -1;
	1  1 -1 -1  1  1 -1 -1;
	1 -1 -1  1  1 -1 -1  1;
	1  1  1  1 -1 -1 -1 -1;
	1 -1  1 -1 -1  1 -1  1;
	1  1 -1 -1 -1 -1  1  1;
	1 -1 -1  1 -1  1  1 -1
]
```

The fourth Haramard matrix,
the number of sign changes are
_0,15,7,8,3,12,4,11,1,14,6,9,2,13,5,10_,
OEIS [A240909](http://oeis.org/A240909):

```
>>> 16.hadamardMatrix.unitStep
[
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0;
	1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0;
	1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0;
	1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1;
	1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1;
	1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0;
	1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0;
	1 0 1 0 1 0 1 0 0 1 0 1 0 1 0 1;
	1 1 0 0 1 1 0 0 0 0 1 1 0 0 1 1;
	1 0 0 1 1 0 0 1 0 1 1 0 0 1 1 0;
	1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1;
	1 0 1 0 0 1 0 1 0 1 0 1 1 0 1 0;
	1 1 0 0 0 0 1 1 0 0 1 1 1 1 0 0;
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

The `dot` product of an _n×n_ Hadamard matrix with its transposition is the _n_-identity matrix multiplied by _n_,
_HHᵀ=nIₙ_:

```
>>> let n = 16;
>>> let h = n.hadamardMatrix;
>>> h.dot(h.transpose)
n * n.identityMatrix
```

Hadamard matrices constructed using Sylvester’s method are symmetric and have trace zero:

```
>>> let n = 16;
>>> let h = n.hadamardMatrix;
>>> (h.isSymmetricMatrix, h.trace)
(true, 0)
```

A Walsh matrix is a row permutation of a Hadamard matrix,
ordered by counting the number of sign changes in each row:

```
>>> let h = 8.hadamardMatrix;
>>> let z = h.collect(zeroCrossingCount:/1);
>>> let p = z.ordering;
>>> let w = h @* p;
>>> (z, p, w)
(
	[0 7 3 4 1 6 2 5],
	[1 5 7 3 4 8 6 2],
	[
		1  1  1  1  1  1  1  1;
		1  1  1  1 -1 -1 -1 -1;
		1  1 -1 -1 -1 -1  1  1;
		1  1 -1 -1  1  1 -1 -1;
		1 -1 -1  1  1 -1 -1  1;
		1 -1 -1  1 -1  1  1 -1;
		1 -1  1 -1 -1  1 -1  1;
		1 -1  1 -1  1 -1  1 -1
	]
)
```

The product of a Boolean function and a Hadamard matrix is its Walsh spectrum:

```
>>> [1 0 1 0 0 1 1 0].dot(
>>> 	8.hadamardMatrix
>>> )
[4 2 0 -2 0 2 0 2]
```

Matrix plot of the 16×16 Hadamard matrix:

~~~spl svg=A
(16.hadamardMatrix + 1).matrixPlot
~~~

![](sw/spl/Help/Image/hadamardMatrix-A.svg)

Draw the 128×128 Hadamard matrix:

~~~spl png=B
(128.hadamardMatrix + 1 / 2).Bitmap
~~~

![](sw/spl/Help/Image/hadamardMatrix-B.png)

Signal plot of the 16×16 Hadamard matrix:

~~~spl svg=C
16.hadamardMatrix.signalPlot
~~~

![](sw/spl/Help/Image/hadamardMatrix-C.svg)

* * *

See also: fastWalshHadamardTransform, walshMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HadamardMatrix.html)
[1](https://reference.wolfram.com/language/ref/HadamardMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hadamard.html),
_OEIS_
[1](http://oeis.org/A240908)
[2](http://oeis.org/A240909),
_W_
[1](https://en.wikipedia.org/wiki/Hadamard_matrix)

Categories: Math, Matrix
