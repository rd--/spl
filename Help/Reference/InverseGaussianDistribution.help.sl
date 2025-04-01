# InverseGaussianDistribution

- _InverseGaussianDistribution(μ, λ)_

A `Type` representing an inverse Gaussian distribution with mean μ and scale parameter λ.

~~~spl svg=A
let r = Sfc32(267813);
InverseGaussianDistribution(1, 5)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/InverseGaussianDistribution-A.svg)

_Note_: The inverse Gaussian distribution is also known as the Wald distribution.

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseGaussianDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/stats/prob.inversegaussiandistribution.html),
_Python_
[1](https://numpy.org/doc/2.2/reference/random/generated/numpy.random.wald.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_Gaussian_distribution)
