# gaussianKernel

- _gaussianKernel(σ, u)_

Answer the _normalized_ Gaussian kernel with width σ at _u_.

Plot over _(-5, 5)_ with increasing σ of _0.3_, _1_, and _2_:

~~~spl svg=A
(-5 -- 5).functionPlot(
	[0.3 1 2].collect(
		gaussianKernel:/1
	)
)
~~~

![](sw/spl/Help/Image/gaussianKernel-A.svg)

* * *

See also: epanechnikovKernel, gaussianFilter, gaussianMatrix, gaussianWindow, NormalDistribution

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Kernel_(statistics))
[2](https://en.wikipedia.org/wiki/Gaussian_function)
