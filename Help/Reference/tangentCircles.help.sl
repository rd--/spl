# tangentCircles

- _tangentCircles(t)_

Answer the three mutually tangent circles centered at the vertices of a reference triangle _t_.

~~~spl svg=A
let a = [3.5 2.5 4].sssTriangle;
let b = a.contactTriangle;
[
	a,
	a.vertexCoordinates.PointCloud,
	a.tangentCircles,
	b.vertexCoordinates.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/tangentCircles-A.svg)

* * *

See also: Circle, contactTriangle, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TangentCircles.html)
