# brocardCircle

- _brocardCircle(t)_

Answer the brocard circle of the triangle _t_.

~~~spl svg=A
let t = [5 4.5 6].sssTriangle;
[
	t,
	t.brocardCircle,
	[
		t.symmedianPoint,
		t.circumcenter,
		t.firstBrocardPoint,
		t.secondBrocardPoint,
		t.kimberlingCenter(182)
	].PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/brocardCircle-A.svg)

* * *

See also: brocardDiameter, brocardMidpoint, brocardPoints, Circle, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BrocardMidpoint.html)
