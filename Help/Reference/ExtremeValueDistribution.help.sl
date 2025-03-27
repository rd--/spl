# ExtremeValueDistribution

- _ExtremeValueDistribution(α, β)_

A `Type` representing an extreme value distribution distribution with location parameter α and scale parameter β.

Probability density function, varying α:

~~~spl svg=A
(-8 -- 12).functionPlot(
	[-3 0 4].collect { :alpha |
		ExtremeValueDistribution(
			alpha,
			2
		).pdf
	}
)
~~~

![](sw/spl/Help/Image/ExtremeValueDistribution-A.svg)

Probability density function, varying β:

~~~spl svg=B
(-5 -- 10).functionPlot(
	[1.5 2 3].collect { :beta |
		ExtremeValueDistribution(
			1.5,
			beta
		).pdf
	}
)
~~~

![](sw/spl/Help/Image/ExtremeValueDistribution-B.svg)

Cumulative distribution function, varying α:

~~~spl svg=C
(-8 -- 12).functionPlot(
	[-3 0 4].collect { :alpha |
		ExtremeValueDistribution(
			alpha,
			2
		).cdf
	}
)
~~~

![](sw/spl/Help/Image/ExtremeValueDistribution-C.svg)

Cumulative distribution function, varying β:

~~~spl svg=D
(-5 -- 10).functionPlot(
	[1.5 2 3].collect { :beta |
		ExtremeValueDistribution(
			1.5,
			beta
		).cdf
	}
)
~~~

![](sw/spl/Help/Image/ExtremeValueDistribution-D.svg)

Generate a sample of pseudorandom numbers:

~~~spl svg=E
let r = Sfc32(389124);
ExtremeValueDistribution(3, 2.5)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/ExtremeValueDistribution-E.svg)

* * *

See also: WeibullDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExtremeValueDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366g.htm),
_W_
[1](https://en.wikipedia.org/wiki/Gumbel_distribution)
