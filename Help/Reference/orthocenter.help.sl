# orthocenter

- _orthocenter(t)_

Answer the orthocenter of a triangle _t_,
the point where the three altitudes intersect.

The orthocenter is interior to an acute triangle,
and for an equilateral triangle,
all triangle centers coincide at its centroid:

~~~spl svg=A
let t = sssTriangle(1, 1, 1);
[
	t,
	t.centroid.Point,
	t.orthocenter.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/orthocenter-A.svg)

The orthocenter is at the right-angled vertex of a right triangle:

~~~spl svg=B
let t = aasTriangle(1/6.pi, 1/3.pi, 1);
[
	t,
	t.orthocenter.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/orthocenter-B.svg)

The orthocenter is exterior to an obtuse triangle:

~~~spl svg=C
let a = 1/5.pi;
let t = asaTriangle(a, 1, a);
[
	t,
	t.orthocenter.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/orthocenter-C.svg)

* * *

See also: fromBarycentricCoordinates, interiorAngles, normalizeSum, tan

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Orthocenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Orthocenter)
