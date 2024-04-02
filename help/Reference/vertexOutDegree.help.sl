# vertexOutDegree

- _vertexOutDegree(aGraph)_
- _vertexOutDegree(aGraph, aVertex)_

Out the binary case,
answer the vertex out-degree of _aVertex_ in _aGraph_.

Out the unary case answer the `vertexOutDegree` for each entry in `vertexList`.

A vertexes out-degree is the number of edges incident to it.
For an undirected graph, an edge is taken to be both an in-edge or an out-edge.

At a directed graph:

```
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1, 2 -> 4].asGraph;
>>> (g.vertexOutDegree, g.vertexOutDegree(2))
([1 2 1 0], 2)
```

At an undirected graph:

```
>>> let g = [1 2; 2 3; 3 1; 3 4].asGraph;
>>> (g.vertexOutDegree, g.vertexOutDegree(2))
([2 2 3 1], 2)
```

At a multigraph:

```
>>> let g = [1 -> 2, 1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> (g.vertexOutDegree, g.vertexOutDegree(2))
([2 1 1], 1)
```

Self-loops are counted twice:

```
>>> [1 2; 2 3; 3 1; 3 3].asGraph.vertexOutDegree
[2 2 4]
```

Undirected graphs correspond to directed graphs with each edge both an in- and out-edge:

```
>>> [1 2; 2 3; 3 1].asGraph.vertexOutDegree
[2 2 2]

>>> [1 -> 2, 2 -> 1, 2 -> 3, 3 -> 2, 1 -> 3, 3 -> 1].asGraph.vertexOutDegree
[2 2 2]
```

* * *

See also: adjacencyMatrix, asGraph, vertexCount, vertexDegree, vertexList, Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VertexOutDegree.html)
