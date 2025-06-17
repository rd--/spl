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
