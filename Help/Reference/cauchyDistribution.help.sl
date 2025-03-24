# cauchyDistribution

- _cauchyDistribution(r, x0, gamma)_

A symmetric distribution centered around _x0_.
It is unbounded above and below the mean,
similar to the Gaussian distribution but with a higher occurance of remote values.

- x0: determines horizontal dispersion of values along curve
- gamma: determines horizontal dispersion of values along curve

~~~spl svg=A
let r = Sfc32(789413);
{
	r.cauchyDistribution(
		0,
		1 / 9
	)
}.!(99).linePlot
~~~

![](sw/spl/Help/Image/cauchyDistribution-A.svg)

* * *

See also: CauchyDistribution, nextRandomFloat

Categories: Random
