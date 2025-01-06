# unitTetrahedron

- _unitTetrahedron(center)_

Answer a `Polyhedron` of the unit tetrahedron at _center_.

Count the number of vertices, faces and edges,
show that each face is of four vertices,
and that each edge as a unit:

```
>>> let p = [0 0 0].unitTetrahedron;
>>> (
>>> 	p.vertexCount,
>>> 	p.faceCount,
>>> 	p.edgeCount,
>>> 	p.faceIndices.collect(size:/1),
>>> 	p.edgeCoordinates.collect { :each |
>>> 		each.Line.arcLength
>>> 	}
>>> )
(4, 4, 12, 3 # 4, 1 # 12)
```

Draw the _xy_ projection of the unit tetrahedron:

~~~spl svg=A
[0 0 0]
.unitTetrahedron
.asPerspectiveDrawing { :each |
	let [x, y, z] = each;
	[x, y]
}
~~~

![](sw/spl/Help/Image/unitTetrahedron-A.svg)

* * *

See also: LineDrawing, Polyhedron, unitCube, unitDodecahedron, unitIcosahedron, unitOctahedron, unitSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitTetrahedron.html)
[2](https://reference.wolfram.com/language/ref/Tetrahedron.html)

Categories: Geometry
