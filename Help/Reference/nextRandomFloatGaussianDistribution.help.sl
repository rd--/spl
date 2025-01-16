# nextRandomFloatGaussianDistribution

Generates a bell-shaped curve centered around mean.
Good for simulating life-like behavior and mutations.
Also known as _Normal Distribution_.

- mean: mean value
- deviation: determines the spread of values above and below mean

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

```spl svg=B
let r = Sfc32(789146);
(
	{
		r.nextRandomFloatGaussianDistribution(0, 1)
	} ! 500
).sort.linePlot
```

![](sw/spl/Help/Image/nextRandomFloatGaussianDistribution-B.svg)

* * *

See also: nextRandomFloat

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
