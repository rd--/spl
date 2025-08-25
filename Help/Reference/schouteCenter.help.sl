# schouteCenter

- _schouteCenter(t)_

Answer the Schoute center of the triangle _t_.

~~~spl svg=A
let t = [4 3 5].sssTriangle;
let a = t.circumcenter;
let b = t.schouteCenter;
let c = t.symmedianPoint;
[
	t,
	t.circumcircle,
	[a b].Line,
	[a, b, c].PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/schouteCenter-A.svg)

* * *

See also: symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SchouteCenter.html)
