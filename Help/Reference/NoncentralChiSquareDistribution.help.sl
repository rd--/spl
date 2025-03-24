# NoncentralChiSquareDistribution

- _NoncentralChiSquareDistribution(ν, λ)_

A `Type` representing a non-central Χ² distribution with ν degrees of freedom,
and noncentrality parameter λ.

Generate a sample of pseudo-random numbers:

~~~spl svg=A
let r = Sfc32(287971);
NoncentralChiSquareDistribution(5, 10)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/NoncentralChiSquareDistribution-A.svg)

* * *

See also: ChiSquareDistribution, GammaDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoncentralChiSquareDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Noncentral_chi-squared_distribution)
