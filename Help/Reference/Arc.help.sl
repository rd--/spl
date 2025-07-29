# Arc

- _Arc([x y], [r₁ r₂], [a₁ a₂])_

A `Type` that represents an arc between angles _a_ of an ellipse of radii _r_ at center _(x,y)_.

```
>>> let a = Arc([0 0], [1 1], [1/2.pi 1.pi]);
>>> (
>>> 	a.center,
>>> 	a.radii,
>>> 	a.angles,
>>> 	a.radius,
>>> 	a.theta,
>>> 	a.sectorArea,
>>> 	a.segmentArea
>>> )
(
	[0 0],
	[1 1],
	[1/2.pi 1.pi],
	1,
	1/2.pi,
	0.7854,
	0.2854
)
```

Two circlular arcs, and a line:

~~~spl svg=A
[
	Line([0 0; 2 0]),
	Arc([0 0], [1 1], [1.75.pi 0.5.pi]),
	Arc([2 0], [1 1], [0.75.pi 1.5.pi])
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-A.svg)

An elliptical arc, and a circle:

~~~spl svg=B
[
	Circle([0 0], 1),
	Arc([0 0], [1 2], [1.75.pi 0.75.pi])
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-B.svg)

A geometric technique for finding twelve equally-spaced points around a circle:

~~~spl svg=C
let r = 1 / 1/4.pi.cos;
let c = circlePoints(12, [0 0], 1, 0);
[
	Circle([0 0], 1),
	regularPolygon(4, [0 0], r, 1/4.pi),
	Arc([-1 0], [1 1], [-1/2.pi 1/2.pi]),
	Arc([1 0], [1 1], [1/2.pi -1/2.pi]),
	Arc([0 1], [1 1], [-1.pi 0]),
	Arc([0 -1], [1 1], [0 1.pi]),
	PointCloud(c)
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-C.svg)

13th-century fifth-point arch shape,
according to Branner’s 1960 interpretation of the 13th-century Picard artist Villard de Honnecourt:

~~~spl svg=D
let n = 2 * 6.sqrt;
[
	Arc([5 0], [5 5], [1/2.pi 1.pi]),
	Arc([3 0], [5 5], [0 1/2.pi]),
	Line([4 0; 4 n])
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-D.svg)

* * *

See also: Circle, Ellipse, LineDrawing, Polygon, Rectangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arc.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Circular_arc)

Categories: Geometry
