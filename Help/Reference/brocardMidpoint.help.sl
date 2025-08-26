# brocardMidpoint

- _brocardMidpoint(t)_

Answer the brocard midpoint of the triangle _t_.

~~~spl svg=A
let t = [6.5 5 6.5].sssTriangle;
let a = t.brocardMidpoint;
let [b, c, _] = t.brocardPoints;
[
	t,
	[b c].Line,
	[a b c].PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/brocardMidpoint-A.svg)

* * *

See also: brocardCircle, brocardDiameter, brocardPoints, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BrocardMidpoint.html)
