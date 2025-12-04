# densityHistogramPlot

- _densityHistogramPlot(m, b₁, b₂)_

Plots a density histogram of the _(x,y)_ values at the matrix _m_,
according to the bin specifications _b₁_ and _b₂_,
which may be elided.

Visualize the density of two-dimensional normal noise data,
derive bins automatically:

~~~spl svg=A
let r = Sfc32(918041);
NormalDistribution(0, 2)
.randomVariate(r, [2000 2])
.densityHistogramPlot
~~~

![](sw/spl/Help/Image/densityHistogramPlot-A.svg)

Visualize the density of two-dimensional normal noise data,
specifying bins:

~~~spl svg=B
let r = Sfc32(678314);
BinormalDistribution([0 0], [1 1], 0.5)
.randomVariate(r, [50])
.densityHistogramPlot(
	[-3 3 0.5],
	[-3 3 0.5]
)
~~~

![](sw/spl/Help/Image/densityHistogramPlot-B.svg)

Histogram plot of four discrete values,
asymetrical to show that the _x_-axis is left to right,
and the _y_-axis is ascending:

~~~spl svg=C
[-3 0; 0 -1; 0 0; 3 3]
.densityHistogramPlot(
	[-3 3 0.5],
	[-3 3 0.5]
)
~~~

![](sw/spl/Help/Image/densityHistogramPlot-C.svg)

* * *

See also: binCounts, histogramPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DensityHistogram.html),
_Python_
[1](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.hist2d.html)
