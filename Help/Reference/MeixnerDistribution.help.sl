# MeixnerDistribution

- _MeixnerDistribution(m, a, b, d)_

The Meixner distribution with location parameter m, scale parameter a, skew parameter b, and shape parameter d.

Probability density function, varying _b_:

~~~spl svg=A
(-8 -- 8).functionPlot(
	[-2 0 1.5].collect { :b |
		MeixnerDistribution(
			2, b, 0, 1
		).pdf
	}
)
~~~

![](Help/Image/MeixnerDistribution-A.svg)

Probability density function, varying _d_:

~~~spl svg=B
(-2 -- 6).functionPlot(
	[0.5 1 2].collect { :d |
		MeixnerDistribution(
			2, 1, 0, d
		).pdf
	}
)
~~~

![](Help/Image/MeixnerDistribution-B.svg)

* * *

See also: SechDistribution, gamma

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MeixnerDistribution.html)
