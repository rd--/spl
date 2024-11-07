# ifft

- _ifft(aList)_

Compute the inverse discrete Fourier transform (DFT) of _aList_ using a fast Fourier transform (FFT) algorithm.
The answer is the same size as _aList_.

The input and output lists are complex.

```
>>> let x = [1 1 2 2 1 1 0 0].fft;
>>> let y = x.ifft;
>>> (x.take(4), y)
(
	[8J0 -1.4142J-3.4142 0J0 1.4142J0.5858],
	[1 1 2 2 1 1 0 0]
)
```

* * *

See also: fft, Complex

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseFourier.html),
_Matlab_
[1](https://au.mathworks.com/help/matlab/ref/ifft.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#-ifft)
