# vertexList

- _vertexList(aGraph | anEdge | aGeometry)_

Answer a `List` of the vertices in _aGraph_.

At an undirected graph:

```
>>> 5.completeGraph.vertexList
[1 2 3 4 5]
```

At a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .vertexList
[1 2 3]
```

At a multigraph:

```
>>> [1 -> 2, 1 -> 2].asGraph.vertexList
[1 2]
```

At directed and undirected edges:

```
>>> (23 --- 7).vertexList
[7 23]

>>> (23 --> 7).vertexList
[23 7]
```

At the unit cube:

```
>>> [0 0 0].unitCube.vertexList
[1 .. 8]
```

* * *

See also: edgeList, Graph, vertexCount

Guides: Geometry Functions, Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexSet.html)
[2](https://reference.wolfram.com/language/ref/VertexList.html)

Categories: Collection, Geometry, Graph
