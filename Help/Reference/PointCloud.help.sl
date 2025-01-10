# PointCloud

- _PointCloud(aMatrix)_

A `Type` representing a set of disconnected points.

A drawing of twenty-three randomly displaced points:

~~~spl svg=A
Sfc32(376814)
.randomInteger(1, 200, [23 2])
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/PointCloud-A.svg)

Disperse a grid of points, _g_, about a focus point _c_:

~~~spl svg=B
let g = (-1.5, -1.4 .. 1.5).tuples(2);
let q = pi / 11;
let c = [q.cos q.sin];
let p = g.collect { :x |
	let dx = [
		3,
		x - c,
		2 ^ (-5 * (x - c).norm)
	].product;
	x + dx
};
PointCloud(p).asLineDrawing
~~~

![](sw/spl/Help/Image/PointCloud-B.svg)

* * *

See also: BezierCurve, Circle, Line, Point, Polygon, Rectangle, Triangle, vertexCoordinates

Guides: Geometry Types

Categoriess: Geometry
