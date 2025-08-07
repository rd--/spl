# contactTriangle

- _contactTriangle(t)_

Answer the contact triangle,
also called the intouch triangle,
of the triangle _t_.

Draw contact triangle:

~~~spl svg=A
let t = [3 3.85 5].sssTriangle;
[
	t,
	t.contactTriangle,
	t.incircle
].LineDrawing
~~~

![](sw/spl/Help/Image/contactTriangle-A.svg)


Draw nested contact triangles:

~~~spl svg=A
{ :t |
	t.contactTriangle
}.nestList(
	[3 4 5].sssTriangle,
	4
).LineDrawing
~~~

![](sw/spl/Help/Image/contactTriangle-B.svg)

* * *

See also: incircle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangleCenterFunction.html)
_W_
[1](https://en.wikipedia.org/wiki/Triangle_center)
