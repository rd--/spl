# fftShift

- _fftShift([x₁ x₂ …])_

Shift the zero-frequency component to the center of the spectrum.

Swap the left and right halves of a vector.
If a vector has an odd number of elements,
then the middle element is considered part of the left half of the vector:

```
>>> [1 2 3 4 5 6].fftShift
[4 5 6 1 2 3]

>>> [1 2 3 4 5 6 7].fftShift
[5 6 7 1 2 3 4]
```

Calling `fftShift` twice does not necessarily reconstruct the original input:

```
>>> [1 2 3 4 5 6].fftShift.fftShift
[1 2 3 4 5 6]

>>> [1 2 3 4 5 6 7].fftShift.fftShift
[2 3 4 5 6 7 1]
```

Shift calculated frequencies:

```
>>> 10.fftFrequencies(0.1).fftShift
[-5 -4 -3 -2 -1 0 1 2 3 4]
```

* * *

See also: fft, fftFrequencies

Guides: Fourier Analysis Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/fftshift.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.fft.fftshift.html)
