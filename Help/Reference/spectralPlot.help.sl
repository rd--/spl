# spectralPlot

- _spectralPlot(x)_

Answer a plot of a smoothed Fourier transform of _x_.

Plot data showing one dominant frequency:

~~~spl svg=A
system.nistData('LEW', [1])
.spectralPlot
~~~

![](sw/spl/Help/Image/spectralPlot-A.svg)

Plot data with no dominant peaks and no identifiable pattern in the spectrum:

~~~spl svg=B
system.nistData('NORMAL2', [1])
.spectralPlot
~~~

![](sw/spl/Help/Image/spectralPlot-B.svg)

* * *

See also: gaussianFilter, fft

Guides: Plotting Functions

References:
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/spectrum.htm)
