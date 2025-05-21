# convexHullIndices

- _convexHullIndices([p₁ p₂ …])_

Answer the indices of the convex hull of the two column matrix,
specifying a set of _(x,y)_ coordinates.

Calculate convex hull:

```
>>> [1 0; 0 1; 2 1; 1 0.5]
>>> .convexHullIndices
[2 3 1]

>>> [
>>> 	-5 2; 5 7; -6 -12; -14 -14; 9 9;
>>> 	-1 -1; -10 11; -6 15; -6 -8; 15 -9;
>>> 	7 -7; -2 -9; 6 -5; 0 14; 2 8
>>> ].convexHullIndices
[10 4 7 8 14 5]
```

The convex hull of a random set of seventeen points:

~~~spl svg=A
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let i = p.convexHullIndices;
[
	p.PointCloud,
	(p @* i).Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/convexHullIndices-A.svg)

* * *

See also: convexHull, grahamScan, Polygon

Guides: Geometry Functions

Categories: Geometry
