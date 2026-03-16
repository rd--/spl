# denseScatterPlot

- _denseScatterPlot([c₁ c₂ …], [w=250 h=155])_

Plot a sequence of _x,y_ coordinates _c_, each drawn as a point.
The drawing is a `Bitmap` of the specified size.
Values are scaled to lie in the bitmap and rounded to the nearest matrix cell.
The _x_-coordinates may be elided, in which case they are taken to be integer indices.

Stern’s diatomic series,
OEIS [A002487](https://oeis.org/A002487):

~~~spl png=A oeis=A002487
1500.sternBrocotSequence
.denseScatterPlot
~~~

![](sw/spl/Help/Image/denseScatterPlot-A.png)

First differences of Stern’s diatomic series,
discarding initial two terms,
OEIS [A070990](https://oeis.org/A070990):

~~~spl png=B oeis=A070990 signed
1500.sternBrocotSequence
.allButFirst(2)
.differences
.denseScatterPlot
~~~

![](sw/spl/Help/Image/denseScatterPlot-B.png)

Second differences of Stern’s diatomic series,
OEIS [A283104](https://oeis.org/A283104):

~~~spl png=C oeis=A283104 signed
1500.sternBrocotSequence
.differences(2)
.denseScatterPlot
~~~

![](sw/spl/Help/Image/denseScatterPlot-C.png)

* * *

See also: scatterPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScatterDiagram.html)
[2](https://reference.wolfram.com/language/ref/ListPlot.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/scatterp.htm),
_W_
[1](https://en.wikipedia.org/wiki/Scatter_plot)

Categories: Plotting
