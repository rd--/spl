# vertexInDegree

- _vertexInDegree(aGraph)_
- _vertexInDegree(aGraph, aVertex)_

In the binary case,
answer the vertex in-degree of _aVertex_ in _aGraph_.

In the unary case answer the `vertexInDegree` for each entry in `vertexList`.

A vertexes in-degree is the number of edges incident to it.
For an undirected graph, an edge is taken to be both an in-edge or an out-edge.

At a directed graph:

```
>>> let g = [
>>> 	1 -> 2,
>>> 	2 -> 3, 2 -> 4,
>>> 	3 -> 1
>>> ].asGraph;
>>> (
>>> 	g.vertexInDegree,
>>> 	g.vertexInDegree(2)
>>> )
([1 1 1 1], 1)
```

At an undirected graph:

```
>>> let g = [1 2; 2 3; 3 1; 3 4].asGraph;
>>> (
>>> 	g.vertexInDegree,
>>> 	g.vertexInDegree(2)
>>> )
([2 2 3 1], 2)
```

At a multigraph:

```
>>> let g = [
>>> 	1 -> 2, 1 -> 2,
>>> 	2 -> 3,
>>> 	3 -> 1
>>> ].asGraph;
>>> (
>>> 	g.vertexInDegree,
>>> 	g.vertexInDegree(2)
>>> )
([1 2 1], 2)
```

Self-loops are counted twice:

```
>>> [1 2; 2 3; 3 1; 3 3]
>>> .asGraph
>>> .vertexInDegree
[2 2 4]
```

Undirected graphs correspond to directed graphs with each edge both an in- and out-edge:

```
>>> [1 2; 2 3; 3 1]
>>> .asGraph
>>> .vertexInDegree
[2 2 2]

>>> [
>>> 	1 -> 2, 1 -> 3,
>>> 	2 -> 1, 2 -> 3,
>>> 	3 -> 1, 3 -> 2
>>> ].asGraph.vertexInDegree
[2 2 2]
```

The vertex in-degrees of an undirected graph can be obtained from its adjacency matrix:

```
>>> let g = [
>>> 	1 -> 1, 1 -> 2,
>>> 	2 -> 3,
>>> 	3 -> 1, 3 -> 4
>>> ].asGraph;
>>> let m = g.adjacencyMatrix;
>>> (m, g.vertexInDegree, m.sum)
(
	[
		1 1 0 0;
		0 0 1 0;
		1 0 0 1;
		0 0 0 0
	],
	[2 1 1 1],
	[2 1 1 1]
)
```

* * *

See also: adjacencyMatrix, asGraph, vertexCount, vertexDegree, vertexList, vertexOutDegree, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Indegree.html)
[1](https://reference.wolfram.com/language/ref/VertexInDegree.html)
