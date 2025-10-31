# faceIndices

- _faceIndices(g)_

Answer a `List` of lists holding the indices of the vertices of each face at the geometry _g_.

At `Triangle`:

```
>>> sasTriangle(1, 1.pi / 2, 2).faceIndices
[[1 2 3]]
```

At `Rectangle`:

```
>>> [0 0].unitSquare.faceIndices
[[1 2 3 4]]
```

At `Polygon`:

```
>>> 5.regularPolygon([0 0], 1, 0)
>>> .faceIndices
[[1 2 3 4 5]]
```

At the unit tetrahedron, a `Polyhedron`:

```
>>> [0 0 0].unitTetrahedron.faceIndices
[
	2 3 4;
	3 2 1;
	4 1 2;
	1 4 3
]
```

At the unit cube, a `Polyhedron`:

```
>>> [0 0 0].unitCube.faceIndices
[
	1 2 3 4;
	5 6 7 8;
	3 4 8 7;
	1 2 6 5;
	1 5 8 4;
	2 3 7 6
]
```

* * *

See also: faceCount, Polygon, Polyhedron, vertexCoordinates, vertexCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Face.html)
