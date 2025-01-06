# unitCube

- _unitCube(center)_

Answer a `Polyhedron` of the unit cube at _center_.

The `vertices` of the unit cube at _(0.5,0.5,0.5)_:

```
>>> (0.5 # 3).unitCube.vertexCoordinates
[
	0 0 0;
	1 0 0;
	1 1 0;
	0 1 0;
	0 0 1;
	1 0 1;
	1 1 1;
	0 1 1
]
```

Count the number of vertices, faces and edges,
show that each face is of four vertices,
and that each edge as a unit:

```
>>> let p = [0 0 0].unitCube;
>>> (
>>> 	p.vertexCount,
>>> 	p.faceCount,
>>> 	p.edgeCount,
>>> 	p.faceIndices.collect(size:/1),
>>> 	p.edgeCoordinates.collect { :each |
>>> 		each.Line.arcLength
>>> 	}
>>> )
(8, 6, 24, 4 # 6, 1 # 24)
```

Draw the unit cube:

~~~spl svg=A
[0 0 0].unitCube.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/unitCube-A.svg)

* * *

See also: asPerspectiveDrawing, LineDrawing, Polyhedron, unitDodecahedron, unitIcosahedron, unitSquare, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitCube.html)
[2](https://reference.wolfram.com/language/ref/Cube.html)

Categories: Geometry
