# BinomialDistribution

- _BinomialDistribution(n, p)_

A `Type` representing a binomial distribution with _n_ trials and success probability _p_.

Probability mass function:

~~~spl svg=A
1L:36L.collect(
	BinomialDistribution(40L, 0.5).pdf
).discretePlot
~~~

![](Help/Image/BinomialDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
1L:36L.collect(
	BinomialDistribution(40L, 0.5).cdf
).discretePlot
~~~

![](Help/Image/BinomialDistribution-B.svg)

Skewness:

~~~spl svg=C
(0.0 -- 1.0).functionPlot(
	[1L 2L 5L 20L].collect { :n |
		{ :p |
			BinomialDistribution(n, p)
			.skewness
			.clip(-4.0, 4.0)
		}
	}
)
~~~

![](Help/Image/BinomialDistribution-C.svg)

Kurtosis:

~~~spl svg=D
(0.0 -- 1.0).functionPlot(
	[1L 2L 5L 20L].collect { :n |
		{ :p |
			BinomialDistribution(n, p)
			.kurtosis
			.clip(-1.0, 9.0)
		}
	}
)
~~~

![](Help/Image/BinomialDistribution-D.svg)

Generate a sample of pseudo-random numbers from a binomial distribution:

~~~spl svg=E
let r = Sfc32(801894);
BinomialDistribution(10L, 0.4)
.randomVariate(r, [10L ^ 4L])
.histogramPlot
~~~

![](Help/Image/BinomialDistribution-E.svg)

* * *

See also: BernoulliDistribution, GeometricDistribution, NormalDistribution, PoissonDistribution, binomial

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinomialDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366i.htm),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_distribution)
