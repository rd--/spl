# NormalDistribution

- _NormalDistribution(μ=0.0, σ=1.0)_

A `Type` that represents a normal (Gaussian) distribution with mean _μ_ and standard deviation _σ_.

Probability density function at specific values:

```
>>> [0.0 1.0 1.0].collect(
>>> 	NormalDistribution(0.0, 1.0).pdf
>>> )
[
	1.0 / 2.pi.sqrt,
	-0.5.exp / 2.pi.sqrt,
	1.0 / (2.pi * 1.exp).sqrt
]
```

Cumulative distribution function:

```
>>> [0.0 1.0 2.0 1.96 2.58].collect(
>>> 	NormalDistribution(0.0, 1.0).cdf
>>> )
[0.5 0.8413 0.9772 0.9750 0.9951]
```

Plot the probability density function,
`pdf`,
over a subset of the reals:

~~~spl svg=A
(-3.0 -- 3.0).functionPlot(
	NormalDistribution(0.0, 1.0).pdf
)
~~~

![](Help/Image/NormalDistribution-A.svg)

Plot the cumulative distribution function,
`cdf`,
over a subset of the reals:

~~~spl svg=B
(-3.0 -- 3.0).functionPlot(
	NormalDistribution(0.0, 1.0).cdf
)
~~~

![](Help/Image/NormalDistribution-B.svg)

Plot `randomVariate`:

~~~spl svg=C
let r = Sfc32(789134);
NormalDistribution(0.0, 1.0)
.randomVariate(r, [99L])
.linePlot
~~~

![](Help/Image/NormalDistribution-C.svg)

Two dimensional Gaussian noise:

~~~spl png=D
let r = Sfc32(180513);
NormalDistribution(0.0, 1.0)
.randomVariate(r, [100L 100L])
.rescale
.Greymap
~~~

![](Help/Image/NormalDistribution-D.png)

Generate a sample of pseudorandom numbers from a normal distribution:

~~~spl svg=E
let r = Sfc32(370841);
NormalDistribution(1.0, 3.0)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/NormalDistribution-E.svg)

PLot with mean at zero and small deviation:

~~~spl svg=F
let r = Sfc32(378914);
NormalDistribution(0.0, 1.0 / 9.0)
.randomVariate(r, [99L])
.linePlot
~~~

![](Help/Image/NormalDistribution-F.svg)

Plot sorted random list:

~~~spl svg=G
let r = Sfc32(789146);
NormalDistribution(0.0, 1.0)
.randomVariate(r, [500L])
.sort!
.linePlot
~~~

![](Help/Image/NormalDistribution-G.svg)

Quantile function,
varying σ:

~~~spl svg=H
(0.0 -- 1.0).functionPlot(
	[0.5 1.0 2.0].collect { :sigma |
		NormalDistribution(-2.0, sigma)
		.quantileFunction
		.clip(-6.0, 2.0)
	}
)
~~~

![](Help/Image/NormalDistribution-H.svg)

Quantile function,
varying μ:

~~~spl svg=I
(0.0 -- 1.0).functionPlot(
	[-1.0 1.0 4.0].collect { :mu |
		NormalDistribution(mu, 2.0)
		.quantileFunction
		.clip(-10.0, 15.0)
	}
)
~~~

![](Help/Image/NormalDistribution-I.svg)

* * *

See also: MultinormalDistribution, ProbabilityDistribution, SkewNormalDistribution, StableDistribution, StudentTDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Csound_
[1](https://csound.com/docs/manual/gauss.html),
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/randn.html)
[2](https://mathworks.com/help/stats/normrnd.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
[2](https://en.wikipedia.org/wiki/Marsaglia_polar_method)
[3](https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform)

Categories: Probability, Random
