# MultivariateTDistribution

- _MultivariateTDistribution(μ, Σ, ν)_

A `Type` representing the multivariate Student-t distribution
with location μ,
scale matrix Σ,
and ν degrees of freedom.

Generate and plot sample of pseudorandom vectors from a bivariate _t_ distribution:

~~~spl svg=A
let r = Sfc32(543275);
MultivariateTDistribution(
	[0.0 0.0],
	[2/1 -1/3; -1/3 2/3].F,
	5.0
)
.randomVariate(r, [500L])
.densityHistogramPlot(
	[-3.0 3.0 0.5],
	[-3.0 3.0 0.5]
)
~~~

![](Help/Image/MultivariateTDistribution-A.svg)

* * *

See also: ChiSquareDistribution, MultinormalDistribution, StudentTDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MultivariateTDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/mvtpdf.html),
_W_
[1](https://en.wikipedia.org/wiki/Multivariate_t-distribution)
