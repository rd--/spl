# walshMatrix

- _walshMatrix(n)_

Answer the _n×n_ Walsh matrix, where _n_ is a power of two.
A Walsh matrix is a row permutation of a `hadamardMatrix`.

The first three Walsh matrices:

```
>>> 2.walshMatrix
[
	1  1;
	1 -1
]

>>> 4.walshMatrix
[
	1  1  1  1;
	1  1 -1 -1;
	1 -1 -1  1;
	1 -1  1 -1
]

>>> 8.walshMatrix
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
```

The `dot` product of an _n×n_ Walsh matrix with its transposition is the _n^2_ identity matrix multiplied by _n^2_:

```
>>> let m = 16.walshMatrix;
>>> m.dot(m.transpose)
(16 * 16.identityMatrix)
```

The Walsh matrix can be used to implement the Walsh-Hadamard transform:

```
>>> [1 1 1 1 0 0 0 0].dot(8.walshMatrix) / 8
[1/2 1/2 0 0 0 0 0 0]

>>> [1 1 1 1 1 0 0 0].dot(8.walshMatrix) / 8
[0.625 0.375 -0.125 0.125 0.125 -0.125 -0.125 0.125]

>>> [19 -1 11 -9 -7 13 -15 5]
>>> .dot(8.walshMatrix) / 8
[2 3 0 4 0 0 10 0]

>>> let h = 8.walshMatrix;
>>> let x = [
>>> 	8 * h[1],
>>> 	12 * h[3],
>>> 	18 * h[5],
>>> 	10 * h[8]
>>> ].sum;
>>> x.dot(h) / 8
[8 0 12 0 18 0 0 10]
```

Plot the 8×8 Walsh matrix:

~~~spl svg=A
(8.walshMatrix + 1).matrixPlot
~~~

![](sw/spl/Help/Image/walshMatrix-A.svg)

Draw the 128×128 Walsh matrix:

~~~spl png=B
(128.walshMatrix + 1 / 2).Bitmap
~~~

![](sw/spl/Help/Image/walshMatrix-B.png)

* * *

See also: hadamardMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WalshMatrix.html)
[1](https://reference.wolfram.com/language/ref/WalshMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/walsh.html)
[2](https://mathworks.com/help/signal/ref/fwht.html)
[3](https://mathworks.com/help/signal/ug/discrete-walsh-hadamard-transform.html),
_W_
[1](https://en.wikipedia.org/wiki/Walsh_matrix)

Categories: Math, Matrix
