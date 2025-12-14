# lambdomaMatrix

- _lambdomaMatrix(m, n)_

Answer the _m×n_ lambdoma matrix.
Rows are harmonic series, columns are subharmonic series.

```
>>> [9 9].lambdomaMatrix
[
	1/1 2/1 3/1 4/1 5/1 6/1 7/1 8/1 9/1;
	1/2 1/1 3/2 2/1 5/2 3/1 7/2 4/1 9/2;
	1/3 2/3 1/1 4/3 5/3 2/1 7/3 8/3 3/1;
	1/4 1/2 3/4 1/1 5/4 3/2 7/4 2/1 9/4;
	1/5 2/5 3/5 4/5 1/1 6/5 7/5 8/5 9/5;
	1/6 1/3 1/2 2/3 5/6 1/1 7/6 4/3 3/2;
	1/7 2/7 3/7 4/7 5/7 6/7 1/1 8/7 9/7;
	1/8 1/4 3/8 1/2 5/8 3/4 7/8 1/1 9/8;
	1/9 2/9 1/3 4/9 5/9 2/3 7/9 8/9 1/1
]
```

Log scale matrix plot of _12×12_ matrix:

~~~spl svg=A
[12 12].lambdomaMatrix
.logScale
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-A.svg)

Matrix plot of the numerators of the _12×12_ matrix:

~~~spl svg=B
[12 12].lambdomaMatrix
.numerator
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-B.svg)

Matrix plot of the denominators of the _12×12_ matrix:

~~~spl svg=C
[12 12].lambdomaMatrix
.denominator
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-C.svg)

* * *

See also: Fraction, swap, table

Guides: Matrix Functions

Further Reading: Hero 1999
