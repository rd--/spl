# LogNormalDistribution

- _LogNormalDistribution(μ, σ)_

A `Type` representing a log-normal distribution derived from a normal distribution with mean μ and standard deviation σ.

Plot `randomVariate`:

~~~spl svg=A
let r = Sfc32(789134);
LogNormalDistribution(0, 1)
.randomVariate(r, 99)
.linePlot
~~~

![](sw/spl/Help/Image/LogNormalDistribution-A.svg)

Two dimensional log-normal noise:

~~~spl png=B
let r = Sfc32(180513);
LogNormalDistribution(0, 1 / 3)
.randomVariate(r, [100 100])
.asGraymap
~~~

![](sw/spl/Help/Image/LogNormalDistribution-B.png)

* * *

See also: erf, inverseErf, NormalDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogNormalDistribution.html)
[2](https://reference.wolfram.com/language/ref/LogNormalDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/stats/lognormal-distribution.html),
_Python_
[1](https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.lognormal.html),
_W_
[1](https://en.wikipedia.org/wiki/Log-normal_distribution)
