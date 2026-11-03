# rotatePolygonVertices

- _rotatePolygonVertices(v, θ, m)_

_v_ are the vertices of a polygon.
The vectors formed by adjacent pairs of vertices are rotated by _θ_ and scaled by _m_,
deriving a new polygon of the same degree.

A regular hexagon and the derived hexagon,
θ=π/2 and m=1:

~~~spl svg=A
let k = 6;
let a = k.circlePoints([0 0], 1, 0);
let b = a.rotatePolygonVertices(1/2.pi, 1);
[
	Polygon[a b],
	Line([a b].transpose)
]
~~~

![](Help/Image/rotatePolygonVertices-A.svg)

Nested sequence derived hexagons,
θ=π/8 and m=1:

~~~spl svg=B
let a = { :p |
	p.rotatePolygonVertices(1/8.pi, 1)
}.nestList(
	6.circlePoints([0 0], 1, 0),
	4
);
[a.Polygon, a.transpose.Line]
~~~

![](Help/Image/rotatePolygonVertices-B.svg)

* * *

See also: Polygon, derivedPolygon

Guides: Geometry Functions
