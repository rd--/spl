# cobwebPlot

- _cobwebPlot(f:/1, a₀, n)_

Answer a plot of the first _n_ terms of the iterative equation _f_ starting at initial value _a₀_.

Plot the first few terms of the logistic map with _r=3.741_ and _a₀=0.00079_:

~~~spl svg=A
logisticMap(3.741)
.cobwebPlot(0.00079, 23)
~~~

![](sw/spl/Help/Image/cobwebPlot-A.svg)

With _r=4_:

~~~spl svg=B
logisticMap(4)
.cobwebPlot(0.00079, 23)
~~~

![](sw/spl/Help/Image/cobwebPlot-B.svg)

* * *

See also: linePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WebDiagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Cobweb_plot)
