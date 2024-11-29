# nextRandomFloatLinearDistribution

- _nextRandomFloatLinearDistribution(x1, x2)_

This is similar to exprand, but with a looser distribution.
Values closer to _x1_ are more likely to occur.

- x1, x2: produces values in range [x1, x2]

Biased to -1:

~~~
(
	{
		system.nextRandomFloatLinearDistribution(-1, 1)
	} ! 99
).linePlot
~~~

* * *

See also: Random, nextRandomFloat
