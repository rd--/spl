# BinomialDistribution

- _BinomialDistribution(n, p)_

A `Type` representing a binomial distribution with _n_ trials and success probability _p_.

Probability mass function:

~~~spl svg=A
let d = BinomialDistribution(40, 0.5);
1:36.collect { :k |
	d.pdf(k)
}.discretePlot
~~~

![](sw/spl/Help/Image/BinomialDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
let d = BinomialDistribution(40, 0.5);
1:36.collect { :k |
	d.cdf(k)
}.discretePlot
~~~

![](sw/spl/Help/Image/BinomialDistribution-B.svg)

Skewness:

~~~spl svg=C
(0 -- 1).functionPlot { :p |
	BinomialDistribution(5, p)
	.skewness
	.clip(-4, 4)
}
~~~

![](sw/spl/Help/Image/BinomialDistribution-C.svg)


* * *

See also:

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinomialDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366i.htm),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_distribution)
