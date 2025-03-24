# BinomialDistribution

- _BinomialDistribution(n, p)_

A `Type` representing a binomial distribution with _n_ trials and success probability _p_.

Probability mass function:

~~~spl svg=A
1:36.collect(
	BinomialDistribution(40, 0.5).pdf
).discretePlot
~~~

![](sw/spl/Help/Image/BinomialDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
1:36.collect(
	BinomialDistribution(40, 0.5).cdf
).discretePlot
~~~

![](sw/spl/Help/Image/BinomialDistribution-B.svg)

Skewness:

~~~spl svg=C
(0 -- 1).functionPlot(
	[1 2 5 20].collect { :n |
		{ :p |
			BinomialDistribution(n, p)
			.skewness
			.clip(-4, 4)
		}
	}
)
~~~

![](sw/spl/Help/Image/BinomialDistribution-C.svg)

Kurtosis:

~~~spl svg=D
(0 -- 1).functionPlot(
	[1 2 5 20].collect { :n |
		{ :p |
			BinomialDistribution(n, p)
			.kurtosis
			.clip(-1, 9)
		}
	}
)
~~~

![](sw/spl/Help/Image/BinomialDistribution-D.svg)

Generate a sample of pseudo-random numbers from a binomial distribution:

~~~spl svg=E
let r = Sfc32(801894);
BinomialDistribution(10, 0.4)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/BinomialDistribution-E.svg)

* * *

See also: BernoulliDistribution, binomial, GeometricDistribution, NormalDistribution, PoissonDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinomialDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366i.htm),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_distribution)
