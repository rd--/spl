# Arc

- _Arc(center, radii, angles)_

A `Type` that represents an arc between _angles_ of an ellipse of _radii_ at _center_.

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

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arc.html)
[2](https://reference.wolfram.com/language/ref/Circle.html)

Categories: Geometry
