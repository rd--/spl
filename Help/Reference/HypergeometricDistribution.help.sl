# HypergeometricDistribution

- _HypergeometricDistribution(n, s, t)_

A `Type` representing a hypergeometric distribution of the number of successes in _n_ draws,
from a population of size _t_,
containing _s_ successes.

Probability mass function, varying _n_:

~~~spl svg=A
0:32.functionPlot(
	[10 20 50].collect { :n |
		HypergeometricDistribution(
			n,
			50,
			100
		).pdf
	}
)
~~~

![](sw/spl/Help/Image/HypergeometricDistribution-A.svg)

Generate a sample of pseudo-random numbers:

~~~spl svg=B
let r = Sfc32(678324);
HypergeometricDistribution(20, 50, 100)
.randomVariate(r, 10 ^ 4)
.histogramPlot([4.5 16.5 1])
~~~

![](sw/spl/Help/Image/HypergeometricDistribution-B.svg)

* * *

See also: BinomialDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HypergeometricDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Hypergeometric_distribution)
