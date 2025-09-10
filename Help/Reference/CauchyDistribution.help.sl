# CauchyDistribution

- _CauchyDistribution(x₀, γ)_

A `Type` that represents a Cauchy distribution with location parameter _x₀_ and scale parameter _γ_.
The Cauchy distribution is the distribution of the _x_-intercept of a ray issuing from _(x₀, γ)_ with a uniformly distributed angle.
It is also the distribution of the ratio of two independent normally distributed random variables with `mean` `zero`.

Plot `pdf` over a subset of the reals:

~~~spl svg=A
(-7 -- 7).functionPlot(
	CauchyDistribution(0, 2).pdf
)
~~~

![](sw/spl/Help/Image/CauchyDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
(-7 -- 7).functionPlot(
	CauchyDistribution(0, 2).cdf
)
~~~

![](sw/spl/Help/Image/CauchyDistribution-B.svg)

Plot `quantile` over a subset of the reals:

~~~spl svg=C
(0.05 -- 0.95).functionPlot(
	CauchyDistribution(10, 3.5)
	.quantile
	.clip([-30 50])
)
~~~

![](sw/spl/Help/Image/CauchyDistribution-C.svg)

Plot `randomVariate`, clamped to _(-1, 1)_:

~~~spl svg=D
let r = Sfc32(14232);
CauchyDistribution(0, 0.025)
.randomVariate(r, 99)
.clip
.linePlot
~~~

![](sw/spl/Help/Image/CauchyDistribution-D.svg)

Two dimensional Cauchy noise:

~~~spl png=E
let r = Sfc32(189040);
CauchyDistribution(0, 0.025)
.randomVariate(r, [100 100])
.clip
.asGraymap
~~~

![](sw/spl/Help/Image/CauchyDistribution-E.png)

Generate a sample of pseudorandom numbers from a Cauchy distribution:

~~~spl svg=F
let r = Sfc32(387041);
CauchyDistribution(3, 2.5)
.randomVariate(r, [10 ^ 4])
.histogramPlot([-18 20 1])
~~~

![](sw/spl/Help/Image/CauchyDistribution-F.svg)

Plot unclamped random variate:

~~~spl svg=G
let r = Sfc32(789413);
CauchyDistribution(0, 1 / 9)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/CauchyDistribution-G.svg)

* * *

See also: NormalDistribution, StableDistribution, UniformDistribution, WeibullDistribution

Guides: Probability Distributions, Random Functions

References:
_Csound_
[1](https://csound.com/docs/manual/cauchy.html)
[2](https://csound.com/docs/manual/pcauchy.html),
_Mathematica_
[1](https://mathworld.wolfram.com/CauchyDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3663.htm),
_W_
[1](https://en.wikipedia.org/wiki/Cauchy_distribution)

Categories: Probability, Random
