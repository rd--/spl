# midpointStretchingPolygon

- _midpointStretchingPolygon([θ₁ θ₂ θ₃…], o=[0 0], r=1, θ₀=0)_

Answer the midpoint-stretching polygon of the `cyclicPolygon` given by _θₙ_, _o_, _r_ and _θ₀_.

Draw the cyclic polygon _c_,
the midpoint polygon of _c_ (_m_),
and the midpoint stretcing polygon of _c_ (_s_):

~~~spl svg=A
let t = [0 0.25 0.75 1.25].pi;
let c = t.cyclicPolygon([0 0], 1, 1/2.pi);
let m = c.midpointPolygon;
let s = t.midpointStretchingPolygon([0 0], 1, 1/2.pi);
[
	Circle([0 0], 1),
	Point([0 0]),
	c,
	m,
	s
].LineDrawing
~~~

![](Help/Image/midpointStretchingPolygon-A.svg)

* * *

See also: cyclicPolygon, midpointPolygon, vectorAngle

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Midpoint-stretching_polygon)
