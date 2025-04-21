# randomPoint

- _randomPoint(aRegion, r, shape)_

Answer _shape_ random points on or in _aRegion_ drawn from the random number generator _r_.

At `Circle` answers points _on_ the circle.
A plot of one hundred random points on the unit circle:

~~~spl svg=A
Circle([0, 0], 1).randomPoint(
	Sfc32(367814),
	[66]
).scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-A.svg)

At `Rectangle` answers points _in_ the rectangle:

~~~spl svg=B
let r = Sfc32(789142);
Rectangle([0, 0], [1 1])
.randomPoint(r, [66])
.scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-B.svg)

At `Sphere` answers points _on_ the surface of the sphere.
A plot of one hundred random points on the surface of the unit sphere:

~~~spl svg=C
let r = Sfc32(232313);
Sphere([0 0 0], 1)
.randomPoint(r, [10 ^ 2])
.collect { :each |
	let [x, y, z] = each;
	[x, y]
}.scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-C.svg)

At `Ball` answers points _in_ the ball.
A plot of one hundred random points in the unit ball:

~~~spl svg=D
let r = Sfc32(232313);
Ball([0 0 0], 1)
.randomPoint(r, [10 ^ 2])
.collect { :each |
	let [x, y, z] = each;
	[x, y]
}.scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-D.svg)

* * *

See also: circlePoints, randomVariate, spherePoints, spherePointsFibonacci

Guides: Random Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SpherePointPicking.html)
[2](https://reference.wolfram.com/language/ref/RandomPoint.html)

Further Reading: Marsaglia 1972, von Neumann 1951

Categories: Random
