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
system.nistData('ZARR13', [1])
.histogramPlot([9.1 9.4 0.01])
~~~

![](sw/spl/Help/Image/histogramPlot-B.svg)

A histogram of empirical data following a symmetric bimodal distribution:

~~~spl svg=C
system.nistData('LEW', [1])
.histogramPlot([-2000 2000 50])
~~~

![](sw/spl/Help/Image/histogramPlot-C.svg)

A histogram of empirical data following a bimodal distribution,
due to a mixture of probability models:

~~~spl svg=D
system.nistData('ZARR14', [1])
.histogramPlot([8.9 9.5 0.01])
~~~

![](sw/spl/Help/Image/histogramPlot-D.svg)

A histogram of empirical data with a non-normal right-skewed distribution:

~~~spl svg=E
system.nistData('SUNSPOT', [1])
.histogramPlot([-200 300 10])
~~~

![](sw/spl/Help/Image/histogramPlot-E.svg)

A histogram of empirical data with a non-symmetric left-skewed distribution:

~~~spl svg=F
system.nistData('MORALES', [1])
.histogramPlot([22.5 23.1 0.01])
~~~

![](sw/spl/Help/Image/histogramPlot-F.svg)

A histogram of a Tukey-Lambda random variate with shape parameter 1.1,
having a symmetric non-normal short-tailed distribution:

~~~spl svg=G
system.nistData('TUKLAMB', [1])
.histogramPlot([-4 4 0.1])
~~~

![](sw/spl/Help/Image/histogramPlot-G.svg)

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
