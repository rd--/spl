# Polygon

- _Polygon(aSequence)_

A Polygon is a `Type` representing a polygon with vertex coordinates given by _aSequence_.

The `area` and `centroid` of two triangle:

```
>>> let p = [1 0; 0 3.sqrt; -1 0].Polygon;
>>> (p.area, p.centroid, p.boundingBox)
(3.sqrt, [0, 3.sqrt / 3], [-1 0; 1 3.sqrt])

>>> let p = [1 0; 1 1; 0 0].Polygon;
>>> (p.area, p.centroid)
(1/2, [2/3 1/3])
```

The `area`, `centroid` and `interiorAngles` of a pentagon:

```
>>> let p = [1 6; 3 1; 7 2; 4 4; 8 5].Polygon;
>>> (
>>> 	p.area,
>>> 	p.centroid,
>>> 	p.interiorAngles,
>>> 	p.boundingBox
>>> )
(
	33/2,
	[35/9 11/3],
	[1.0484 1.7063 0.833 0.833 0.3869],
	[1 1; 8 6]
)
```

Regular hexagonal tiling:

~~~spl svg=A
let h = { :x :y |
	{ :k |
		[
			(2.pi * k / 6).cos + x,
			(2.pi * k / 6).sin + y
		]
	}.table(1:6).Polygon
};
{ :i :j |
	h(
		3 * i + (3 * (-1 ^ j + 1) / 4),
		3.sqrt / 2 * j
	)
}.table(1:5, 1:10).LineDrawing
~~~

![](sw/spl/Help/Image/Polygon-A.svg)

Digital petals:

~~~spl svg=B
let d = 2.pi / 12;
{ :r :q |
	let dx = { :x |
		d * (q + x)
	};
	[
		(8 - r) * [-1.dx.cos, -1.dx.sin],
		(8 - r) * [1.dx.cos, 1.dx.sin],
		(10 - r) * [0.dx.cos, 0.dx.sin]
	].Polygon
}.table(1:6, 1:12).LineDrawing
~~~

![](sw/spl/Help/Image/Polygon-B.svg)

A dozen random triangles:

~~~spl svg=C
Sfc32(147982)
.randomReal(1, 100, [12 3 2])
.Polygon
.LineDrawing
~~~

![](sw/spl/Help/Image/Polygon-C.svg)

The outline of a glyph:

~~~spl svg=E
[
	2 3;
	0.8125 0.625;
	0.9375 0.625;
	1.3125 1.375;
	2.4375 1.375;
	2.8125 0.625;
	3.1875 0.625
	:;
	1.875 2.5;
	1.375 1.5;
	2.375 1.5
].Polygon.LineDrawing
~~~

![](sw/spl/Help/Image/Polygon-D.svg)

* * *

See also: area, centroid, BezierCurve, Circle, interiorAngles, Point, PointCloud, Rectangle, randomStarConvexPolygon, regularPolygon, rotated, Triangle, vertexCoordinates

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polygon.html)
[2](https://reference.wolfram.com/language/ref/Polygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon)

Categories: Geometry
