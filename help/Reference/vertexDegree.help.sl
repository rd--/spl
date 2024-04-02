# vertexDegree

- _vertexDegree(aGraph)_
- _vertexDegree(aGraph, aVertex)_

In the binary case,
answer the vertex degree of _aVertex_ in _aGraph_.

In the unary case answer the `vertexDegree` for each entry in `vertexList`.

The vertex degree, also known as valence, is the number of edges incident to it.
For a directed graph, an edge is incident to a vertex whether it is an in-edge or an out-edge.

At a directed graph:

```
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1, 2 -> 4].asGraph;
>>> (g.vertexDegree, g.vertexDegree(2))
([2 3 2 1], 3)
```

At an undirected graph:

```
>>> let g = [1 2; 2 3; 3 1; 2 4].asGraph;
>>> (g.vertexDegree, g.vertexDegree(2))
([2 3 2 1], 3)
```

At a multigraph:

```
>>> let g = [1 -> 2, 1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> (g.vertexDegree, g.vertexDegree(2))
([3 3 2], 3)
```

Self-loops are counted twice:

```
>>> [1 2; 2 3; 3 1; 3 3].asGraph.vertexDegree
[2 2 4]
```

Every graph has an even number of vertices with odd degree:

```
>>> 5.wheelGraph.vertexDegree
[3 3 3 3 4]
```

The vertex degrees of an undirected graph can be obtained from its adjacency matrix:

```
>>> let g = [1 1; 1 2; 1 3; 2 3; 3 4].asGraph;
>>> let m = g.adjacencyMatrix;
>>> (m, g.vertexDegree, m.transposed.sum +  m.diagonal)
(
	[
		1 1 1 0;
		1 0 1 0;
		1 1 0 1;
		0 0 1 0
	],
	[4 2 3 1],
	[4 2 3 1]
)
```

Each vertex of a _k_-regular graph has the same vertex degree _k_:

```
>>> 5.completeGraph.vertexDegree
[4 4 4 4 4]
```

* * *

See also: adjacencyMatrix, asGraph, vertexCount, vertexList, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LocalDegree.html)
[2](https://reference.wolfram.com/language/ref/VertexDegree.html)
