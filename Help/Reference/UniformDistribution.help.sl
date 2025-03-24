# UniformDistribution

- _UniformDistribution(min, max)_

Answer a `Type` that represents a uniform distribution with minima _min_ and maxima _max_.

Calculate `entropy`, `mean`, `median`, `kurtosis`, `skewness`, `standardDeviation` and `variance`:

```
>>> let d = UniformDistribution(0, 2.pi);
>>> (
>>> 	d.entropy,
>>> 	d.mean,
>>> 	d.median,
>>> 	d.kurtosis,
>>> 	d.skewness,
>>> 	d.standardDeviation,
>>> 	d.variance
>>> )
(
	2.pi.log,
	1.pi,
	1.pi,
	9/5,
	0,
	1.pi / 3.sqrt,
	(1.pi / 3.sqrt).squared
)
```

Plot `pdf` over a subset of the reals:

~~~spl svg=A
(-1 -- 2).functionPlot(
	UniformDistribution(0, 1).pdf
)
~~~

![](sw/spl/Help/Image/UniformDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
(-1 -- 2).functionPlot(
	UniformDistribution(0, 1).cdf
)
~~~

![](sw/spl/Help/Image/UniformDistribution-B.svg)

Plot `randomVariate`:

~~~spl svg=C
let r = Sfc32(378914);
UniformDistribution(0, 1)
.randomVariate(r, 99)
.linePlot
~~~

![](sw/spl/Help/Image/UniformDistribution-C.svg)

Two dimensional Uniform noise:

~~~spl png=D
let r = Sfc32(180513);
UniformDistribution(0, 1)
.randomVariate(r, [100 100])
.Graymap
~~~

![](sw/spl/Help/Image/UniformDistribution-D.png)

Generate a sample of pseudorandom numbers from a uniform distribution:

~~~spl svg=E
let r = Sfc32(318420);
UniformDistribution(1, 3)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/UniformDistribution-E.svg)

* * *

See also: CauchyDistribution, cdf, mean, NormalDistribution, pdf, randomVariate, standardDeviation, WeibullDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UniformDistribution.html)
[2](https://reference.wolfram.com/language/ref/UniformDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3662.htm)
_W_
[1](https://en.wikipedia.org/wiki/Continuous_uniform_distribution)

Categories: Probability, Random
