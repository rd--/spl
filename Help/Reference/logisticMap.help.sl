# logisticMap

- _logisticMap(r)_

A discrete dynamical system defined by a quadratic difference equation.

Plot first few terms at _r=3.6_:

~~~spl svg=A
logisticMap(3.6)
.nestList(0.5, 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/logisticMap-A.svg)

Plot first few terms at _r=3.7_:

~~~spl svg=B
logisticMap(3.7)
.nestList(0.5, 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/logisticMap-B.svg)

Plot first few terms at _r=3.9_:

~~~spl svg=C
logisticMap(3.9)
.nestList(0.5, 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/logisticMap-C.svg)

Poincaré plot of first few terms at _r=3.99_:

~~~spl svg=D
logisticMap(3.99)
.nestList(0.5, 99)
.poincarePlot
~~~

![](sw/spl/Help/Image/logisticMap-D.svg)

Plot laminar and burst behaviour within first few terms at _r=3.828327_:

~~~spl svg=E
logisticMap(3.828327)
.nestList(0.5, 200)
.scatterPlot
~~~

![](sw/spl/Help/Image/logisticMap-E.svg)

The first few terms for _r=-2_ and _a₀=0.31_:

~~~spl svg=F
logisticMap(-2)
.nestList(0.31, 50)
.linePlot
~~~

![](sw/spl/Help/Image/logisticMap-F.svg)

The first few terms for _r=-4_ and _a₀=0.42_,
equivalent to the `tentMap` with _μ=1_:

~~~spl svg=G
logisticMap(4)
.nestList(0.42, 50)
.linePlot
~~~

![](sw/spl/Help/Image/logisticMap-G.svg)

Cobweb plot of first few terms with _r=3.741_ and _a₀=0.00079_:

~~~spl svg=H
logisticMap(3.741)
.cobwebPlot(0.00079, 13)
~~~

![](sw/spl/Help/Image/logisticMap-H.svg)

* * *

See also: henonMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogisticMap.html)
_Meier_
[1](http://www.3d-meier.de/tut19/Seite156.html),
_W_
[1](https://en.wikipedia.org/wiki/Logistic_map)
