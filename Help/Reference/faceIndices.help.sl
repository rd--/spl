# faceIndices

- _faceIndices(aPolyhedron)_

Answer a `List` of lists holding the indices of the vertices of each face.

```
>>> [0 0 0].unitTetrahedron.faceIndices
[
	2 3 4;
	3 2 1;
	4 1 2;
	1 4 3
]
```

At unit cube:

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

See also: faceCount, Polyhedron, vertexCoordinates, vertexCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Face.html)

