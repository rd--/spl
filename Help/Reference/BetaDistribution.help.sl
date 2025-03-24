# BetaDistribution

- _BetaDistributionn(α, β)_

A `Type` representing a beta distribution with shape parameters α and β.

Probability density function:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.25 2 4].collect { :beta |
		BetaDistribution(
			2,
			beta
		).pdf.clip(0, 3.5)
	}
)
~~~

![](sw/spl/Help/Image/BetaDistribution-A.svg)

The distribution is symmetrical:

~~~spl svg=B
(0 -- 1).functionPlot(
	[0.25 2 4].collect { :alpha |
		BetaDistribution(
			alpha,
			1.5
		).pdf.clip(0, 3)
	}
)
~~~

![](sw/spl/Help/Image/BetaDistribution-B.svg)

Cumulative distribution function:

~~~spl svg=C
(0 -- 1).functionPlot(
	[0.25 2 4].collect { :beta |
		BetaDistribution(
			2,
			beta
		).cdf
	}
)
~~~

![](sw/spl/Help/Image/BetaDistribution-C.svg)

Generate a sample of pseudo-random numbers from a beta distribution:

~~~spl svg=D
let r = Sfc32(395472);
BetaDistribution(3, 2.5)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/BetaDistribution-D.svg)

* * *

See also: BinomialDistribution, beta, betaRegularized, GammaDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BetaDistribution.html)
[2](https://reference.wolfram.com/language/ref/BetaDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/stats/betarnd.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366h.htm),
_W_
[1](https://en.wikipedia.org/wiki/Beta_distribution)
