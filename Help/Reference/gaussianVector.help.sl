# gaussianVector

- _gaussianVector(r, sigma)_

Answer a `List` corresponding to a one-dimensional Gaussian kernel with radius _r_ and standard deviation σ.

Compute and plot a Gaussian vector:

~~~spl svg=A
20.gaussianVector(10).discretePlot
~~~

![](sw/spl/Help/Image/gaussianVector-A.svg)

The vector sums to `one`:

```
>>> 20.gaussianVector(10).sum
1
```

* * *

See also: gaussianMatrix
