# gaussianKernel

- _gaussianKernel(σ, u)_

Answer the Gaussian kernel with width σ at _u_.

Plot over _(-3, 3)_ with σ of `one`:

~~~spl svg=A
(-3 -- 3).functionPlot(
	1.gaussianKernel
)
~~~

![](sw/spl/Help/Image/gaussianKernel-A.svg)

* * *

See also: epanechnikovKernel, gaussianMatrix, gaussianWindow, NormalDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianFunction.html),
References:
_W_
[1](https://en.wikipedia.org/wiki/Kernel_(statistics))
[2](https://en.wikipedia.org/wiki/Gaussian_function)
