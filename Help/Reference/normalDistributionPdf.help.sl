# normalDistributionPdf

- _normalDistributionPdf(mu, sigma, x)_

Answer the probability density function for the normal distribution.

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	normalDistributionPdf(0, 1, x)
}
~~~

![](sw/spl/Help/Image/normalDistributionPdf-A.svg)

* * *

See also: normalDistributionCdf, poissonDistributionPdf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
