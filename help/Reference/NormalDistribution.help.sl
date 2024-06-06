# NormalDistribution

- _NormalDistribution(mu, sigma)_

Answer a `Type` that represents a normal (Gaussian) distribution with mean `μ` and standard deviation `σ`.

Plot `pdf` over a subset of the reals:

~~~
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x | d.pdf(x) }
~~~

Plot `cdf` over a subset of the reals:

~~~
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x | d.cdf(x) }
~~~

Plot `randomVariate`:

~~~
NormalDistribution(0, 1).randomVariate(500).linePlot
~~~

* * *

See also: cdf, mean, pdf, randomVariate, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
