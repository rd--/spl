# spherePointsFibonacci

- _spherePointsFibonacci(n)_

Answer the positions of _n_ points of the Fibonacci lattice on the surface of a sphere.

Line drawings of two hundred points on the surface of the unit sphere,
in _x,y_ and _x,z_ views:

~~~spl svg=A
200.spherePointsFibonacci.collect { :each |
	let [x, y, z] = each;
	[x, y]
}.scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-A.svg)

~~~spl svg=B
200.spherePointsFibonacci.collect { :each |
	let [x, y, z] = each;
	[x, z]
}.scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-B.svg)

An _isometric_ projection of the same point set:

~~~spl svg=C
200.spherePointsFibonacci.collect(
	AxonometricProjection(
		1/6.pi, 0, 1/6.pi,
		1, 1, 1
	).asUnaryBlock
).scatterPlot
~~~

![](sw/spl/Help/Image/spherePointsFibonacci-C.svg)

* * *

See also: cos, sin, spherePoints, Sphere

Further Reading: González 2010

Categories: Geometry
