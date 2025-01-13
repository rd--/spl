# vertexCount

- _vertexCount(aGraph | aGeometry)_

Answer the number of vertices in _aGraph_, also called the _order_ of the graph.

At an undirected graph:

```
>>> 5.completeGraph.vertexCount
5
```

At a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .vertexCount
3
```

At a multigraph:

```
>>> [1 -> 2, 1 -> 2]
>>> .asGraph
>>> .vertexCount
2
```

At `Triangle`:

```
>>> sasTriangle(1, pi / 2, 2).vertexCount
3
```

At `Rectangle`:

```
>>> [0 0].unitSquare.vertexCount
4
```

At `Polygon`:

```
>>> 5.regularPolygon([0 0], 1, 0)
>>> .vertexCount
5
```

At `Polyhedron`:

```
>>> [0 0 0].unitCube.vertexCount
8

>>> [0 0 0].unitDodecahedron.vertexCount
20
```

* * *

See also: edgeCount, Graph, vertexCoordinates, vertexList

Guides: Geometry Functions, Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexCount.html)
[2](https://reference.wolfram.com/language/ref/VertexCount.html)

Categories: Collection, Geometry, Graph
