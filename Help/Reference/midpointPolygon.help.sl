# midpointPolygon

- _midpointPolygon([p₁ p₂ p₃ ...])_

Answer the midpoint polygon of a polygon,
which is a derived polygon whose vertices are the midpoints of the edges of a polygon.

At `Rectangle`:

~~~spl svg=A
let r = [0 0].unitSquare;
[
	r,
	r.midpointPolygon
].LineDrawing
~~~

![](sw/spl/Help/Image/midpointPolygon-A.svg)

At `Polygon`:

~~~spl svg=B
let h = 6.regularPolygon([0 0], 1, 0);
[
	h,
	h.midpointPolygon
].LineDrawing
~~~

![](sw/spl/Help/Image/midpointPolygon-B.svg)

* * *

See also: medialTriangle, midpoint

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MidpointPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Midpoint_polygon)
