# periodogramPlot

- _periodogramPlot(y)_

Plot the squared magnitude of the discrete Fourier transform (power spectrum) of the list _y_.

Power spectrum of a noisy dataset:

~~~spl svg=A
let r = Sfc32(318642);
let n = r.randomReal([-1 1], [128]);
let s = 0:127.collect { :n |
	(2 * (0.2.pi * n).sin) + (0.5.pi * n).sin
};
(s + n).periodogramPlot
~~~

![](sw/spl/Help/Image/periodogramPlot-A.svg)

* * *

See also: dirichletWindow, fft, fftPlot, periodogramArray, spectralPlot

Guides: Fourier Analysis Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Periodogram.html),
_W_
[1](https://en.wikipedia.org/wiki/Periodogram)
[2](https://en.wikipedia.org/wiki/Bartlett%27s_method)
[3](https://en.wikipedia.org/wiki/Welch%27s_method)
