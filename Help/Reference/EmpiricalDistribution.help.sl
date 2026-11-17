# EmpiricalDistribution

- _EmpiricalDistribution(x)_

A `Type` representing an empirical distribution based on the data values _x_.

Create an empirical distribution of univariate data and plot the cummulative distribution function:

~~~spl svg=A
let r = Sfc32(678132);
(-4.0 -- 4.0).functionPlot(
	EmpiricalDistribution(
		NormalDistribution(0.0, 1.0)
		.randomVariate(r, [50L])
		.round(1.0E-2)
	).cdf
)
~~~

![](Help/Image/EmpiricalDistribution-A.svg)

Larger datasets lead to better approximations of the underlying distribution:

~~~spl svg=B
let r = Sfc32(678132);
(-4.0 -- 4.0).functionPlot(
	EmpiricalDistribution(
		NormalDistribution(0.0, 1.0)
		.randomVariate(r, [10 ^ 3])
		.round(1.0E-2)
	).cdf
)
~~~

![](Help/Image/EmpiricalDistribution-B.svg)

Generate psuedo-random numbers from an empirical distribution:

~~~spl svg=C
let r = Sfc32(678132);
EmpiricalDistribution(
	NormalDistribution(0.0, 1.0)
	.randomVariate(r, [10L ^ 3L])
	.round(1.0E-3)
)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/EmpiricalDistribution-C.svg)

An empirical distribution from weighted input data,
the map keys are the empirical values,
the map values are the weights:

~~~spl svg=D
let r = Sfc32(371249);
EmpiricalDistribution(
	Map[
		1L -> 1.0,
		2L -> 2.0,
		3L -> 4.0,
		4L -> 7.0,
		5L -> 4.0,
		6L -> 2.0,
		7L -> 1.0
	]
).randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/EmpiricalDistribution-D.svg)

Plot inverse cummulative distribution functions:

~~~spl svg=E
let r = Sfc32(678132);
let n = NormalDistribution(0.0, 1.0);
let e = EmpiricalDistribution(
	n
	.randomVariate(r, [10L ^ 3L])
	.round(1.0E-2)
);
(0.0 -- 1.0).functionPlot(
	[
		n.inverseCdf.clip(-3.0, 3.0),
		e.inverseCdf.clip(-3.0, 3.0)
	]
)
~~~

![](Help/Image/EmpiricalDistribution-E.svg)

* * *

See also: ProbabilityDistribution, cdf, inverseCdf

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EmpiricalDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/cdfplot.html),
_W_
[1](https://en.wikipedia.org/wiki/Empirical_distribution_function)
