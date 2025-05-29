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
		).pdf.clip([0 3.5])
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
		).pdf.clip([0 3])
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

When α and β are both less than one,
the probability density is greatest near `zero` and `one`,
the case where α=β=1/2 is equal to the standard arcsine distribution:

~~~spl svg=E
(0 -- 1).functionPlot(
	BetaDistribution(0.5, 0.5)
	.pdf.clip([0 4])
)
~~~

![](sw/spl/Help/Image/BetaDistribution-E.svg)

When α and β are both equal to one the probability density function is uniformly `one`:

~~~spl svg=F
(-1 -- 2).functionPlot(
	BetaDistribution(1, 1)
	.pdf
)
~~~

![](sw/spl/Help/Image/BetaDistribution-F.svg)

When α=1 and β=2,
and vice-versa,
the probability density function is linear:

~~~spl svg=G
(0 -- 1).functionPlot(
	BetaDistribution(1, 2).pdf
)
~~~

![](sw/spl/Help/Image/BetaDistribution-G.svg)

When α and β are both greater than `one` the probability density function is Gaussian,
the mean is the midpoint if α=β,
else it is skewed toward the lower values boundary:

~~~spl svg=H
(0 -- 1).functionPlot(
	[2 2; 3 4; 6 5; 7 7].collect { :each |
		let [alpha, beta] = each;
		BetaDistribution(alpha, beta)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/BetaDistribution-H.svg)

Biased low:

~~~spl svg=I
let r = Sfc32(791741);
BetaDistribution(1 / 3, 3)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/BetaDistribution-I.svg)

Biased high:

~~~spl svg=J
let r = Sfc32(231749);
BetaDistribution(3, 1 / 3)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/BetaDistribution-J.svg)

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
