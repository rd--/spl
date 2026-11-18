# ackleyFunction

- _ackleyFunction(a=20.0, b=0.2, c=2π)_

Answer the Ackley test function.

Matrix plot, rounded:

~~~spl png=A
let k = 100;
let i = (-2.5 -- 2.5).subdivide(k);
let f/1 = ackleyFunction(20.0, 0.2, 2.pi);
{ :x :y |
	f([x, y])
}.table(i, i)
.rescale
.round(0.1)
.Greymap
~~~

![](Help/Image/ackleyFunction-A.png)

Contour plot of sparse sampling:

~~~spl svg=B
let k = 20;
let i = (-2.5 -- 2.5).subdivide(k);
let f/1 = ackleyFunction(20.0, 0.2, 2.pi);
{ :x :y |
	f([x y])
}.contourPlot(i, i, [1.0 3.0 5.0 7.0])
~~~

![](Help/Image/ackleyFunction-B.svg)

* * *

See also: griewankFunction, himmelblausFunction

Guides: Numerical Methods

References:
_W_
[1](https://en.wikipedia.org/wiki/Ackley_function)
