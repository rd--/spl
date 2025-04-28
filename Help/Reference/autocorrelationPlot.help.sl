# autocorrelationPlot

- _autocorrelationPlot(y, k)_

An autocorrelation plot of time series that is not random,
but rather has a high degree of autocorrelation between adjacent and near-adjacent observations:

~~~spl svg=A
system.nistData('FLICKER')
.autocorrelationPlot(250)
~~~

![](sw/spl/Help/Image/autocorrelationPlot-A.svg)

An autocorrelation plot of uniformly random data,
there are no significant autocorrelations:

~~~spl svg=B
system.nistData('RANDU')
.autocorrelationPlot(250)
~~~

![](sw/spl/Help/Image/autocorrelationPlot-B.svg)

An autocorrelation plot of data from an underlying autoregressive model with strong positive autocorrelation:

~~~spl svg=C
system.nistData('RANDWALK')
.autocorrelationPlot(125)
~~~

![](sw/spl/Help/Image/autocorrelationPlot-C.svg)

An autocorrelation plot of data from an underlying sinusoidal model:

~~~spl svg=D
system.nistData('LEW')
.autocorrelationPlot(50)
~~~

![](sw/spl/Help/Image/autocorrelationPlot-D.svg)

An autocorrelation plot of a regular time series giving the luteinizing hormone in blood samples at ten minute intervals,
if _k_ is not specified it is selected automatically:

~~~spl svg=E
[
	2.4 2.4 2.4 2.2 2.1 1.5 2.3 2.3 2.5 2.0
	1.9 1.7 2.2 1.8 3.2 3.2 2.7 2.2 2.2 1.9
	1.9 1.8 2.7 3.0 2.3 2.0 2.0 2.9 2.9 2.7
	2.7 2.3 2.6 2.4 1.8 1.7 1.5 1.4 2.1 3.3
	3.5 3.5 3.1 2.6 2.1 3.4 3.0 2.9
].autocorrelationPlot
~~~

![](sw/spl/Help/Image/autocorrelationPlot-E.svg)

* * *

See also: correlationFunction, discretePlot

Guides: Plotting Functions

References:
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/autocopl.htm),
_R_
[1](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/acf.html)
