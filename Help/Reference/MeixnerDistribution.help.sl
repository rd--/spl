# MeixnerDistribution

- _MeixnerDistribution(m, a, b, d)_

The Meixner distribution with location parameter m, scale parameter a, skew parameter b, and shape parameter d.

Probability density function, varying _b_:

~~~spl svg=A
(-8.0 -- 8.0).functionPlot(
	[-2.0 0.0 1.5].collect { :b |
		MeixnerDistribution(
			2.0, b, 0.0, 1.0
		).pdf
	}
)
~~~

![](Help/Image/MeixnerDistribution-A.svg)

Probability density function, varying _d_:

~~~spl svg=B
(-2.0 -- 6.0).functionPlot(
	[0.5 1.0 2.0].collect { :d |
		MeixnerDistribution(
			2.0, 1.0, 0.0, d
		).pdf
	}
)
~~~

![](Help/Image/MeixnerDistribution-B.svg)

* * *

See also: SechDistribution, gamma

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MeixnerDistribution.html)
