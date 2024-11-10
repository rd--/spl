# vertexList

- _vertexList(aGraph)_

Answer a `List` of the vertices in _aGraph_.

At an undirected graph:

```
>>> 5.completeGraph.vertexList
[1 2 3 4 5]
```

At a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.vertexList
[1 2 3]
```

At a multigraph:

```
>>> [1 -> 2, 1 -> 2].asGraph.vertexList
[1 2]
```

* * *

See also: edgeList, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexSet.html)
[2](https://reference.wolfram.com/language/ref/VertexList.html)

Categories: Collection
