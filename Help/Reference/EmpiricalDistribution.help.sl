# EmpiricalDistribution

- _EmpiricalDistribution(x)_

A `Type` representing an empirical distribution based on the data values _x_.

Create an empirical distribution of univariate data and plot the cummulative distribution function:

~~~spl svg=A
let r = Sfc32(678132);
(-4 -- 4).functionPlot(
	EmpiricalDistribution(
		NormalDistribution(0, 1)
		.randomVariate(r, [50])
	).cdf
)
~~~

![](sw/spl/Help/Image/EmpiricalDistribution-A.svg)

Larger datasets lead to better approximations of the underlying distribution:

~~~spl svg=B
let r = Sfc32(678132);
(-4 -- 4).functionPlot(
	EmpiricalDistribution(
		NormalDistribution(0, 1)
		.randomVariate(r, [10 ^ 3])
	).cdf
)
~~~

![](sw/spl/Help/Image/EmpiricalDistribution-B.svg)

Generate psuedo-random numbers from an empirical distribution:

~~~spl svg=C
let r = Sfc32(678132);
EmpiricalDistribution(
	NormalDistribution(0, 1)
	.randomVariate(r, [10 ^ 3])
)
.randomVariate(r, [10 ^ 3])
.histogramPlot
~~~

![](sw/spl/Help/Image/EmpiricalDistribution-C.svg)

An empirical distribution from weighted input data:

~~~spl svg=D
let r = Sfc32(371249);
EmpiricalDistribution(
	[
		1 -> 1, 2 -> 2,
		3 -> 3,
		4 -> 2, 5 -> 1
	].asMap
)
.randomVariate(r, [2E3])
.histogramPlot
~~~

![](sw/spl/Help/Image/EmpiricalDistribution-D.svg)

* * *

See also: cdf, inverseCdf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EmpiricalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Empirical_distribution_function)
