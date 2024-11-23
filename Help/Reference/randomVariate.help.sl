# randomVariate

- _randomVariate(d, shape)_

Answer _shape_ pseudorandom variates from the `ProbablityDistribution` _d_.

Plot `randomVariate` of `CauchyDistribution`:

~~~
let d = CauchyDistribution(0, 0.025);
d.randomVariate(500).clip(-1, 1).linePlot
~~~

* * *

See also: ProbabilityDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomVariate.html)

Categories: Random
