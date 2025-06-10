# fftFrequencies

- _fftFrequencies(n, d=1)_

Answer the Discrete Fourier Transform sample frequencies.
_d_ specifies the sampling spacing, which is the inverse of the sampling rate.

With even _n_:

```
>>> 8.fftFrequencies(1 / 10)
[0 1.25 2.5 3.75 -5 -3.75 -2.5 -1.25]
```

With odd _n_:

```
>>> 7.fftFrequencies(1 / 7)
[0 1 2 3 -3 -2 -1]
```

* * *

See also: fft, fftShift

Guides: Fourier Analysis Functions

References:
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.fft.fftfreq.html)
