# gaussianMatrix

- _gaussianMatrix(r, sigma)_

Answer a matrix corresponding to a Gaussian kernel with radius _r_ and standard deviation σ.

Compute and plot a square Gaussian matrix:

~~~spl svg=A
10.gaussianMatrix(5).matrixPlot
~~~

![](sw/spl/Help/Image/gaussianMatrix-A.svg)

Compute and plot a rectangular Gaussian matrix:

~~~spl svg=B
[2 10].gaussianMatrix([1 5]).matrixPlot
~~~

![](sw/spl/Help/Image/gaussianMatrix-B.svg)

The matrix is symmetrical, print upper left quadrant:

```
>>> 2.gaussianMatrix(1)
>>> .submatrix(1:3, 1:3)
[
	0.002969 0.013306 0.021938;
	0.013306 0.059634 0.098320;
	0.021938 0.098320 0.162103
]
```

The matrix sums to `one`:

```
>>> 2.gaussianMatrix(1).deepSum
1
```

Compute and plot a Gaussian vector:

~~~spl svg=C
20.gaussianVector(2).discretePlot
~~~

![](sw/spl/Help/Image/gaussianMatrix-C.svg)

* * *

See also: differences, diskMatrix, exp, gaussianVector, NormalDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GaussianMatrix.html)
