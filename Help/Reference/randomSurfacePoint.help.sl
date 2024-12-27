# randomSurfacePoint

- _randomSurfacePoint(aSphere, r, shape)_

Answer _shape_ random points on the surface of _aSphere_,
each drawn from the random number generator _r_.

A line drawing of one hundred random points on the surface of the unit sphere,
each drawn as a 1/10th unit line directed at the center:

~~~spl svg=A
Sphere([0 0 0], 1)
.randomSurfacePoint(
	Sfc32(22313),
	[100]
).collect { :each |
	[each * 0.9, each]
}.linePlot
~~~

![](sw/spl/Help/Image/randomSurfacePoint-A.svg)

* * *

See also: RandomNumberGenerator, randomReal, Sphere
