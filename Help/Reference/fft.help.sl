# fft

- _fft(aList)_

Compute the discrete Fourier transform (DFT) of _aList_ using a fast Fourier transform (FFT) algorithm.
The answer is the same size as _aList_.

For real input the answer is symmetrical:

```
>>> [1 1 2 2 1 1 0 0].fft
[
	8J0 -1.4142J-3.4142
	0J0 1.4142J0.5858
	0J0 1.4142J-0.5858
	0J-0 -1.4142J3.4142
]

>>> [1 1 2 2 1 1 0 0].fft.abs
[8 3.6955 0 1.5307 0 1.5307 0 3.6955]
```

The inverse transform is `ifft`:

```
>>> [1 1 2 2 1 1 0 0].fft.ifft
[1 1 2 2 1 1 0 0]
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
let y = Sfc32(378614).randomReal(-1, 1, [n]);
((x + y).fft.take(m) / n).abs.linePlot
~~~

![](sw/spl/Help/Image/fft-B.svg)

* * *

See also: convolve, fftConvolve, ifft, Complex

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Fourier.html),
_Matlab_
[1](https://au.mathworks.com/help/matlab/ref/fft.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#-fft)

Categories: Fourier
