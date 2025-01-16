# NormalDistribution

- _NormalDistribution(mu, sigma)_

Answer a `Type` that represents a normal (Gaussian) distribution with mean `μ` and standard deviation `σ`.

Plot `pdf` over a subset of the reals:

~~~spl svg=A
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x | d.pdf(x) }
~~~

![](sw/spl/Help/Image/NormalDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x | d.cdf(x) }
~~~

![](sw/spl/Help/Image/NormalDistribution-B.svg)

Plot `randomVariate`:

~~~spl svg=C
let r = Sfc32(789134);
let d = NormalDistribution(0, 1);
d.randomVariate(r, 99).linePlot
~~~

![](sw/spl/Help/Image/NormalDistribution-C.svg)

* * *

See also: CauchyDistribution, cdf, mean, pdf, randomVariate, standardDeviation, UniformDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3661.htm),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)

Categories: Probability, Random
