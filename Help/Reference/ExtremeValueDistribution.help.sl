# ExtremeValueDistribution

- _ExtremeValueDistribution(α, β)_

A `Type` representing an extreme value distribution distribution with location parameter α and scale parameter β.

Probability density function, varying α:

~~~spl svg=A
(-8.0 -- 12.0).functionPlot(
	[-3.0 0.0 4.0].collect { :alpha |
		ExtremeValueDistribution(
			alpha,
			2.0
		).pdf
	}
)
~~~

![](Help/Image/ExtremeValueDistribution-A.svg)

Probability density function, varying β:

~~~spl svg=B
(-5.0 -- 10.0).functionPlot(
	[1.5 2.0 3.0].collect { :beta |
		ExtremeValueDistribution(
			1.5,
			beta
		).pdf
	}
)
~~~

![](Help/Image/ExtremeValueDistribution-B.svg)

Cumulative distribution function, varying α:

~~~spl svg=C
(-8.0 -- 12.0).functionPlot(
	[-3.0 0.0 4.0].collect { :alpha |
		ExtremeValueDistribution(
			alpha,
			2.0
		).cdf
	}
)
~~~

![](Help/Image/ExtremeValueDistribution-C.svg)

Cumulative distribution function, varying β:

~~~spl svg=D
(-5.0 -- 10.0).functionPlot(
	[1.5 2.0 3.0].collect { :beta |
		ExtremeValueDistribution(
			1.5,
			beta
		).cdf
	}
)
~~~

![](Help/Image/ExtremeValueDistribution-D.svg)

Generate a sample of pseudorandom numbers:

~~~spl svg=E
let r = Sfc32(389124);
ExtremeValueDistribution(3.0, 2.5)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/ExtremeValueDistribution-E.svg)

* * *

See also: WeibullDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExtremeValueDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366g.htm),
_W_
[1](https://en.wikipedia.org/wiki/Gumbel_distribution)
