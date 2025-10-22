# Polyhedron

- _Polyhedron(v, f)_

A `Type` representing a polyhedron with the vertex coordinates _v_ and face indices _f_.
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
	'Planometric'.namedAxonometricProjection
)
~~~

![](sw/spl/Help/Image/Polyhedron-A.svg)

* * *

See also: asPerspectiveDrawing, LineDrawing, Polygon, unitCube, unitDodecahedron, unitIcosahedron, unitSquare, unitTetrahedron

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polyhedron.html)
[2](https://reference.wolfram.com/language/ref/Polyhedron.html)

Categories: Geometry
