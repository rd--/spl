# nextRandomIntegerPoissonDistribution

- _nextRandomIntegerPoissonDistribution(anRng, aNumber)_

This function models the occurance rate of rare events.
This is a discrete distribution that answer positive integer values.
The distribution of values is unbounded at the upper end.
The mean and variance of the function are _aNumber_.

Small mean and variance:

~~~
let r = Sfc32(36814);
(
	{
		r.nextRandomIntegerPoissonDistribution(1 / 9)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomIntegerPoissonDistribution-A.svg)

Less small mean and variance:

~~~
let r = Sfc32(980141);
(
	{
		r.nextRandomIntegerPoissonDistribution(9)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomIntegerPoissonDistribution-B.svg)

* * *

See also: Random, randomInteger, randomReal
