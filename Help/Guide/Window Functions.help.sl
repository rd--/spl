# Window Functions

A window function,
also called an apodization function or tapering function,
is a function used to smoothly bring a sampled signal down
to zero at the edges of the sampled region.

- `bartlettWindow`: Bartlett
- `bartlettHannWindow`: Bartlett-Hann
- `blackmanWindow`: Blackman
- `blackmanHarrisWindow`: Harris
- `blackmanNuttallWindow`: Blackman-Nuttall
- `cosineWindow`: Cosine
- `dirichletWindow`: Dirichlet
- `flatTopWindow`: flat top
- `gaussianWindow`: Gaussian
- `hammingWindow`: Hamming
- `hannWindow`: Hann
- `kaiserWindow`: Kaiser
- `lanczosWindow`: Lanczos
- `nuttallWindow`: Nuttall
- `parzenWindow`: Parzen
- `planckTaperWindow`: Planck-taper
- `tukeyWindow`: Tukey
- `welchWindow`: Welch

_Note:_ The Bartlett window is triangular,
the Dirichlet window is rectangular,
the Hann window is a raised cosine.

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

## Impulse Response Functions

- `raisedCosinePulse`: Raised-cosine

## Window Function Types

- B-spline windows
  - `bartlettWindow`
  - `parzenWindow`
- Polynomial windows
  - `welchWindow`
- Raised-cosine windows
  - `hannWindow`
  - `hammingWindow`
- Cosine-sum windows
  - `blackmanWindow`
  - `blackmanHarrisWindow`
  - `blackmanNuttallWindow`
  - `flatTopWindow`
  - `nuttallWindow`
- Adjustable windows
  - `gaussianWindow`
  - `kaiserWindow`
  - `tukeyWindow`

* * *

Guides: Mathematical Functions, Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ApodizationFunction.html)
[2](https://reference.wolfram.com/language/guide/WindowFunctions.html),
_W_
[1](https://en.wikipedia.org/wiki/Window_function)
