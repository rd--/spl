# fft

- _fft(aList)_

Compute the discrete Fourier transform (DFT) of _aList_ using a fast Fourier transform (FFT) algorithm.
The answer is the same size as _aList_.

For real input the answer is symetrical:

```
>>> [1 1 2 2 1 1 0 0].fft
[
	8J0 -1.4142J-3.4142 0J0 1.4142J0.5858
	0J0 1.4142J-0.5858 0J-0 -1.4142J3.4142
]

>>> [1 1 2 2 1 1 0 0].fft.abs
[8 3.6955 0 1.5307 0 1.5307 0 3.6955]
```

Plot complete symmetrical spectrum of two sine tones:

~~~
let n = 512;
let p = (0 -- 2.pi).discretize(n);
let x = p.collect { :x | (x * [23 47]).sin.sum };
(x.fft / n).abs.linePlot
~~~

Plot half spectrum of white noise:

~~~
let n = 512;
let x = system.randomReal(-1, 1, [n]);
let m = n / 2;
(x.fft.take(m) / n).abs.linePlot
~~~

* * *

See also: Complex

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Fourier.html),
_Matlab_
[1](https://au.mathworks.com/help/matlab/ref/fft.html)
