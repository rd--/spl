# BetaDistribution

- _BetaDistributionn(α, β)_

A `Type` representing a beta distribution with shape parameters α and β.

Probability density function:

~~~spl svg=A
(0.0 -- 1.0).functionPlot(
	[0.25 2.0 4.0].collect { :beta |
		BetaDistribution(
			2.0,
			beta
		).pdf.clip(0.0, 3.5)
	}
)
~~~

![](Help/Image/BetaDistribution-A.svg)

The distribution is symmetrical:

~~~spl svg=B
(0.0 -- 1.0).functionPlot(
	[0.25 2.0 4.0].collect { :alpha |
		BetaDistribution(
			alpha,
			1.5
		).pdf.clip(0.0, 3.0)
	}
)
~~~

![](Help/Image/BetaDistribution-B.svg)

Cumulative distribution function:

~~~spl svg=C
(0.0 -- 1.0).functionPlot(
	[0.25 2.0 4.0].collect { :beta |
		BetaDistribution(
			2.0,
			beta
		).cdf
	}
)
~~~

![](Help/Image/BetaDistribution-C.svg)

Generate a sample of pseudo-random numbers from a beta distribution:

~~~spl svg=D
let r = Sfc32(395472);
BetaDistribution(3.0, 2.5)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/BetaDistribution-D.svg)

When α and β are both less than one,
the probability density is greatest near `zero` and `one`,
the case where α=β=1/2 is equal to the standard arcsine distribution:

~~~spl svg=E
(0.0 -- 1.0).functionPlot(
	BetaDistribution(0.5, 0.5)
	.pdf.clip(0.0, 4.0)
)
~~~

![](Help/Image/BetaDistribution-E.svg)

When α and β are both equal to one the probability density function is uniformly `one`:

~~~spl svg=F
(-1.0 -- 2.0).functionPlot(
	BetaDistribution(1.0, 1.0)
	.pdf
)
~~~

![](Help/Image/BetaDistribution-F.svg)

When α=1 and β=2,
and vice-versa,
the probability density function is linear:

~~~spl svg=G
(0.0 -- 1.0).functionPlot(
	BetaDistribution(1.0, 2.0).pdf
)
~~~

![](Help/Image/BetaDistribution-G.svg)

When α and β are both greater than `one` the probability density function is Gaussian,
the mean is the midpoint if α=β,
else it is skewed toward the lower values boundary:

~~~spl svg=H
(0.0 -- 1.0).functionPlot(
	[2.0 2.0; 3.0 4.0; 6.0 5.0; 7.0 7.0]
	.collect { :each |
		let [alpha, beta] = each;
		BetaDistribution(alpha, beta)
		.pdf
	}
)
~~~

![](Help/Image/BetaDistribution-H.svg)

Biased low:

~~~spl svg=I
let r = Sfc32(791741);
BetaDistribution(1.0 / 3.0, 3.0)
.randomVariate(r, [99L])
.linePlot
~~~

![](Help/Image/BetaDistribution-I.svg)

Biased high:

~~~spl svg=J
let r = Sfc32(231749);
BetaDistribution(3.0, 1.0 / 3.0)
.randomVariate(r, [99L])
.linePlot
~~~

![](Help/Image/BetaDistribution-J.svg)

* * *

See also: BinomialDistribution, GammaDistribution, beta, betaRegularized

Guides: Probability Distributions, Random Number Functions

References:
_Csound_
[1](https://csound.com/docs/manual/betarand.html),
_Mathematica_
[1](https://mathworld.wolfram.com/BetaDistribution.html)
[2](https://reference.wolfram.com/language/ref/BetaDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/betarnd.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366h.htm),
_W_
[1](https://en.wikipedia.org/wiki/Beta_distribution)
