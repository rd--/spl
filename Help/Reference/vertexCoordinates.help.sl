# vertexCoordinates

- _vertexCoordinates(aGeometry)_

Answer the coordinats of the of _aGeometry_.

At `Triangle`, in two dimensions:

```
>>> Triangle([0 0], [0 1], [1 0]).vertexCoordinates
[0 0; 0 1; 1 0]
```

At `Triangle`, in three dimensions:

```
>>> Triangle([0 0 0], [1 0 0], [0 1 1]).vertexCoordinates
[0 0 0; 1 0 0; 0 1 1]
```

At `Rectangle`:

```
>>> Rectangle([0 0], [1 1]).vertexCoordinates
[0 0; 1 0; 1 1; 0 1]

>>> [0 0].unitSquare.vertexCoordinates * 2
[-1 -1; 1 -1; 1 1; -1 1]
```

At `Polygon`:

```
>>> 4.regularPolygon([0 0], 1, 0)
>>> .vertexCoordinates
[1 0; 0 1; -1 0; 0 -1]
```

At `Polyhedron`:

```
>>> [0 0 0].unitCube.vertexCoordinates * 2
[
	-1 -1 -1;
	+1 -1 -1;
	+1 +1 -1;
	-1 +1 -1;
	-1 -1 +1;
	+1 -1 +1;
	+1 +1 +1;
	-1 +1 +1
]
```

* * *

See also: Graph, Polygon, Polyhedron, Rectangle, Triangle, vertexCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Vertex.html)
[2](https://mathworld.wolfram.com/Coordinates.html)
[3](https://reference.wolfram.com/language/ref/VertexCoordinates.html)
[4](https://reference.wolfram.com/language/ref/PolygonCoordinates.html)

Categories: Geometry
