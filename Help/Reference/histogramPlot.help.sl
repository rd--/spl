# histogramPlot

- _histogramPlot(x)_

Plot a histogram of the values at _x_.

Generate a histogram for a list of values:

~~~spl svg=A
let r = Sfc32(368714);
NormalDistribution(0, 1)
.randomVariate(r, [200])
.histogramPlot
~~~

![](sw/spl/Help/Image/histogramPlot-A.svg)

A histogram of empirical data following a normal distribution:

~~~spl svg=B
system.nistData('ZARR')
.histogramPlot
~~~

![](sw/spl/Help/Image/histogramPlot-B.svg)


A histogram of empirical data following a symmetric bimodal distribution:

~~~spl svg=C
system.nistData('LEW')
.histogramPlot
~~~

![](sw/spl/Help/Image/histogramPlot-C.svg)

* * *

See also: binCounts, discretePlot, histogramList, pdf, tally

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Histogram.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/histogra.htm),
_W_
[1](https://en.wikipedia.org/wiki/Histogram)
