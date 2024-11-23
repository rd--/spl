# nextRandomFloatCauchyDistribution

- _nextRandomFloatCauchyDistribution(mean, spread)_

A symmetric distribution centered around mean.
It is unbounded above and below the mean similar to the Gaussian distribution but with a higher occurance of remote values.

- mean: determines horizontal dispersion of values along curve
- spread: determines horizontal dispersion of values along curve

~~~
{ system.nextRandomFloatCauchyDistribution(0, 1 / 9) }.!(99).linePlot
~~~

* * *

See also: nextRandomFloat

Categories: Random
