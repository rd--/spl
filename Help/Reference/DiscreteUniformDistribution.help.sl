# DiscreteUniformDistribution

- _DiscreteUniformDistribution([x₁ x₂])_
- _DiscreteUniformDistribution([x₁ x₂; y₁ y₂ …])_

Answer a `Type` that represents a discrete uni-variate uniform distribution with minima _x₁_ and maxima _x₂_,
or a multi-variate discrete uniform distribution with minima _(x₁,y₁…)_ and maxima _(x₂,y₂…)_

Generate a sample of pseudorandom numbers from a discrete uniform distribution:

~~~spl svg=A
let r = Sfc32(318420);
DiscreteUniformDistribution([1 23])
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/DiscreteUniformDistribution-A.svg)

Multi-variate uniform random integers, plot as _(r, θ)_:

~~~spl svg=B
let r = Sfc32(379312);
DiscreteUniformDistribution(
	[1 45; -9 9]
)
.randomVariate(r, [2 ^ 7])
.collect { :each |
	each
	.degreesToRadians
	.fromPolarCoordinates
}
.scatterPlot
~~~

![](sw/spl/Help/Image/DiscreteUniformDistribution-B.svg)

Multi-variate discrete uniform noise,
plot as _(r,g,b)_ array:

~~~spl svg=C
let r = Sfc32(317942);
let c = DiscreteUniformDistribution(
	[0 4; 1 3; 1 4]
)
.randomVariate(r, [5 15]);
(c / 5).arrayPlot
~~~

![](sw/spl/Help/Image/DiscreteUniformDistribution-C.svg)

* * *

See also: UniformDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiscreteUniformDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Discrete_uniform_distribution)
