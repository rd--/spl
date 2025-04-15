# Window Functions

> An apodization function (also called a tapering function or window
> function) is a function used to smoothly bring a sampled signal down
> to zero at the edges of the sampled region.

- `bartlettWindow`: Bartlett
- `bartlettHannWindow`: Bartlett-Hann
- `blackmanWindow`: Blackman
- `blackmanHarrisWindow`: Harris
- `cosineWindow`: Cosine
- `dirichletWindow`: Dirichlet
- `gaussianWindow`: Gaussian
- `hammingWindow`: Hamming
- `hannWindow`: Hann
- `kaiserWindow`: Kaiser
- `lanczosWindow`: Lanczos
- `welchWindow`: Welch

_Note:_ The Bartlett window is triangular,
the Dirichlet window is rectangular.

## Window Table Functions

- `hammingWindowTable`: Hamming
- `hannWindowTable`: Hann
- `kaiserWindowTable`: Kaiser
- `welchWindowTable`: Welch

## Kernel Functions

- `dirichletKernel`: Dirichlet
- `epanechnikovKernel`: Epanechnikov
- `fejerKernel`: Fejér
- `gaussianKernel`: Gaussian
- `lanczosKernel`: Lanczos

* * *

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ApodizationFunction.html)
[2](https://reference.wolfram.com/language/guide/WindowFunctions.html)
