# NoncentralBetaDistribution

- _NoncentralBetaDistribution(α, β, δ)_

A `Type` representing a noncentral β distribution with shape parameters α and β,
and noncentrality parameter δ.

Generate a sample of pseudo-random numbers:

~~~spl svg=A
let r = Sfc32(879328);
NoncentralBetaDistribution(3, 2.5, 20)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/NoncentralBetaDistribution-A.svg)

* * *

See also: BetaDistribution, GammaDistribution, NoncentralChiSquareDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoncentralBetaDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Noncentral_beta_distribution)
