# nobbsPoints

- _nobbsPoints(t)_

Answer the three Nobbs points for the triangle _t_.

~~~spl svg=A
let t = [2.5 2 2.75].sssTriangle;
[
	t,
	t.contactTriangle,
	t.nobbsPoints.first(3).PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/nobbsPoints-A.svg)

* * *

See also: contactTriangle, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NobbsPoints.html)
