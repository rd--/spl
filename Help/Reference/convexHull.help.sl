# convexHull

- _convexHull([p₁ p₂ …])_

Answer the convex hull of a two column matrix,
specifying a set of _(x,y)_ coordinates.

Calculate convex hull:

```
>>> [1 0; 0 1; 2 1; 1 0.5]
>>> .convexHull
[0 1; 2 1; 1 0]

>>> [
>>> 	-5 2; 5 7; -6 -12; -14 -14; 9 9;
>>> 	-1 -1; -10 11; -6 15; -6 -8; 15 -9;
>>> 	7 -7; -2 -9; 6 -5; 0 14; 2 8
>>> ].convexHull
[15 -9; -14 -14; -10 11; -6 15; 0 14; 9 9]
```

The convex hull of a random set of seventeen points:

~~~spl svg=A
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let i = p.convexHullIndices;
let h = p.atAll(i);
[
	p.PointCloud,
	h.Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/convexHull-A.svg)

* * *

See also: convexHullIndices, delaunayMesh, DelaunayTriangulation, grahamScan, Polygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConvexHull.html)
[2](https://reference.wolfram.com/language/ref/ConvexHullMesh.html)

Categories: Geometry
