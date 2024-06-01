# normalDistributionPdf

- _normalDistributionPdf(mu, sigma, x)_

Answer the probability density function for the normal distribution.

Plot over a subset of the reals:

~~~
(-3 -- 3).subdivide(500).collect { :x |
	normalDistributionPdf(0, 1, x)
}.plot
~~~

* * *

See also: normalDistributionCdf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
