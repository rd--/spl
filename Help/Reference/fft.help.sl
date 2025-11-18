# fft

- _fft(x, n)_

Compute the discrete Fourier transform (DFT) of the list _x_ using a fast Fourier transform (FFT) algorithm.
The answer is the same size as _x_.
If _n_ is given the list _x_ is zero-padded to be of size _n_.

For real input the answer is symmetrical:

```
>>> [1 1 2 2 1 1 0 0].fft
[
	8J0 -1.4142J-3.4142
	0J0 1.4142J0.5858
	0J0 1.4142J-0.5858
	0J-0 -1.4142J3.4142
]

>>> [0 1 0 0].fft
[1J0 0J-1 -1J0 0J1]

>>> [1 1 2 2 1 1 0 0].fft.abs
[8 3.6955 0 1.5307 0 1.5307 0 3.6955]
```

Complex input:

```
>>> (0J2 * 1.pi * 0:7 / 8).exp.fft
[0J0 8J0 0J0 0J0 0J0 0J0 0J0 0J0]
```

The inverse transform is `ifft`:

```
>>> [1 1 2 2 1 1 0 0].fft.ifft
[1 1 2 2 1 1 0 0]

>>> [1J0 0J-1 -1J0 0J1].ifft
[0 1 0 0]
```

Plot complete symmetrical spectrum of two sine tones:

~~~spl svg=A
let n = 256;
let p = (0 -- 2.pi).discretize(n);
let x = p.collect { :x |
	(x * [23 47]).sin.sum / 2
};
(x.fft / n).abs.linePlot
~~~

![](sw/spl/Help/Image/fft-A.svg)

Plot half spectrum of two sine tones with added white noise:

~~~spl svg=B
let n = 256;
let m = n / 2;
let p = (0 -- 2.pi).discretize(n);
let x = p.collect { :x |
	(x * [23 47]).sin.sum / 2
};
let r = Sfc32(378614);
let y = r.randomReal([-1 1], [n]);
((x + y).fft.first(m) / n).abs.linePlot
~~~

![](sw/spl/Help/Image/fft-B.svg)

Plot 1/8 spectrum of five octaves of sine tones at increasing amplitudes:

~~~spl svg=C
let n = 512;
let m = n // 8;
let x = (0 -- 0.5).discretize(n);
let y = x.collect { :t |
	[1 .. 5].collect { :n |
		n * (n * 10 * 2.pi * t).cos
	}.sum
};
(y.fft.first(m) / n).abs.discretePlot
~~~

![](sw/spl/Help/Image/fft-C.svg)

* * *

See also: convolve, fftConvolve, ifft, Complex

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Fourier.html),
_Matlab_
[1](https://mathworks.com/help/matlab/ref/fft.html),
_Python_
[1](https://docs.scipy.org/doc/scipy-1.15.3/reference/generated/scipy.fft.fft.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#-fft)

Categories: Fourier
