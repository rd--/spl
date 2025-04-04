# EpanechnikovDistribution

- _EpanechnikovDistribution(c)_

A `Type` representing an Epanechnikov distribution,
a continuous probability distribution defined on a finite interval.

Plot the probability density function,
`pdf`,
over a subset of the reals:

~~~spl svg=A
let c = 5.sqrt;
(c.- -- c).functionPlot(
	EpanechnikovDistribution(c).pdf
)
~~~

![](sw/spl/Help/Image/EpanechnikovDistribution-A.svg)

Plot the cumulative distribution function,
`cdf`,
 over a subset of the reals:

~~~spl svg=B
let c = 5.sqrt;
(c.- -- c).functionPlot(
	EpanechnikovDistribution(c).cdf
)
~~~

![](sw/spl/Help/Image/EpanechnikovDistribution-B.svg)

_Note_:
The Epanechnikov distribution can be viewed as a special case of a Beta distribution.

* * *

See also: BetaDistribution, epanechnikovKernel

References:
_W_
[1](https://en.wikipedia.org/wiki/Kernel_(statistics))
[2](https://en.wikipedia.org/wiki/Epanechnikov_distribution)

Further Reading: Epanechnikov 1969
