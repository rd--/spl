# NormalDistribution

- _NormalDistribution(mu, sigma)_

Answer a `Type` that represents a normal (Gaussian) distribution with mean `μ` and standard deviation `σ`.

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
.randomVariate(r, 99)
.linePlot
~~~

![](sw/spl/Help/Image/NormalDistribution-C.svg)

Two dimensional Gaussian noise:

~~~spl png=D
let r = Sfc32(180513);
NormalDistribution(0, 1)
.randomVariate(r, [100 100])
.asGraymap
~~~

![](sw/spl/Help/Image/NormalDistribution-D.png)

* * *

See also: CauchyDistribution, cdf, mean, pdf, randomVariate, standardDeviation, UniformDistribution, WeibullDistribution

References:
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)

Categories: Probability, Random
