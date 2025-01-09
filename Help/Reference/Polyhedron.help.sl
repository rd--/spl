# Polyhedron

- _Polyhedron(vertexCoordinates, faceIndices)_

A `Type` representing a polyhedron with the specified vertices and faces.
`vertexCoordinates` is a `List` of Cartesian coordinates,
`faceIndices` is a `List` of lists of integers that indicate indexes into `vertexCoordinates`.

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
).asPerspectiveDrawing(
	AxonometricProjection(
		pi / 4, pi / 4,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/Polyhedron-A.svg)

* * *

See also: asPerspectiveDrawing, LineDrawing, Polygon, unitCube, unitDodecahedron, unitIcosahedron, unitSquare, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polyhedron.html)
[2](https://reference.wolfram.com/language/ref/Polyhedron.html)

Categories: Geometry
