# PoissonDistribution

- _PoissonDistribution(n, p)_

A `Type` representing a binomial distribution with _n_ trials and success probability _p_.

Probability mass function:

~~~spl svg=A
let d = PoissonDistribution(10);
0:30.collect { :k |
	d.pdf(k)
}.discretePlot
~~~

![](sw/spl/Help/Image/PoissonDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
let d = PoissonDistribution(10);
0:30.collect { :k |
	d.cdf(k)
}.discretePlot
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
