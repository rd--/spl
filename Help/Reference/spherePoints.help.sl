# spherePoints

- _spherePoints(n, r)_

Answer the positions of approximately _n_ points equally spaced on a sphere of radius _r_.

A line drawing of one hundred points on the surface of the unit sphere,
each drawn as a 1/10th unit line directed at the center:

~~~
100.spherePoints(1).collect { :each |
	[each * 0.9, each]
}.linePlot
~~~

![](sw/spl/Help/Image/spherePoints-A.svg)

* * *

See also: %, ^, angleVector, cos, Range, sin, Sphere, spherePointsFibonacci

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SpherePoints.html)

Further Reading: Deserno 2004

Categories: Geometry
