# dft

- _dft(x)_

Answer the discrete Fourier transform of _x_.

Plot the discrete Fourier transform of a cosine signal:

~~~spl svg=A
let n = 200;
(0 -- 23.pi)
.discretize(n)
.cos
.dft
.take(n / 2)
.abs
.linePlot
~~~

![](sw/spl/Help/Image/dft-A.svg)

* * *

See also: fft

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiscreteFourierTransform.html),
_W_
[1](https://en.wikipedia.org/wiki/Discrete_Fourier_transform)
