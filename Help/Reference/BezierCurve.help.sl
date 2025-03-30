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
>>> let c = BezierCurve([0 0; 1 1; 2 0], 2);
>>> (
>>> 	c.isSimple,
>>> 	c.splineDegree,
>>> 	c.componentApproximationSize,
>>> 	c.arcLength
>>> )
(true, 2, 128, 2.2956)
```

A simple cubic Bézier curve:

```
>>> let c = BezierCurve(
>>> 	[0 0; 0 1; 2 1; 2 0],
>>> 	3
>>> );
>>> (
>>> 	c.isSimple,
>>> 	c.splineDegree,
>>> 	c.componentApproximationSize,
>>> 	c.arcLength
>>> )
(true, 3, 192, 2.7893)
```

The `componentCoordinatesList` of a composite cubic Bézier curve are the coordinates of simple curves,
the `componentCount` is the number of components:

```
>>> let c = [
>>> 	0 0; 1 1; 2 -1;
>>> 	3 0; 5 2; 6 -1;
>>> 	7 3
>>> ].BezierCurve(3);
>>> (
>>> 	c.isSimple,
>>> 	c.isComposite,
>>> 	c.splineDegree,
>>> 	c.componentCount,
>>> 	c.componentCoordinatesList
>>> )
(
	false,
	true,
	3,
	2,
	[
		0 0; 1 1; 2 -1; 3 0:;
		3 0; 5 2; 6 -1; 7 3
	]
)
```

Calculate approximate arc length of simple quadratic Bézier curve:

```
>>> [70 250; 20 110; 220 60]
>>> .BezierCurve(2)
>>> .arcLength
281.95
```

Calculate approximate arc length of simple cubic Bézier curve:

```
>>> [110 150; 25 190; 210 250; 210 30]
>>> .BezierCurve(3)
>>> .arcLength
272.87
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
.randomInteger([1 100], [6 4 2])
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

A cubic Bézier curve with a crossing:

~~~spl svg=H
let p = [1 1; 8 7; 2 8; 6 0];
[
	p.BezierCurve(3),
	p.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-H.svg)

The distance between equally spaced indices is not, in general, equal:

~~~spl svg=I
let p = [35 140; 175 245; 15 35; 65 150];
let d = BezierCurve(p, 3).distance;
let i = (0 -- 1).discretize(d.size);
[i, d / d.last].transposed.linePlot
~~~

![](sw/spl/Help/Image/BezierCurve-I.svg)

A single cubic Bézier curve:

~~~spl svg=J
let p = [0 0; 1 2; 2 2; 3 0];
[
	p.BezierCurve(3),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-J.svg)

A composite Bézier curve:

~~~spl svg=K
let p = [0 0; 1 3; 2 3; 3 0; 4 3; 5 0; 6 3];
[
	p.BezierCurve(3),
	p.Line,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-K.svg)

Draw a simple cubic Bézier curve overlayed with an approximation:

~~~spl svg=L
let p = [110 150; 25 190; 210 250; 210 30];
let c = p.BezierCurve(3);
[
	c,
	p.Line,
	p.PointCloud,
	c.approximation.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-L.svg)

Draw a downsampled `approximation` as a `PointCloud`,
indicating the non-uniform distances along the curve between equidistant sampling points:

~~~spl svg=M
[110 150; 25 190; 210 250; 210 30]
.BezierCurve(3)
.approximation
.downsample(4)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-M.svg)

A downsampled approximation of a composite cubic Bézier curve:

~~~spl svg=N
[0 0; 1 1; 2 -1; 3 0; 5 2; 6 -1; 7 3]
.BezierCurve(3)
.approximation
.downsample(8)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/BezierCurve-N.svg)

* * *

See also: bernsteinBasis, bezierDerivatives, bezierDistanceTable, bezierFunction, bezierSplitAt, cubicBezierFunctionAt, deCasteljausAlgorithm, quadraticBezierFunctionAt, quadraticBezierToCubicBezier

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BezierCurve.html)
[2](https://reference.wolfram.com/language/ref/BezierCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/B%C3%A9zier_curve)

Categories: Geometry
