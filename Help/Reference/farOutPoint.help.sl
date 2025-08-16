# farOutPoint

- _farOutPoint(t)_

Answer the far-out point of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .farOutPoint
[4.6 7.2]
```

Plot far-out point:

~~~spl svg=A
let t = [5 3 7].sssTriangle;
let a = t.circumcenter;
let b = t.centroid;
let c = t.farOutPoint;
[
	t,
	t.circumcircle,
	[a c].Line,
	[a b c].PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/farOutPoint-A.svg)

* * *

See also: centroid, circumcenter, circumcircle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Far-OutPoint.html)
