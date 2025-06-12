# fftPlot

- _fftPlot(y, n, v, s)_

Plot the _n_-place `fft` of the real valued signal _y_.
_v_ should be either 'Half' or 'Centred',
_s_ should be either 'Linear' or 'Logarithmic'.

Plot the frequency response of the Hamming window,
in centred form with logarithmic scaling:

~~~spl svg=A
51.hammingWindowTable
.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/fftPlot-A.svg)

Plot the `fft` of a square wave,
in half form with linear scaling:

~~~spl svg=B
[0, 0.02 .. 1].squareWave
.fftPlot(512, 'Half', 'Linear')
~~~

![](sw/spl/Help/Image/fftPlot-B.svg)

* * *

See also: fft, periodogramPlot, spectralPlot

Guides: Fourier Analysis Functions, Plotting Functions
