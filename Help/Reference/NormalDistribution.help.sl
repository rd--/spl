# NormalDistribution

- _NormalDistribution(μ=0, σ=1)_

A `Type` that represents a normal (Gaussian) distribution with mean _μ_ and standard deviation _σ_.

Probability density function at specific values:

```
>>> [0 1 1].collect(
>>> 	NormalDistribution(0, 1).pdf
>>> )
[
	1 / 2.pi.sqrt,
	-0.5.exp / 2.pi.sqrt,
	1 / (2.pi * 1.exp).sqrt
]
```

Cumulative distribution function:

```
>>> [0 1 2 1.96 2.58].collect(
>>> 	NormalDistribution(0, 1).cdf
>>> )
[0.5 0.8413 0.9772 0.9750 0.9951]
```

Plot the probability density function,
`pdf`,
over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(
	NormalDistribution(0, 1).pdf
)
~~~

![](sw/spl/Help/Image/NormalDistribution-A.svg)

Plot the cumulative distribution function,
`cdf`,
over a subset of the reals:

~~~spl svg=B
(-3 -- 3).functionPlot(
	NormalDistribution(0, 1).cdf
)
~~~

![](sw/spl/Help/Image/NormalDistribution-B.svg)

Plot `randomVariate`:

~~~spl svg=C
let r = Sfc32(789134);
NormalDistribution(0, 1)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/NormalDistribution-C.svg)

Two dimensional Gaussian noise:

~~~spl png=D
let r = Sfc32(180513);
NormalDistribution(0, 1)
.randomVariate(r, [100 100])
.asGreymap
~~~

![](sw/spl/Help/Image/NormalDistribution-D.png)

Generate a sample of pseudorandom numbers from a normal distribution:

~~~spl svg=E
let r = Sfc32(370841);
NormalDistribution(1, 3)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/NormalDistribution-E.svg)

PLot with mean at zero and small deviation:

~~~spl svg=F
let r = Sfc32(378914);
NormalDistribution(0, 1 / 9)
.randomVariate(r, [99])
.linePlot
~~~

![](sw/spl/Help/Image/NormalDistribution-F.svg)

Plot sorted random list:

~~~spl svg=G
let r = Sfc32(789146);
NormalDistribution(0, 1)
.randomVariate(r, [500])
.sort
.linePlot
~~~

![](sw/spl/Help/Image/NormalDistribution-G.svg)

* * *

See also: MultinormalDistribution, ProbabilityDistribution, SkewNormalDistribution, StableDistribution, StudentTDistribution

Guides: Probability Distributions, Random Functions

References:
_Csound_
[1](https://csound.com/docs/manual/gauss.html),
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/randn.html)
[2](https://au.mathworks.com/help/stats/normrnd.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
[2](https://en.wikipedia.org/wiki/Marsaglia_polar_method)
[3](https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform)

Categories: Probability, Random
