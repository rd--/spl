# PointCloud

- _PointCloud([x₁ y₁ …; x₂ y₂ …])_

A `Type` representing a set of disconnected points.

A drawing of twenty-three randomly displaced points:

~~~spl svg=A
Sfc32(376814)
.randomInteger([1 200], [23 2])
.PointCloud
~~~

![](Help/Image/PointCloud-A.svg)

The type is not called `PointSet` since the points need not be,
in the usual sense,
a set.
Duplicate elements are allowed.
`PointSet` is a method that checks that there are no duplicate points and answers a `PointCloud` value.

Disperse a grid of points, _g_, about a focus point _c_:

~~~spl svg=B
let g = (-1.5, -1.4 .. 1.5).tuples(2);
let q = 1/11.pi;
let c = [q.cos q.sin];
g.collect { :x |
	let dx = [
		3,
		x - c,
		2 ^ (-5 * (x - c).norm)
	].product;
	x + dx
}.PointSet
~~~

![](Help/Image/PointCloud-B.svg)

* * *

See also: BezierCurve, Circle, Line, Point, Polygon, Rectangle, Triangle, vertexCoordinates

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PointSet.html),
_W_
[1](https://en.wikipedia.org/wiki/Point_cloud)

Categoriess: Geometry
