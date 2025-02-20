# nearestNeighborInterpolator

- _nearestNeighborInterpolator(x, y)_

Answer a `Block` that computes a nearest neighbor interpolation for the dataset given by _x_ and _y_.

The value of the function at each of the input _x_ values equals the corresponding _y_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> x.collect(
>>> 	x.nearestNeighborInterpolator(y)
>>> )
y
```

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> [0 0.025 0.075 0.1].collect(
>>> 	x.nearestNeighborInterpolator(y)
>>> )
[0 0 0.3 0.3]
```

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(0 -- 2).functionPlot(
	x.nearestNeighborInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighborInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(-0.25 -- 2.25).functionPlot(
	x.nearestNeighborInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighborInterpolator-B.svg)

Nearest neighbor impulse response:

~~~spl svg=C
let x = [1 2 3 4 5];
let y = [0 0 1 0 0];
(1 -- 5).functionPlot(
	x.nearestNeighborInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighborInterpolator-C.svg)

* * *

See also: akimaInterpolator, catmullRomInterpolation, cubicSplineInterpolator, linearInterpolator
