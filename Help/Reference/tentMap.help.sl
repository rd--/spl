# tentMap

- _tentMap(μ)_

A piecewise linear, one-dimensional map on the interval _(0,1)_ exhibiting chaotic dynamics.

Plot small iteration count where _μ=1.9_ and _x₀=0.4_:

~~~spl svg=A
tentMap(1.9)
.nestList(0.4, 99)
.linePlot
~~~

![](sw/spl/Help/Image/tentMap-A.svg)

Plot the above parameters as _(x[n], x[n+1])_:

~~~spl svg=B
let x0 = 0.4;
let y = tentMap(1.9).nestList(x0, 99);
let x = [x0] ++ y.allButLast;
[x, y].transposed.scatterPlot
~~~

![](sw/spl/Help/Image/tentMap-B.svg)

* * *

See also: bakersMap, logisticMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TentMap.html),
_Meier_
[1](http://www.3d-meier.de/tut19/Seite100.html),
_W_
[1](https://en.wikipedia.org/wiki/Tent_map)
