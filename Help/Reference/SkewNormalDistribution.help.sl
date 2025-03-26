# SkewNormalDistribution

- _SkewNormalDistribution(μ, σ, α)_

A `Type` representing a skew-normal distribution with shape parameter α,
location parameter μ,
and scale parameter σ.

Probability density function, varying alpha:

~~~spl svg=A
(-5 -- 5).functionPlot(
	[-3 0.5 4].collect { :alpha |
		SkewNormalDistribution(0, 2, alpha)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/SkewNormalDistribution-A.svg)

Generate a sample of pseudorandom numbers from a skew normal distribution:

~~~
let r = Sfc32(678123);
SkewNormalDistribution(0, 2, 3)
.randomVariate(r, 10^4)
.histogramPlot
~~~

![](sw/spl/Help/Image/SkewNormalDistribution-B.svg)

* * *

See also: NormalDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SkewNormalDistribution.html.en),
_W_
[1](https://en.wikipedia.org/wiki/Skew_normal_distribution)
