# UniformDistribution

- _UniformDistribution([x₁ x₂])_
- _UniformDistribution([x₁ x₂; y₁ y₂ …])_

Answer a `Type` that represents a uni-variate uniform distribution with minima _x₁_ and maxima _x₂_,
or a multi-variate uniform distribution with minima _(x₁,y₁…)_ and maxima _(x₂,y₂…)_

Calculate `entropy`, `mean`, `median`, `kurtosis`, `skewness`, `standardDeviation` and `variance`:

```
>>> let d = [0 2.pi].UniformDistribution;
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
	(1.pi / 3.sqrt).square
)
```

Probability density function at specific value:

```
>>> [0 1].UniformDistribution.pdf(0.5)
1

>>> [-1 1].UniformDistribution.pdf(0.5)
1/2
```

Cumulative distribution function at specific value:

```
>>> [0 1].UniformDistribution.cdf(0.5)
0.5
```

Plot `pdf` over a subset of the reals:

~~~spl svg=A
(-1 -- 2).functionPlot(
	[0 1].UniformDistribution.pdf
)
~~~

![](sw/spl/Help/Image/UniformDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
(-1 -- 2).functionPlot(
	[0 1].UniformDistribution.cdf
)
~~~

![](sw/spl/Help/Image/UniformDistribution-B.svg)

Plot `randomVariate` of a uni-variate uniform distribution:

~~~spl svg=C
let r = Sfc32(378914);
UniformDistribution([0 1])
.randomVariate(r, 99)
.linePlot
~~~

![](sw/spl/Help/Image/UniformDistribution-C.svg)

Two dimensional uni-variate uniform noise:

~~~spl png=D
let r = Sfc32(180513);
UniformDistribution([0 1])
.randomVariate(r, [100 100])
.Graymap
~~~

![](sw/spl/Help/Image/UniformDistribution-D.png)

Generate a sample of pseudorandom numbers from a uniform distribution:

~~~spl svg=E
let r = Sfc32(318420);
UniformDistribution([1 3])
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/UniformDistribution-E.svg)

Multi-variate uniform noise,
plot as _(r,g,b)_ array:

~~~spl svg=F
let r = Sfc32(367814);
UniformDistribution(
	[0 0.75; 0.25 0.75; 0 1]
)
.randomVariate(r, [5 15])
.arrayPlot
~~~

![](sw/spl/Help/Image/UniformDistribution-F.svg)

Multi-variate uniform noise, plot as _(r, θ)_:

~~~spl svg=G
let r = Sfc32(379312);
UniformDistribution(
	[0 1; -0.25.pi 0.25.pi]
)
.randomVariate(r, [2 ^ 7])
.collect(fromPolarCoordinates:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/UniformDistribution-G.svg)

* * *

See also: CauchyDistribution, cdf, DiscreteUniformDistribution, mean, MultinormalDistribution, NormalDistribution, pdf, randomVariate, ReciprocalDistribution, standardDeviation, WeibullDistribution

References:
_Csound_
[1](https://csound.com/docs/manual/unirand.html),
_Mathematica_
[1](https://mathworld.wolfram.com/UniformDistribution.html)
[2](https://reference.wolfram.com/language/ref/UniformDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3662.htm),
_Python_
[1](https://numpy.org/doc/2.2/reference/random/generated/numpy.random.uniform.html),
_W_
[1](https://en.wikipedia.org/wiki/Continuous_uniform_distribution)

Categories: Probability, Random
