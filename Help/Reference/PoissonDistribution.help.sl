# PoissonDistribution

- _PoissonDistribution(μ)_

A `Type` representing a Poisson distribution with mean μ.

Probability mass function:

~~~spl svg=A
0L:30L.collect(
	PoissonDistribution(10L).pdf
).discretePlot
~~~

![](Help/Image/PoissonDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
0L:30L.collect(
	PoissonDistribution(10L).cdf
).discretePlot
~~~

![](Help/Image/PoissonDistribution-B.svg)

Generate a sample of pseudorandom numbers from a Poisson distribution:

~~~spl svg=C
let r = Sfc32(891314);
PoissonDistribution(3L)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](Help/Image/PoissonDistribution-C.svg)

Step plot with small mean and variance:

~~~spl svg=D
let r = Sfc32(36814);
PoissonDistribution(1 / 9)
.randomVariate(r, [99])
.stepPlot
~~~

![](Help/Image/PoissonDistribution-D.svg)

Step plot with less small mean and variance:

~~~spl svg=E
let r = Sfc32(980141);
PoissonDistribution(9L)
.randomVariate(r, [99])
.stepPlot
~~~

![](Help/Image/PoissonDistribution-E.svg)

Mean and variance:

```
>> PoissonDistribution(`mu`).mean
mu

>> PoissonDistribution(`mu`).variance
mu
```

* * *

See also: BinomialDistribution, GammaDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Csound_
[1](https://csound.com/docs/manual/poisson.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PoissonDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366j.htm),
_W_
[1](https://en.wikipedia.org/wiki/Poisson_distribution)
