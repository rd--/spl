# CauchyDistribution

- _CauchyDistribution(x0, gamma)_

Answer a `Type` that represents a Cauchy distribution.
The Cauchy distribution is the distribution of the _x_-intercept of a ray issuing from _(x0, gamma)_ with a uniformly distributed angle.
It is also the distribution of the ratio of two independent normally distributed random variables with `mean` `zero`.

Plot `pdf` over a subset of the reals:

~~~
let d = CauchyDistribution(0, 2);
(-7 -- 7).subdivide(500).collect { :x | d.pdf(x) }.plot
~~~

Plot `cdf` over a subset of the reals:

~~~
let d = CauchyDistribution(0, 2);
(-7 -- 7).subdivide(500).collect { :x | d.cdf(x) }.plot
~~~

Plot `quantile` over a subset of the reals:

~~~
let d = CauchyDistribution(10, 3.5);
(0 -- 1).subdivide(500).collect { :x | d.quantile(x).clip(-30, 50) }.plot
~~~

Plot `randomVariate`:

~~~
CauchyDistribution(0, 0.025).randomVariate(500).clip(-1, 1).plot
~~~

* * *

See also: cdf, mean, pdf, randomVariate, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CauchyDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3663.htm)
_W_
[1](https://en.wikipedia.org/wiki/Cauchy_distribution)
