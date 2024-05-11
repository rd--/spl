# normalDistributionCdf

- _normalDistributionCdf(mu, sigma, x)_

Answer the cumulative distribution function for the normal distribution.

Plot over a subset of the reals:

~~~
(-5 -- 5).subdivide(600).collect { :x | 0.normalDistributionCdf(2, x) }.plot
~~~

* * *

See also: normalDistributionPdf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
