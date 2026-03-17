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

Rows of binary Walsh matrices interpreted as reverse binary numbers,
OEIS [A228539](https://oeis.org/A228539):

```
>>> 1:4.collect { :n |
>>> 	(2 ^ n).hadamardMatrix
>>> 	.max(0)
>>> 	.collect { :d |
>>> 		(1 - d).reverse.fromDigits(2)
>>> 	}
>>> }
[
	0 2
	;
	0 10 12 6
	;
	0 170 204 102 240 90 60 150
	;
	0 43690 52428 26214 61680 23130
	15420 38550 65280 21930 13260
	39270 4080 42330 49980 27030
]
```

Rows of negated binary Walsh matrices interpreted as reverse binary numbers,
OEIS [A228540](https://oeis.org/A228540):

```
>>> 1:4.collect { :n |
>>> 	(2 ^ n).hadamardMatrix
>>> 	.max(0)
>>> 	.collect { :d |
>>> 		d.reverse.fromDigits(2)
>>> 	}
>>> }
[
	3 1
	;
	15 5 3 9
	;
	255 85 51 153 15 165 195 105
	;
	65535 21845 13107 39321 3855 42405
	50115 26985 255 43605 52275 26265
	61455 23205 15555 38505
]
```

Matrix plot of the 16×16 Hadamard matrix:

~~~spl svg=A
(16.hadamardMatrix + 1).matrixPlot
~~~

![](Help/Image/hadamardMatrix-A.svg)

Draw the 128×128 Hadamard matrix:

~~~spl png=B
(128.hadamardMatrix + 1 / 2).Bitmap
~~~

![](Help/Image/hadamardMatrix-B.png)

Signal plot of the 16×16 Hadamard matrix:

~~~spl svg=C
16.hadamardMatrix.signalPlot
~~~

![](Help/Image/hadamardMatrix-C.svg)

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
