# grahamScan

- _grahamScan([p₁ p₂ …])_

Implements the Graham scan algorithm for determining the convex hull.
Answers the indices of the convex hull of a two column matrix,
specifying a set of _(x,y)_ coordinates.

Calculate convex hull:

```
>>> [1 0; 0 1; 2 1; 1 0.5]
>>> .grahamScan
[2 1 3]

>>> [
>>> 	-5 2; 5 7; -6 -12; -14 -14; 9 9;
>>> 	-1 -1; -10 11; -6 15; -6 -8; 15 -9;
>>> 	7 -7; -2 -9; 6 -5; 0 14; 2 8
>>> ].grahamScan
[4 10 5 14 8 7]
```

The convex hull of a random set of seventeen points:

~~~spl svg=A
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let i = p.grahamScan;
[
	p.PointCloud,
	(p @* i).Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/grahamScan-A.svg)

* * *

See also: convexHullIndices, shoelaceFormula, toPolarCoordinates

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Graham_scan)

Further Reading: Graham 1972
