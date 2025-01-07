# unitIcosahedron

- _unitIcosahedron(center)_

Answer a `Polyhedron` of the unit icosahedron at _center_.

Count the number of vertices, faces and edges,
show that each face is of four vertices,
and that each edge as a unit:

```
>>> let p = [0 0 0].unitIcosahedron;
>>> (
>>> 	p.vertexCount,
>>> 	p.faceCount,
>>> 	p.edgeCount,
>>> 	p.faceIndices.collect(size:/1),
>>> 	p.edgeLengths
>>> )
(12, 20, 60, 3 # 20, 1 # 60)
```

Draw the _xz_ projection of the unit icosahedron:

~~~spl svg=A
[0 0 0]
.unitIcosahedron
.asPerspectiveDrawing { :each |
	let [x, y, z] = each;
	[x, z]
}
~~~

![](sw/spl/Help/Image/unitIcosahedron-A.svg)

* * *

See also: LineDrawing, Polyhedron, unitCube, unitDodecahedron, unitOctahedron, unitSquare, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularIcosahedron.html)
[2](https://reference.wolfram.com/language/ref/Icosahedron.html)

Categories: Geometry
