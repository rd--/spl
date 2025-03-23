# PoissonDistribution

- _PoissonDistribution(μ)_

A `Type` representing a Poisson distribution with mean μ.

Probability mass function:

~~~spl svg=A
0:30.collect(
	PoissonDistribution(10).pdf
).discretePlot
~~~

![](sw/spl/Help/Image/PoissonDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
0:30.collect(
	PoissonDistribution(10).cdf
).discretePlot
~~~

![](sw/spl/Help/Image/PoissonDistribution-B.svg)

Mean and variance:

```
>> PoissonDistribution(`mu`).mean
mu

>> PoissonDistribution(`mu`).variance
mu
```

* * *

See also: BinomialDistribution, GammaDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PoissonDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366j.htm),
_W_
[1](https://en.wikipedia.org/wiki/Poisson_distribution)
