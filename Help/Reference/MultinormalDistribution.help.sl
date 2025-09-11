# MultinormalDistribution

- _MultinormalDistribution(μ, Σ)_

A `Type` representing a multivariate normal (or Gaussian) distribution with mean vector μ,
and covariance matrix Σ,
which must be symmetric and positive definite.

Generate a sample of pseudorandom vectors from a bivariate normal distribution:

~~~spl svg=A
let r = Sfc32(678132);
MultinormalDistribution(
	[1 2],
	[
		2 -1/3;
		-1/3 2/3
	]
)
.randomVariate(r, [2E2])
.scatterPlot
~~~

![](sw/spl/Help/Image/MultinormalDistribution-A.svg)

* * *

See also: BinormalDistribution, NormalDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MultinormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/pmc/section5/pmc542.htm),
_W_
[1](https://en.wikipedia.org/wiki/Multivariate_normal_distribution)
