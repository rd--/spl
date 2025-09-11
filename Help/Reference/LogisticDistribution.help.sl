# LogisticDistribution

- _LogisticDistribution(μ, β)_

A `Type` representing a logistic distribution with mean μ and scale parameter β.

Probability density function:

~~~spl svg=A
(-10 -- 10).functionPlot(
	[-2 0 3].collect { :mu |
		LogisticDistribution(mu, 2).pdf
	}
)
~~~

![](sw/spl/Help/Image/LogisticDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(-10 -- 10).functionPlot(
	[-2 0 3].collect { :mu |
		LogisticDistribution(mu, 2).cdf
	}
)
~~~

![](sw/spl/Help/Image/LogisticDistribution-B.svg)

Generate a sample of pseudorandom numbers from a Laplace distribution:

~~~spl svg=C
let r = Sfc32(380149);
LogisticDistribution(3, 2.5)
.randomVariate(r, [10 ^ 4])
.histogramPlot([-15 20 1])
~~~

![](sw/spl/Help/Image/LogisticDistribution-C.svg)

* * *

See also: ExponentialDistribution, UniformDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LogisticDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Logistic_distribution)
