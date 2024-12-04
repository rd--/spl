# hadamardMatrix

- _hadamardMatrix(n)_

Answer the _n×n_ Hadamard matrix, where _n_ is a power of two.

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

The third Hadamard matrix:

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

The fourth Haramard matrix:

```
>>> 16.hadamardMatrix
[
	1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1;
	1 -1  1 -1  1 -1  1 -1  1 -1  1 -1  1 -1  1 -1;
	1  1 -1 -1  1  1 -1 -1  1  1 -1 -1  1  1 -1 -1;
	1 -1 -1  1  1 -1 -1  1  1 -1 -1  1  1 -1 -1  1;
	1  1  1  1 -1 -1 -1 -1  1  1  1  1 -1 -1 -1 -1;
	1 -1  1 -1 -1  1 -1  1  1 -1  1 -1 -1  1 -1  1;
	1  1 -1 -1 -1 -1  1  1  1  1 -1 -1 -1 -1  1  1;
	1 -1 -1  1 -1  1  1 -1  1 -1 -1  1 -1  1  1 -1;
	1  1  1  1  1  1  1  1 -1 -1 -1 -1 -1 -1 -1 -1;
	1 -1  1 -1  1 -1  1 -1 -1  1 -1  1 -1  1 -1  1;
	1  1 -1 -1  1  1 -1 -1 -1 -1  1  1 -1 -1  1  1;
	1 -1 -1  1  1 -1 -1  1 -1  1  1 -1 -1  1  1 -1;
	1  1  1  1 -1 -1 -1 -1 -1 -1 -1 -1  1  1  1  1;
	1 -1  1 -1 -1  1 -1  1 -1  1 -1  1  1 -1  1 -1;
	1  1 -1 -1 -1 -1  1  1 -1 -1  1  1  1  1 -1 -1;
	1 -1 -1  1 -1  1  1 -1 -1  1  1 -1  1 -1 -1  1
]
```

The `dot` product of an _n×n_ Hadamard matrix with its transposition is the _n^2_ identity matrix multiplied by _n^2_:

```
>>> let m = 16.hadamardMatrix;
>>> m.dot(m.transposed)
(16 * 16.identityMatrix)
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
>>> [1 0 1 0 0 1 1 0].dot(8.hadamardMatrix)
[4 2 0 -2 0 2 0 2]
```

Plot the 16×16 Hadamard matrix:

~~~
(16.hadamardMatrix + 1).matrixPlot
~~~

![](sw/spl/Help/Image/hadamardMatrix-A.svg)

* * *

See also: walshMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HadamardMatrix.html)
[1](https://reference.wolfram.com/language/ref/HadamardMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hadamard.html),
_W_
[1](https://en.wikipedia.org/wiki/Hadamard_matrix)

Categories: Math, Matrix
