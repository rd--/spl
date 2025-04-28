# lagPlot

- _lagPlot(y, k)_

Answer a lag plot of the univariate numeric data at the list _y_,
with delay _k_.

Plot data that exhibits a linear pattern,
showing the data are non-random,
and suggesting an autoregressive model:

~~~spl svg=A
let d = system.nistData('MAVRO');
(d * 10).lagPlot(1)
~~~

![](sw/spl/Help/Image/lagPlot-A.svg)

Plot of two hundred normal random numbers showing that
the data are random,
exhibit no autocorrelation,
amd contain no outliers:

~~~spl svg=B
system.nistData('NORMAL2')
.lagPlot(1)
~~~

![](sw/spl/Help/Image/lagPlot-B.svg)

A circular pattern in a lag plot indicates that a sinusoidal model might be appropriate:

~~~spl svg=C
system.nistData('LEW')
.lagPlot(1)
~~~

![](sw/spl/Help/Image/lagPlot-C.svg)

A lag plot of data from an underlying autoregressive model with moderate positive autocorrelation,
the data contain no outliers:

~~~spl svg=D
system.nistData('FLICKER')
.lagPlot(1)
~~~

![](sw/spl/Help/Image/lagPlot-D.svg)

A lag plot of data from an underlying autoregressive model with strong positive autocorrelation,
the data contain no outliers:

~~~spl svg=E
system.nistData('RANDWALK')
.lagPlot(1)
~~~

![](sw/spl/Help/Image/lagPlot-E.svg)

* * *

See also: scatterPlot

Guides: Plotting Functions

References:
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/lagplot.htm)
