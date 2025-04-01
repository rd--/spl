# Window Functions

> An apodization function (also called a tapering function or window
> function) is a function used to smoothly bring a sampled signal down
> to zero at the edges of the sampled region. This suppresses leakage
> sidelobes which would otherwise be produced upon performing a
> discrete Fourier transform, but the suppression is at the expense of
> widening the lines, resulting in a decrease in the resolution. (Weisstein, E.)

- `bartlettHannWindow`: Bartlett-Hann
- `bartlettWindow`: Bartlett
- `blackmanWindow`: Blackman
- `blackmanHarrisWindow`: Blackman-Harris
- `cosineWindow`: Cosine
- `dirichletWindow`: Dirichlet
- `gaussianWindow`: Gaussian
- `hammingWindow`: Hamming
- `hannWindow`: Hann
- `kaiserWindow`: Kaiser
- `lanczosWindow`: Lanczos
- `welchWindow`: Welch

## Window Table Functions

- `hammingWindowTable`: Hamming
- `hannWindowTable`: Hann
- `kaiserWindowTable`: Kaiser
- `welchWindowTable`: Welch

* * *

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ApodizationFunction.html)
[2](https://reference.wolfram.com/language/guide/WindowFunctions.html)
