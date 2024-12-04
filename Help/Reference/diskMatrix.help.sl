# diskMatrix

- _diskMatrix(radius)_

Answer a matrix whose elements are 1 in a disk-shaped region that extends _r_ index positions to each side, and are 0 otherwise.

A _15×15_ disk matrix:

```
>>> 7.diskMatrix
[
	0 0 0 0 0 1 1 1 1 1 0 0 0 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 0 0 0 1 1 1 1 1 0 0 0 0 0
]
```

A _21×21_ disk matrix:

```
>>> 10.diskMatrix
[
	0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0;
	0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
	0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
	0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
	0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0
]
```

Plot the 12×12 disk matrix:

~~~
12.diskMatrix.matrixPlot
~~~

* * *

See also: boxMatrix, crossMatrix, diamondMatrix, euclideanDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiskMatrix.html)

Categories: Math, Matrix
