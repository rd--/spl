# unitDodecahedron

- _unitDodecahedron(center)_

Answer a `Polyhedron` of the unit regular dodecahedron at _center_.

Count the number of vertices, faces and edges,
show that each face is of four vertices,
and that each edge as a unit:

```
>>> let p = [0 0 0].unitDodecahedron;
>>> (
>>> 	p.vertexCount,
>>> 	p.faceCount,
>>> 	p.edgeCount,
>>> 	p.faceIndices.collect(size:/1),
>>> 	p.edgeLengths
>>> )
(20, 12, 30, 5 # 12, 1 # 30)
```

Draw the _xy_ projection of the unit dodecahedron:

~~~spl svg=A
[0 0 0]
.unitDodecahedron
.asPerspectiveDrawing { :each |
	let [x, y, z] = each;
	[x, y]
}
~~~

![](sw/spl/Help/Image/unitDodecahedron-A.svg)

* * *

See also: LineDrawing, Polyhedron, unitCube, unitIcosahedron, unitOctahedron, unitSquare, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularDodecahedron.html)
[2](https://reference.wolfram.com/language/ref/Dodecahedron.html)
_W_
[1](https://en.wikipedia.org/wiki/Regular_dodecahedron)

Categories: Geometry
