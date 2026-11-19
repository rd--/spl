# LogisticDistribution

- _LogisticDistribution(μ, β)_

A `Type` representing a logistic distribution with mean μ and scale parameter β.

Probability density function:

~~~spl svg=A
(-10.0 -- 10.0).functionPlot(
	[-2.0 0.0 3.0].collect { :mu |
		LogisticDistribution(mu, 2.0).pdf
	}
)
~~~

![](Help/Image/LogisticDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(-10.0 -- 10.0).functionPlot(
	[-2.0 0.0 3.0].collect { :mu |
		LogisticDistribution(mu, 2.0).cdf
	}
)
~~~

![](Help/Image/LogisticDistribution-B.svg)

Generate a sample of pseudorandom numbers from a Laplace distribution:

~~~spl svg=C
let r = Sfc32(380149);
LogisticDistribution(3.0, 2.5)
.randomVariate(r, [10L ^ 4L])
.histogramPlot([-15.0 20.0 1.0])
~~~

![](Help/Image/LogisticDistribution-C.svg)

* * *

See also: ExponentialDistribution, UniformDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LogisticDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Logistic_distribution)
