# ArcSinDistribution

- _ArcSinDistribution([x₁ x₂])_

The arc sine distribution supported between x₁ and x₂.

Probability density function, varying _x₂_:

~~~spl svg=A
(-1 -- 4).functionPlot(
	[1 2 4].collect { :x2 |
		ArcSinDistribution(
			[-1, x2]
		).pdf
	}
)
~~~

![](Help/Image/ArcSinDistribution-A.svg)

Cumulative distribution function, varying _σ_:

~~~spl svg=B
(-1 -- 4).functionPlot(
	[1 2 4].collect { :x2 |
		ArcSinDistribution(
			[-1, x2]
		).cdf
	}
)
~~~

![](Help/Image/ArcSinDistribution-B.svg)

* * *

See also: arcSin, BetaDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArcSinDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Arcsine_distribution)
