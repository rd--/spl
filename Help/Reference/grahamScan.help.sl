# grahamScan

- _grahamScan(p)_

Implements the Graham scan algorithm for determining the convex hull of the point set _p_.

Calculate convex hull:

```
>>> [1 0; 0 1; 2 1; 1 0.5]
>>> .grahamScan
[0 1; 1 0; 2 1]
```

The convex hull of a random set of seventeen points:

~~~spl svg=A
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let h = p.grahamScan;
[
	p.PointCloud,
	h.Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/grahamScan-A.svg)

* * *

See also: convexHull, shoelaceFormula, toPolarCoordinates

References:
_W_
[1](https://en.wikipedia.org/wiki/Graham_scan)

Further Reading: Graham 1972
