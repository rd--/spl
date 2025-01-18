# BezierCurve

- _BezierCurve(aList, anInteger)_

A `Type` that represents a Bézier curve with control points _aList_ and spline degree _anInteger_.
A Bézier curve is a parametric curve defined by a sequence of control points.
Curves with spline degree two are called _quadratic_,
curves with spline degree three are called _cubic_.

The `size` of the control points list must be `one` plus an integer multiple of the spline degree.
A curve is _composite_ if this integer multiple is greater than `one`,
and _simple_ if it is equal to `one`.

A simple quadratic Bézier curve:

```
>>> BezierCurve([0 0; 1 1; 2 0], 2)
>>> .isSimple
true
```

A simple cubic Bézier curve:

```
>>> BezierCurve([0 0; 0 1; 2 1; 2 0], 3)
>>> .isSimple
true
```

The `componentCoordinates` of a composite cubic Bézier curve are the coordinates of simple curves:

```
>>> let c = [
>>> 	0 0; 1 1; 2 -1;
>>> 	3 0; 5 2; 6 -1;
>>> 	7 3
>>> ].BezierCurve(3);
>>> (
>>> 	c.isComposite,
>>> 	c.componentCount,
>>> 	c.componentCoordinates
>>> )
(
	true,
	2,
	[
		0 0; 1 1; 2 -1; 3 0:;
		3 0; 5 2; 6 -1; 7 3
	]
)
```

A cubic Bézier curve and its control points:

~~~spl svg=A
let p = [0 0; 1 1; 2 -1; 3 0];
[
	p.BezierCurve(3),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-A.svg)

A composite cubic Bézier curve and its control points:

~~~spl svg=B
let p = [0 0; 1 1; 2 -1; 3 0; 5 2; 6 -1; 7 3];
[
	p.BezierCurve(3),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-B.svg)

A composite cubic Bézier flower:

~~~spl svg=C
let p = (0, 4 .. 156).collect { :k |
	let x = (2.pi * k / 13);
	[x.cos x.sin]
};
p.BezierCurve(3).asLineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-C.svg)

Six random cubic Bézier curves,
threads over lists:

~~~spl svg=D
Sfc32(314729)
.randomInteger(1, 100, [6 4 2])
.BezierCurve(3)
.LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-D.svg)

A closed cubic Bézier curve:

~~~spl svg=E
let p = [0 0; 0 2; 2 0; 0 0];
[
	p.BezierCurve(3),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-E.svg)

A quadratic Bézier curve:

~~~spl svg=F
let p = [0 0; 1 1; 2 0];
[
	p.BezierCurve(2),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-F.svg)

A Bézier curve with spline degree 1 is equivalent to `Line`:

~~~spl svg=G
[0 0; 2 2; 4 -2; 6 0]
.BezierCurve(1)
.asLineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-G.svg)

* * *

See also: bernsteinBasis, Circle, cubicBezierFunctionAt, deCasteljausAlgorithm, Line, LineDrawing, Point, PointCloud, Polygon, quadraticBezierFunctionAt, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BezierCurve.html)
[2](https://reference.wolfram.com/language/ref/BezierCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/B%C3%A9zier_curve)

Categories: Geometry
