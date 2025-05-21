# cubicSplineInterpolator

- _cubicSplineInterpolator(x, y)_

Answer a `Block` that computes a natural (also known as a free or unclamped) cubic spline interpolation for the dataset given by _x_ and _y_.

The value of the function at each of the input _x_ values equals the corresponding _y_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> x.collect(
>>> 	x.cubicSplineInterpolator(y)
>>> )
y
```

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(0 -- 2).functionPlot(
	x.cubicSplineInterpolator(y)
)
~~~

![](sw/spl/Help/Image/cubicSplineInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(-0.25 -- 2.25).functionPlot(
	x.cubicSplineInterpolator(y)
)
~~~

![](sw/spl/Help/Image/cubicSplineInterpolator-B.svg)

Cubic spline impulse response:

~~~spl svg=C
let x = [1 2 3 4 5];
let y = [0 0 1 0 0];
(1 -- 5).functionPlot(
	x.cubicSplineInterpolator(y)
)
~~~

![](sw/spl/Help/Image/cubicSplineInterpolator-C.svg)

* * *

See also: akimaInterpolator, linearInterpolator, nearestNeighbourInterpolator

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Spline_interpolation)

Further Reading: Burden 1989
