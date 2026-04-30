# HyperbolicDistribution

- _HyperbolicDistribution(α, β, δ, μ)_

The hyperbolic distribution with location parameter μ, scale parameter δ, shape parameter α, and skewness parameter β.

Probability density function, varying _β_:

~~~spl svg=A
(-8 -- 8).functionPlot(
	[-1.5 0 1].collect { :beta |
		HyperbolicDistribution(
			2,
			beta,
			3,
			1
		).pdf
	}
)
~~~

![](Help/Image/HyperbolicDistribution-A.svg)

Probability density function, varying _α_:

~~~spl svg=B
(0 -- 10).functionPlot(
	[2 3 4].collect { :alpha |
		HyperbolicDistribution(
			alpha,
			1.5,
			3,
			1
		).pdf
	}
)
~~~

![](Help/Image/HyperbolicDistribution-B.svg)

* * *

See also: InverseGaussianDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HyperbolicDistribution.html)

