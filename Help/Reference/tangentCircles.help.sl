# tangentCircles

- _tangentCircles(t)_

Answer the three mutually tangent circles centered at the vertices of a reference triangle _t_.

Draw contact triangle and tangent circles:

~~~spl svg=A
let a = [3.5 2.5 4].sssTriangle;
let b = a.contactTriangle;
[
	a,
	a.vertexCoordinates.PointSet,
	a.tangentCircles,
	b.vertexCoordinates.PointSet
].LineDrawing
~~~

![](Help/Image/tangentCircles-A.svg)

* * *

See also: Circle, Triangle, contactTriangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TangentCircles.html)
