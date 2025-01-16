# spherePoints

- _spherePoints(n, r)_

Answer the positions of approximately _n_ points equally spaced on a sphere of radius _r_.

A _y,z_ projection of one hundred points on the surface of the unit sphere:

~~~spl svg=A
100.spherePoints(1).collect { :each |
	let [x, y, z] = each;
	[y, z]
}.scatterPlot
~~~

![](sw/spl/Help/Image/spherePoints-A.svg)

* * *

See also: %, ^, angleVector, cos, Range, sin, Sphere, spherePointsFibonacci

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SpherePoints.html)

Further Reading: Deserno 2004

Categories: Geometry
