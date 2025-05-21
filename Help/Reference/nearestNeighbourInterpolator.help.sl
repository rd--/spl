# nearestNeighbourInterpolator

- _nearestNeighbourInterpolator(x, y)_

Answer a `Block` that computes a nearest neighbour interpolation for the dataset given by _x_ and _y_.

The value of the function at each of the input _x_ values equals the corresponding _y_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> x.collect(
>>> 	x.nearestNeighbourInterpolator(y)
>>> )
y
```

Interpolated _x_ values read the _y_ value at the nearest specified _x_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> [0 0.025 0.075 0.1].collect(
>>> 	x.nearestNeighbourInterpolator(y)
>>> )
[0 0 0.3 0.3]
```

Resample a six-place vector to nine places using nearest-neighbour interpolation:

```
>>> let x = [1 2 3 4 5 6];
>>> let y = [1 4 7 4 3 6];
>>> (1 -- 6).discretize(9).collect(
>>> 	x.nearestNeighbourInterpolator(y)
>>> )
[1 4 4 7 4 4 3 6 6]
```

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(0 -- 2).functionPlot(
	x.nearestNeighbourInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighbourInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(-0.25 -- 2.25).functionPlot(
	x.nearestNeighbourInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighbourInterpolator-B.svg)

Nearest neighbour impulse response:

~~~spl svg=C
let x = [1 2 3 4 5];
let y = [0 0 1 0 0];
(1 -- 5).functionPlot(
	x.nearestNeighbourInterpolator(y)
)
~~~

![](sw/spl/Help/Image/nearestNeighbourInterpolator-C.svg)

* * *

See also: akimaInterpolator, catmullRomInterpolation, cubicSplineInterpolator, linearInterpolator

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_W_
[1](https://en.wikipedia.org/wiki/Nearest-neighbor_interpolation)
