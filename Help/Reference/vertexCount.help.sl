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

At `Polygon`:

```
>>> 4.regularPolygon([0 0], 1).vertexCount
4
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

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexCount.html)
[2](https://reference.wolfram.com/language/ref/VertexCount.html)

Categories: Collection
