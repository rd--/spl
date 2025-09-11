# WeibullDistribution

- _WeibullDistribution(alpha, beta, mu)_

A `Type` representing a Weibull distribution with
a shape parameter α (also called γ or _k_),
a scale parameter β (also called α or λ),
and a location parameter μ.

Probability density function, varying _alpha_:

~~~spl svg=A
(0.05 -- 3).functionPlot(
	[0.5 2 4].collect { :alpha |
		WeibullDistribution(alpha, 1, 0)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-A.svg)

Probability density function, varying _beta_:

~~~spl svg=B
(0.05 -- 3).functionPlot(
	[1 2 4].collect { :beta |
		WeibullDistribution(2, beta, 0)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-B.svg)

Probability density function, varying _mu_:

~~~spl svg=C
(0 -- 6).functionPlot(
	[-1.5 1 2].collect { :mu |
		WeibullDistribution(3, 2, mu)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-C.svg)

Generate a sample of pseudorandom numbers from a Weibull distribution and plot the histogram:

~~~spl svg=D
let r = Sfc32(371513);
WeibullDistribution(3.5, 2, 0)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/WeibullDistribution-D.svg)

Two dimensional Weibull noise:

~~~spl png=E
let r = Sfc32(180513);
WeibullDistribution(2.5, 1, 0)
.randomVariate(r, [100 100])
.asGraymap
~~~

![](sw/spl/Help/Image/WeibullDistribution-E.png)

Plot random variate:

~~~spl svg=F
let r = Sfc32(391437);
WeibullDistribution(3 / 4, 1, 0)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/WeibullDistribution-F.svg)

* * *

See also: CauchyDistribution, cdf, NormalDistribution, pdf, randomVariate, UniformDistribution

Guides: Probability Distributions, Random Functions

References:
_Csound_
[1](https://csound.com/docs/manual/weibull.html),
_Mathematica_
[1](https://mathworld.wolfram.com/WeibullDistribution.html)
[2](https://reference.wolfram.com/language/ref/WeibullDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/weibull-distribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3668.htm),
_W_
[1](https://en.wikipedia.org/wiki/Weibull_distribution)
