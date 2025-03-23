# nextRandomFloatGaussianDistribution

- _nextRandomFloatGaussianDistribution(mu, sigma)_

Generates a bell-shaped curve with mean _mu_ and deviation _sigma_.
Also known as _Normal Distribution_.

Mean at zero, small deviation:

~~~spl svg=A
let r = Sfc32(378914);
(
	{
		r.nextRandomFloatGaussianDistribution(0, 1 / 9)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomFloatGaussianDistribution-A.svg)

Plot sorted random list:

~~~spl svg=B
let r = Sfc32(789146);
(
	{
		r.nextRandomFloatGaussianDistribution(0, 1)
	} ! 500
).sort.linePlot
~~~

![](sw/spl/Help/Image/nextRandomFloatGaussianDistribution-B.svg)

* * *

See also: nextRandomFloat, NormalDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_Python_
[1](https://numpy.org/doc/stable/reference/random/generated/numpy.random.normal.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
