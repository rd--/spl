# grahamScan

- _grahamScan(p)_

Implements the Graham scan algorithm for determining the convex hull of the point set _p_.

Calculate convex hull:

```
>>> [1 0; 0 1; 2 1; 1 0.5]
>>> .grahamScan
[0 1; 1 0; 2 1]

>>> [
>>> 	-5 2; 5 7; -6 -12; -14 -14; 9 9;
>>> 	-1 -1; -10 11; -6 15; -6 -8; 15 -9;
>>> 	7 -7; -2 -9; 6 -5; 0 14; 2 8
>>> ].grahamScan
[-14 -14; 15 -9; 9 9; 0 14; -6 15; -10 11]
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
