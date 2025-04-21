# akimaInterpolator

- _akimaInterpolator(x, y)_

Answer a `Block` that computes a cubic spline interpolation for the data set given by _x_ and _y_ using the Akima algorithm.

The value of the function at each of the input _x_ values equals the corresponding _y_ value:

```
>>> let x = [0 0.1 0.5 1 2];
>>> let y = [0 0.3 0.6 -0.2 3];
>>> let f:/1 = x.akimaInterpolator(y);
>>> x.collect(f:/1)
y
```

Plot an interpolation over the specified _x_ range:

~~~spl svg=A
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
let f:/1 = x.akimaInterpolator(y);
(0 -- 2).functionPlot(f:/1)
~~~

![](sw/spl/Help/Image/akimaInterpolator-A.svg)

Plot an interpolation extrapolating beyond the specified _x_ range:

~~~spl svg=B
let x = [0 0.1 0.5 1 2];
let y = [0 0.3 0.6 -0.2 3];
let f:/1 = x.akimaInterpolator(y);
(-0.25 -- 2.25).functionPlot(f:/1)
~~~

![](sw/spl/Help/Image/akimaInterpolator-B.svg)

Akima impulse response:

~~~spl svg=C
let x = [1 2 3 4 5];
let y = [0 0 1 0 0];
(1 -- 5).functionPlot(
	x.akimaInterpolator(y)
)
~~~

![](sw/spl/Help/Image/akimaInterpolator-C.svg)

Plot an interpolation of a data set consisting of flat areas (horizontal lines):

~~~spl svg=D
let y = [1 1 1 0 0 1 1 2 2 2 2];
let k = y.size;
let x = [1 .. k];
(1 -- k).functionPlot(
	x.akimaInterpolator(y)
)
~~~

![](sw/spl/Help/Image/akimaInterpolator-D.svg)

Plot an interpolation of a data set consisting of flat areas (horizontal lines):

~~~spl svg=E
let y = [-1 -1 -1 0 1 1 1];
let k = y.size;
let x = [1 .. k];
(1 -- k).functionPlot(
	x.akimaInterpolator(y)
)
~~~

![](sw/spl/Help/Image/akimaInterpolator-E.svg)

Interpolate a cosine curve over unevenly spaced sample points:

~~~spl svg=F
let x = [0 1 2.5 3.6 5 7 8.1 10];
let y = cos(x);
(0 -- 10).functionPlot(
	x.akimaInterpolator(y)
)
~~~

![](sw/spl/Help/Image/akimaInterpolator-F.svg)

* * *

See also: cubicSplineInterpolator, linearInterpolator, nearestNeighborInterpolator

Guides: Interpolation Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/makima.html),
_W_
[1](https://en.wikipedia.org/wiki/Akima_spline)

Further Reading: Akima 1970
