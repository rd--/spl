# pascalMatrix

- _pascalMatrix(n, type='Symmetric')_

Answer the lower triangular, upper triangular or symmetric Pascal matrix of order _n_.

The three 4×4 Pascal matrices:

```
>>> 4.pascalMatrix('LowerTriangular')
[
	1 0 0 0;
	1 1 0 0;
	1 2 1 0;
	1 3 3 1
]

>>> 4.pascalMatrix('UpperTriangular')
[
	1 1 1 1;
	0 1 2 3;
	0 0 1 3;
	0 0 0 1
]

>>> 4.pascalMatrix('Symmetric')
[
	1 1 1 1;
	1 2 3 4;
	1 3 6 10;
	1 4 10 20
]
```

The 5×5 symmetric Pascal matrix:

```
>>> 5.pascalMatrix
[
	1  1  1  1  1;
	1  2  3  4  5;
	1  3  6 10 15;
	1  4 10 20 35;
	1  5 15 35 70
]
```

The 7×7 symmetric Pascal matrix:

```
>>> 7.pascalMatrix
[
	1   1   1   1   1   1   1;
	1   2   3   4   5   6   7;
	1   3   6  10  15  21  28;
	1   4  10  20  35  56  84;
	1   5  15  35  70 126 210;
	1   6  21  56 126 252 462;
	1   7  28  84 210 462 924
]
```

The determinant is in each case `one`:

```
>>> [
>>> 	'LowerTriangular'
>>> 	'UpperTriangular'
>>> 	'Symmetric'
>>> ].collect { :type |
>>> 	5.pascalMatrix(type)
>>> 	.determinant
>>> }
[1 1 1]
```

Calculate modulo seven:

```
>>> 8.pascalMatrix('LowerTriangular') % 7
[
	1 0 0 0 0 0 0 0;
	1 1 0 0 0 0 0 0;
	1 2 1 0 0 0 0 0;
	1 3 3 1 0 0 0 0;
	1 4 6 4 1 0 0 0;
	1 5 3 3 5 1 0 0;
	1 6 1 6 1 6 1 0;
	1 0 0 0 0 0 0 1
]
```

Log plot of 4×4 Pascal matrix:

~~~spl svg=A
7.pascalMatrix.log.matrixPlot
~~~

![](sw/spl/Help/Image/pascalMatrix-A.svg)

Scatter plot of row order upper triangular Pascal matrix:

~~~spl svg=B
11.pascalMatrix('UpperTriangular')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/pascalMatrix-B.svg)

* * *

See also: binomial, pascalTriangle, table

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PascalMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Pascal_matrix)
