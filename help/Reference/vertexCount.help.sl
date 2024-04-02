# vertexCount

- _vertexCount(aGraph)_

Answer the number of vertices in _aGraph_, also called the _order_ of the graph.

At an undirected graph:

```
>>> 5.completeGraph.vertexCount
5
```

At a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.vertexCount
3
```

At a multigraph:

```
>>> [1 -> 2, 1 -> 2].asGraph.vertexCount
2
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexCount.html)
[2](https://reference.wolfram.com/language/ref/VertexCount.html)
