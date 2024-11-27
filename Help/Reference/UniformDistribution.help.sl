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
	pi,
	pi,
	9/5,
	0,
	pi / 3.sqrt,
	(pi / 3.sqrt).squared
)
```

Plot `pdf` over a subset of the reals:

~~~
let d = UniformDistribution(0, 1);
(-1 -- 2).functionPlot { :x | d.pdf(x) }
~~~

Plot `cdf` over a subset of the reals:

~~~
let d = UniformDistribution(0, 1);
(-1 -- 2).functionPlot { :x | d.cdf(x) }
~~~

Plot `randomVariate`:

~~~
let d = UniformDistribution(0, 1);
d.randomVariate(500).linePlot
~~~

* * *

See also: cdf, mean, pdf, randomVariate, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UniformDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3662.htm)
_W_
[1](https://en.wikipedia.org/wiki/Continuous_uniform_distribution)

Categories: Probability, Random
