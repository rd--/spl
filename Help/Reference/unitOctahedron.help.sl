# unitOctahedron

- _unitOctahedron(center)_

Answer a `Polyhedron` of the unit octahedron at _center_.

Count the number of vertices, faces and edges,
show that each face is of four vertices,
and that each edge as a unit:

```
>>> let p = [0 0 0].unitOctahedron;
>>> (
>>> 	p.vertexCount,
>>> 	p.faceCount,
>>> 	p.edgeCount,
>>> 	p.faceIndices.collect(size:/1),
>>> 	p.edgeCoordinates.collect { :each |
>>> 		each.Line.arcLength
>>> 	}
>>> )
(6, 8, 12, 8 # [3], 12 # [1])
```

Draw the unit octahedron:

~~~spl svg=A
[0 0 0].unitOctahedron
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/unitOctahedron-A.svg)

* * *

See also: LineDrawing, Polyhedron, unitCube, unitDodecahedron, unitIsocahedron, unitSquare, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitOctahedron.html)
[2](https://reference.wolfram.com/language/ref/Octahedron.html)

Categories: Geometry
