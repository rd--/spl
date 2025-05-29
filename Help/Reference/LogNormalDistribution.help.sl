# LogNormalDistribution

- _LogNormalDistribution(μ, σ)_

A `Type` representing a log-normal distribution derived from a normal distribution with mean μ and standard deviation σ.

Plot `randomVariate`:

~~~spl svg=A
let r = Sfc32(789134);
LogNormalDistribution(0, 1)
.randomVariate(r, 99)
.linePlot
~~~

![](sw/spl/Help/Image/LogNormalDistribution-A.svg)

Two dimensional log-normal noise:

~~~spl png=B
let r = Sfc32(180513);
LogNormalDistribution(0, 1 / 3)
.randomVariate(r, [100 100])
.asGraymap
~~~

![](sw/spl/Help/Image/LogNormalDistribution-B.png)

Probability density function, varying _mu_:

~~~spl svg=C
(0 -- 4).functionPlot(
	[-1 2 3].collect { :mu |
		LogNormalDistribution(mu, 2)
		.pdf
		.clip([0 0.4])
	}
)
~~~

![](sw/spl/Help/Image/LogNormalDistribution-C.svg)

Probability density function, varying _sigma_:

~~~spl svg=D
(0 -- 4).functionPlot(
	[0.5 0.75 1.5].collect { :sigma |
		LogNormalDistribution(1, sigma)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/LogNormalDistribution-D.svg)

Generate a sample of pseudorandom numbers from a log normal distribution:

~~~spl svg=E
let r = Sfc32(890412);
LogNormalDistribution(2, 0.3)
.randomVariate(r, [10 ^ 4])
.histogramPlot([0 15 0.5])
~~~

![](sw/spl/Help/Image/LogNormalDistribution-E.svg)

* * *

See also: erf, inverseErf, NormalDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogNormalDistribution.html)
[2](https://reference.wolfram.com/language/ref/LogNormalDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/stats/lognormal-distribution.html),
_Python_
[1](https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.lognormal.html),
_W_
[1](https://en.wikipedia.org/wiki/Log-normal_distribution)
