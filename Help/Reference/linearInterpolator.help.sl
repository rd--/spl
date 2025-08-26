# linearInterpolator

- _linearInterpolator(x, y)_

Answer a `Block` that computes a linear interpolation for the dataset given by _x_ and _y_.

The value of the function at each of the input _x_ values equals the corresponding _y_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> let f:/1 = x.linearInterpolator(y);
>>> x.collect(f:/1)
y
```

Interpolate a two-column matrix:

```
>>> let x = [0 0.5 1];
>>> let y = [0 1; 0.25 0.25; 1 1];
>>> let f:/1 = x.linearInterpolator(y);
>>> (0, 0.25 .. 1).collect(f:/1)
[
	0.000 1.000;
	0.125 0.625;
	0.250 0.250;
	0.625 0.625;
	1.000 1.000
]
```

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(0 -- 2).functionPlot(
	x.linearInterpolator(y)
)
~~~

![](sw/spl/Help/Image/linearInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
(-0.25 -- 2.25).functionPlot(
	x.linearInterpolator(y)
)
~~~

![](sw/spl/Help/Image/linearInterpolator-B.svg)

Linear impulse response:

~~~spl svg=C
let x = [1 2 3 4 5];
let y = [0 0 1 0 0];
(1 -- 5).functionPlot(
	x.linearInterpolator(y)
)
~~~

![](sw/spl/Help/Image/linearInterpolator-C.svg)

Discrete plot of sin function at sixty-four random values in _(0, 2π)_:

~~~spl svg=D
let r = Sfc32(361782);
let x = r.randomReal([0 2.pi], [64]).sort;
[x x.sin].transpose.discretePlot
~~~

![](sw/spl/Help/Image/linearInterpolator-D.svg)

The same set linearly interpolated:

~~~spl svg=E
let r = Sfc32(361782);
let x = r.randomReal([0 2.pi], [64]).sort;
(0 -- 2.pi).discretize(64).collect(
	x.linearInterpolator(x.sin)
).discretePlot
~~~

![](sw/spl/Help/Image/linearInterpolator-E.svg)

* * *

See also: akimaInterpolator, cubicSplineInterpolator, nearestNeighbourInterpolator

Guides: Interpolation Functions
