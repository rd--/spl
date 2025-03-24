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

* * *

See also: binCounts, discretePlot, histogramList, pdf, tally

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Histogram.html)
