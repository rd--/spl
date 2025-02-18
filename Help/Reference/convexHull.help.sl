# convexHull

- _convexHull(aMatrix)_

Answer the convex hull of _aMatrix_,
which should be a two column matrix of _(x,y)_ coordinates.

The convex hull of a random set of seventeen points:

~~~spl svg=A
let r = Sfc32(323193);
let p = r.randomReal(-1, 1, [17 2]);
let h = p.convexHull;
[
	p.PointCloud,
	h.Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/convexHull-A.svg)

* * *

See also: convexHullIndices, delaunayMesh, DelaunayTriangulation, Polygon

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConvexHull.html)
[2](https://reference.wolfram.com/language/ref/ConvexHullMesh.html)

Categories: Geometry
