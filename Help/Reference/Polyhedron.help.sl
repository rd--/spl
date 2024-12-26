# Polyhedron

- _Polyhedron(vertexList, faceList)_

A `Type` representing a polyhedron with the specified vertices and faces.
_vertexList_ is a `List` of Cartesian coordinates,
_faceList_ is a `List` of lists of integers that indicate indexes into the _vertexList_.

Draw a polyhedron:

~~~spl svg=A
Polyhedron(
	[
		+0.0 +0.0 +0.6;
		-0.3 -0.5 -0.2;
		-0.3 +0.5 -0.2;
		+0.6 +0.0 -0.2
	],
	[
		2 3 4;
		3 2 1;
		4 1 2;
		1 4 3
	]
).asLineDrawing(
	AxonometricProjection(
		'Planometric'
	).asBlock
)
~~~

![](sw/spl/Help/Image/Polyhedron-A.svg)

* * *

See also: asLineDrawing, Polygon

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polyhedron.html)
[2](https://reference.wolfram.com/language/ref/Polyhedron.html)

Categories: Geometry
