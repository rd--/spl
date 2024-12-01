# PointCloud

- _PointCloud(aList)_

A `Type` representing a set of disconnected points.

A drawing of a twenty-three randomly displaced points:

~~~spl svg=A
let r = Sfc32(376814);
let p = r.randomInteger(1, 200, [23 2]);
[p.PointCloud].LineDrawing
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
[PointCloud(p)].LineDrawing
~~~

![](sw/spl/Help/Image/PointCloud-B.svg)

* * *

See also: BezierCurve, Circle, Line, Point, Polygon, Rectangle, Triangle

Guides: Geometry Types

Categoriess: Geometry
