# LaplaceDistribution

- _LaplaceDistribution(μ, β)_

A `Type` representing a Laplace double-exponential distribution with mean μ and scale parameter β.

Probability density function:

~~~spl svg=A
(0.0 -- 5.0).functionPlot(
	[0.5 1.0 2.0].collect { :beta |
		LaplaceDistribution(2.0, beta).pdf
	}
)
~~~

![](Help/Image/LaplaceDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0.0 -- 5.0).functionPlot(
	[0.5 1.0 2.0].collect { :beta |
		LaplaceDistribution(2.0, beta).cdf
	}
)
~~~

![](Help/Image/LaplaceDistribution-B.svg)

Generate a sample of pseudorandom numbers from a Laplace distribution:

~~~spl svg=C
let r = Sfc32(368714);
LaplaceDistribution(3.0, 3.5)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/LaplaceDistribution-C.svg)

* * *

See also: ExponentialDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LaplaceDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Laplace_distribution)
