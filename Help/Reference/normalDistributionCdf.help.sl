# normalDistributionCdf

- _normalDistributionCdf(mu, sigma, x)_

Answer the cumulative distribution function for the normal distribution.

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :x |
	0.normalDistributionCdf(2, x)
}
~~~

![](sw/spl/Help/Image/normalDistributionCdf-A.svg)

* * *

See also: normalDistributionPdf, poissonDistributionPdf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
