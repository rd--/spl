# rotatePolygonVertices

- _rotatePolygonVertices(v, θ=π/2, m=1)_

_v_ are the vertices of a polygon.
The vectors formed by adjacent pairs of vertices are rotated by _θ_ and scaled by _m_,
deriving a new polygon of the same degree.

A regular hexagon and the derived hexagon,
θ=π/2 and m=1,
lines connecting _a_ and _b_ show rotated vectors:

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

Nested sequence of rotationally derived hexagons,
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

Nested sequence of _k_ rotationally derived regular polygons,
k=5, n=17, θ=π/2 and m=1:

~~~spl svg=C
let k = 5;
let n = 17;
let theta = 1/2.pi;
let m = 1;
let a = { :p |
	p.rotatePolygonVertices(theta, m)
}.nestList(
	n.circlePoints([0 0], 1, 0),
	k
);
[a.Polygon, a.transpose.Line]
~~~

![](Help/Image/rotatePolygonVertices-C.svg)

* * *

See also: Polygon, derivedPolygon

Guides: Geometry Functions

References:
_Hamkins_
[1](https://jdh.hamkins.org/no-regular-polygons-in-the-integer-lattice/)
