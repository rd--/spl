# poissonDistribution

- _poissonDistribution(r, mu)_

This function models the occurance rate of rare events.
This is a discrete distribution that answers positive integer values.
The distribution of values is unbounded at the upper end.
The mean and variance of the function are _aNumber_.

Small mean and variance:

~~~spl svg=A
let r = Sfc32(36814);
(
	{
		r.poissonDistribution(1 / 9)
	} ! 99
).stepPlot
~~~

![](sw/spl/Help/Image/poissonDistribution-A.svg)

Less small mean and variance:

~~~spl svg=B
let r = Sfc32(980141);
(
	{
		r.poissonDistribution(9)
	} ! 99
).stepPlot
~~~

![](sw/spl/Help/Image/poissonDistribution-B.svg)

* * *

See also: PoissonDistribution, Random, randomInteger, randomReal
