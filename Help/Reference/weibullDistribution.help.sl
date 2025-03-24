# weibullDistribution

- _weibullDistribution(r, alpha, beta, mu)_

Answer represents a Weibull distribution with
a shape parameter α (also called γ or _k_),
a scale parameter β (also called α or λ),
and a location parameter μ.

This is a complex, yet powerful, distribution relying on 3 parameters.
These are known as the location, spread, and shape parameters.
The _location_ and _spread_ parameters are used interchangeably to set the mean.
The _shape_ parameter alters the curve of the distribution.

Effects of α:

- 0 < α <= 1: occurance of values near _μ_ increases as α -> 0
- α = 1: same as exponential distribution

~~~spl svg=A
let rng = Sfc32(391437);
let f = {
	rng
	.weibullDistribution(
		3 / 4,
		1,
		0
	)
};
(f:/0 ! 99).linePlot
~~~

![](sw/spl/Help/Image/weibullDistribution-A.svg)

* * *

See also: nextRandomFloat, eulerianBetaDistribution, WeibullDistribution

Categories: Random
