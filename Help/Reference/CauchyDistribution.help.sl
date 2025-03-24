# CauchyDistribution

- _CauchyDistribution(x0, gamma)_

Answer a `Type` that represents a Cauchy distribution with  location parameter _x0_ and scale parameter _gamma_.
The Cauchy distribution is the distribution of the _x_-intercept of a ray issuing from _(x0, gamma)_ with a uniformly distributed angle.
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
	.clip(-30, 50)
)
~~~

![](sw/spl/Help/Image/CauchyDistribution-C.svg)

Plot `randomVariate`:

~~~spl svg=D
let r = Sfc32(14232);
CauchyDistribution(0, 0.025)
.randomVariate(r, 99)
.clip(-1, 1)
.linePlot
~~~

![](sw/spl/Help/Image/CauchyDistribution-D.svg)

Two dimensional Cauchy noise:

~~~spl png=E
let r = Sfc32(189040);
CauchyDistribution(0, 0.025)
.randomVariate(r, [100 100])
.clip(-1, 1)
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

* * *

See also: cdf, mean, NormalDistribution, pdf, randomVariate, standardDeviation, UniformDistribution, WeibullDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CauchyDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3663.htm)
_W_
[1](https://en.wikipedia.org/wiki/Cauchy_distribution)

Categories: Probability, Random
