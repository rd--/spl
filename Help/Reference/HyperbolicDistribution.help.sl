# HyperbolicDistribution

- _HyperbolicDistribution(α, β, δ, μ)_

The hyperbolic distribution with location parameter μ, scale parameter δ, shape parameter α, and skewness parameter β.

Probability density function, varying _β_:

~~~spl svg=A
(-8.0 -- 8.0).functionPlot(
	[-1.5 0.0 1.0].collect { :beta |
		HyperbolicDistribution(
			2.0,
			beta,
			3.0,
			1.0
		).pdf
	}
)
~~~

![](Help/Image/HyperbolicDistribution-A.svg)

Probability density function, varying _α_:

~~~spl svg=B
(0.0 -- 10.0).functionPlot(
	[2.0 3.0 4.0].collect { :alpha |
		HyperbolicDistribution(
			alpha,
			1.5,
			3.0,
			1.0
		).pdf
	}
)
~~~

![](Help/Image/HyperbolicDistribution-B.svg)

* * *

See also: InverseGaussianDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HyperbolicDistribution.html)
