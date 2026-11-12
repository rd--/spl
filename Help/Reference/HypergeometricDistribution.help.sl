# HypergeometricDistribution

- _HypergeometricDistribution(n, s, t)_

A `Type` representing a hypergeometric distribution of the number of successes in _n_ draws,
from a population of size _t_,
containing _s_ successes.

Probability mass function, varying _n_:

~~~spl svg=A
0L:32L.functionPlot(
	[10L 20L 50L].collect { :n |
		HypergeometricDistribution(
			n,
			50L,
			100L
		).pdf
	}
)
~~~

![](Help/Image/HypergeometricDistribution-A.svg)

Generate a sample of pseudo-random numbers:

~~~spl svg=B
let r = Sfc32(678324);
HypergeometricDistribution(20L, 50L, 100L)
.randomVariate(r, 10L ^ 4L)
.histogramPlot([4.5 16.5 1.0])
~~~

![](Help/Image/HypergeometricDistribution-B.svg)

* * *

See also: BinomialDistribution

Guides: Probability Distributions, Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HypergeometricDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Hypergeometric_distribution)
