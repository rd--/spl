# BezierCurve

- _BezierCurve(aList)_

A `Type` that represents a Bézier curve with control points _aList_.
A Bézier curve is a parametric curve defined by a sequence of control points.

A Bézier curve and its control points:

~~~spl svg=A
let p = [0 0; 1 1; 2 -1; 3 0];
[
	p.BezierCurve,
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-A.svg)

A composite Bézier curve and its control points:

~~~spl svg=B
let p = [0 0; 1 1; 2 -1; 3 0; 5 2; 6 -1; 7 3];
[
	p.BezierCurve,
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-B.svg)

A composite Bézier flower:

~~~spl svg=C
let p = (0, 4 .. 156).collect { :k |
	let x = (2.pi * k / 13);
	[x.cos x.sin]
};
[p.BezierCurve].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-C.svg)

Six random Bézier curves:

~~~spl svg=D
Sfc32(314729)
.randomInteger(1, 100, [6 4 2])
.BezierCurve
.LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-D.svg)

* * *

See also: bernsteinBasis, Circle, Line, LineDrawing, Point, PointCloud, Polygon, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BezierCurve.html)
[2](https://reference.wolfram.com/language/ref/BezierCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/B%C3%A9zier_curve)

Categories: Geometry
