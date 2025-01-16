# nextRandomFloatEulerianBetaDistribution

- _nextRandomFloatEulerianBetaDistribution(x1, x2, p1, p2)_

Parameters are:

- x1, x2: values will be in the range [x1, x2].
- p1: determines the probability of values near x1
- p2: determines the probability of values near x2

Smaller probability values produce higher probabilities near respective	boundaries.
The mean is _x1 / (x1 + x2)_.
As p1 and p2 increase the generator will slow down.

Special cases:

- p1 < 1 & p2 < 1:
The probabilities are greatest near x1 and x2.

- p1 = 1 & p2 = 1:
This is a uniform distribution.

- p1 > 1 & p2 > 1:
This a bounded Gaussian-type distribution.
The mean is the midpoint of the range if p1 = p2.
If p1 ≠ p2, the mean will be skewed to the lower probabilities respective bound.

- p1 = 1 & p2 = 2:
This is a linear distribution.

Biased low:

~~~spl svg=A
let rng = Sfc32(791741);
(
	{
		rng.nextRandomFloatEulerianBetaDistribution(
			0,
			1,
			1 / 3,
			3
		)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomFloatEulerianBetaDistribution-A.svg)

Biased high:

~~~spl svg=B
let rng = Sfc32(231749);
(
	{
		rng.nextRandomFloatEulerianBetaDistribution(
			0,
			1,
			3,
			1 / 3
		)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomFloatEulerianBetaDistribution-B.svg)

* * *

See also: CauchyDistribution, LinearDistribution, NormalDistribution, PoissonDistribution, WeibullDistribution

Categories: Random
