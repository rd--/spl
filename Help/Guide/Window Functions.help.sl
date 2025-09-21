# Window Functions

A window function,
also called an apodization function or tapering function,
is a function used to smoothly bring a sampled signal down
to zero at the edges of the sampled region.

- `bartlettWindow`
- `bartlettHannWindow`
- `blackmanWindow`
- `blackmanHarrisWindow`
- `blackmanNuttallWindow`
- `bohmanWindow`
- `cosineWindow`
- `dirichletWindow`
- `flatTopWindow`
- `gaussianWindow`
- `hammingWindow`
- `hannWindow`
- `kaiserWindow`
- `lanczosWindow`
- `nuttallWindow`
- `parzenWindow`
- `planckTaperWindow`
- `sincWindow`
- `tukeyWindow`
- `welchWindow`

_Note:_ The Bartlett window is triangular,
the Dirichlet window is rectangular,
the Hann window is a raised cosine.

## Window Table Functions

- `hammingWindowTable`
- `hannWindowTable`
- `kaiserWindowTable`
- `welchWindowTable`

## Kernel Functions

- `dirichletKernel`
- `epanechnikovKernel`
- `fejerKernel`
- `gaussianKernel`
- `lanczosKernel`

## Impulse Response Functions

- `raisedCosinePulse`

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

Guides: Mathematical Functions, Plotting Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ApodizationFunction.html)
[2](https://reference.wolfram.com/language/guide/WindowFunctions.html),
_W_
[1](https://en.wikipedia.org/wiki/Window_function)
