# faceCount

- _faceCount(aGeometry)_

Answer the number of faces at _aGeometry_.

At `Triangle`:

```
>>> sasTriangle(1, 1/2.pi, 2).faceCount
1
```

At `Rectangle`:

```
>>> [0 0].unitSquare.faceCount
1
```

At `Polygon`:

```
>>> 5.regularPolygon([0 0], 1, 0)
>>> .faceCount
1
```

At the unit tetrahedron, a `Polyhedron`:

```
>>> [0 0 0].unitTetrahedron.faceCount
4
```

At the unit cube, a `Polyhedron`:

```
>>> [0 0 0].unitCube.faceCount
6
```

* * *

See also: faceIndices, Polygon, Polyhedron, vertexCoordinates, vertexCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Face.html)
