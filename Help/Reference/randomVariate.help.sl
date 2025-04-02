# randomVariate

- _randomVariate(d, r, shape)_

Answer _shape_ pseudo-random variates from the probablity distribution _d_,
drawn using the random number generator _r_.

Plot `randomVariate` of `CauchyDistribution`:

~~~spl svg=A
let r = Sfc32(478912);
let d = CauchyDistribution(0, 0.025);
d.randomVariate(r, 99).clip(-1, 1).linePlot
~~~

![](sw/spl/Help/Image/randomVariate-A.svg)

* * *

See also: CauchyDistribution, NormalDistribution, ProbabilityDistribution, UniformDistribution

Guides: Probability Distributions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomVariate.html)

Categories: Random
