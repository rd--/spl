# PointSet

- _PointSet([x₁ y₁ …; x₂ y₂ …])_

Check that the arguments are in fact a set,
and answer a `PointCloud` value.

~~~spl svg=A
let p = [-1 -1; 1 -1; 1 1; -1 1];
[
	Point[0 0],
	PointSet(p),
	Polygon(p),
	Polygon(p).midpointPolygon
].LineDrawing
~~~

![](Help/Image/PointSet-A.svg)

* * *

See also: Point, PointCloud

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PointSet.html),
_W_
[1](https://en.wikipedia.org/wiki/Point_cloud)

Categoriess: Geometry
