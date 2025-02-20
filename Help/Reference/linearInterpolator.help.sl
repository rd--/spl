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

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
let f:/1 = x.linearInterpolator(y);
(0 -- 2).functionPlot(f:/1)
~~~

![](sw/spl/Help/Image/linearInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
let f:/1 = x.linearInterpolator(y);
(-0.25 -- 2.25).functionPlot(f:/1)
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

* * *

See also: akimaInterpolator, cubicSplineInterpolator, nearestNeighborInterpolator
