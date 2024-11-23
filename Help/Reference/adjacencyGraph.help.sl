# adjacencyGraph

- _adjacencyGraph(aMatrix)_
- _adjacencyGraph(aMatrix, vertexList)_

In the ternary case,
answer the `Graph` with adjacency matrix _aMatrix_ and vertices from _vertexList_.

In the binary case,
vertices are numbered from `one`.

```
>>> let g = [0 1 0; 0 0 1; 1 0 0].adjacencyGraph;
>>> g.edgeList
[1 -> 2, 2 -> 3, 3 -> 1]
```

A symmetric adjacency matrix results in an undirected graph:

```
>>> let g = [0 1 1; 1 0 1; 1 1 0].adjacencyGraph;
>>> g.edgeList
[1 2; 1 3; 2 3]
```

* * *

See also: adjacencyList, adjacencyMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AdjacencyGraph.html)

Categories: Graph
