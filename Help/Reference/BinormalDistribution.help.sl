# BinormalDistribution

- _BinormalDistribution(μ, σ)_

Answers an instance of `MultinormalDistribution` representing a bivariate normal distribution,
with mean μ and covariance matrix [σ₁² ρσ₁σ₂; ρσ₁σ₂ σ₂²].

Generate a sample of pseudorandom vectors from a bivariate normal distribution:

~~~spl svg=A
let r = Sfc32(678132);
BinormalDistribution([1 2], [1.5, 2], 0.6)
.randomVariate(r, [2E2])
.scatterPlot
~~~

![](sw/spl/Help/Image/BinormalDistribution-A.svg)

* * *

See also: MultinormalDistribution, NormalDistribution


References:
_Mathematica_
[1](https://mathworld.wolfram.com/BivariateNormalDistribution.html)
[2](https://reference.wolfram.com/language/ref/BinormalDistribution.html)
_W_
[1](https://en.wikipedia.org/wiki/Multivariate_normal_distribution)
