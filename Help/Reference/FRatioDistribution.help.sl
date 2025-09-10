# FRatioDistribution

- _FRatioDistribution(n, m)_

A `Type` representing an F-ratio distribution with _n_ numerator and _m_ denominator degrees of freedom.

Generate a sample of pseudo-random numbers from an F-ratio distribution:

~~~spl svg=A
let r = Sfc32(781241);
FRatioDistribution(25, 50)
.randomVariate(r, 10^4)
.histogramPlot
~~~

![](sw/spl/Help/Image/FRatioDistribution-A.svg)

* * *

See also: ChiSquareDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FRatioDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/F-distribution)
