# SkewNormalDistribution

- _SkewNormalDistribution(μ, σ, α)_

A `Type` representing a skew-normal distribution with shape parameter α,
location parameter μ,
and scale parameter σ.

Probability density function, varying alpha:

~~~spl svg=A
(-5.0 -- 5.0).functionPlot(
	[-3.0 0.5 4.0].collect { :alpha |
		SkewNormalDistribution(
			0.0, 2.0, alpha
		).pdf
	}
)
~~~

![](Help/Image/SkewNormalDistribution-A.svg)

Generate a sample of pseudorandom numbers from a skew normal distribution:

~~~spl svg=B
let r = Sfc32(678123);
SkewNormalDistribution(0.0, 2.0, 3.0)
.randomVariate(r, 10L ^ 4L)
.histogramPlot
~~~

![](Help/Image/SkewNormalDistribution-B.svg)

* * *

See also: NormalDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SkewNormalDistribution.html.en),
_W_
[1](https://en.wikipedia.org/wiki/Skew_normal_distribution)
