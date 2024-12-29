# spherePointsFibonacci

- _spherePointsFibonacci(n)_

Answer the positions of _n_ points of the Fibonacci lattice on the surface of a sphere.

Line drawings of two hundred points on the surface of the unit sphere,
in _x,y_ and _x,z_ views:

~~~
200.spherePointsFibonacci.collect { :each |
	let [x, y, z] = each;
	[x, y]
}.scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-A.svg)

~~~
200.spherePointsFibonacci.collect { :each |
	let [x, y, z] = each;
	[x, z]
}.scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-B.svg)

An _isometric_ projection of the same point set:

~~~
200.spherePointsFibonacci.collect(
	AxonometricProjection(
		pi / 6, pi / 6,
		1, 1, 1
	).asBlock
).scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-C.svg)

* * *

See also: cos, sin, spherePoints, Sphere

Further Reading: González 2010

Categories: Geometry
