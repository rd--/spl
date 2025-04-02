# cdf

- _cdf(d)_
- _cdf(d, x)_

Answer the cumulative distribution function for the distribution _d_,
evaluated at _x_.

`cdf` of _x_ gives the probability that an observed value will be less than or equal to _x_.

Plot `cdf` for a standard normal distribution:

~~~spl svg=A
(-3 -- 3).functionPlot(
	NormalDistribution(0, 1).cdf
)
~~~

![](sw/spl/Help/Image/cdf-A.svg)

* * *

See also: inverseCdf, pdf, sum, survivalFunction

Guides: Probability Distributions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DistributionFunction.html)
[1](https://reference.wolfram.com/language/ref/CDF.html),
_W_
[1](https://en.wikipedia.org/wiki/Cumulative_distribution_function)

Categories: Random
