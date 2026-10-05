# vertexOutDegree

- _vertexOutDegree(g)_
- _vertexOutDegree(g, v)_

Out the binary case,
answer the vertex out-degree of the vertex _v_ in the graph _g_.

In the unary case answer the `vertexOutDegree` for each entry in `vertexList`.

A vertexes out-degree is the number of edges incident to it.
For an undirected graph, an edge is taken to be both an in-edge or an out-edge.

At a directed graph:

```
>>> let g = Graph[
>>> 	1 -> 2,
>>> 	2 -> 3, 2 -> 4,
>>> 	3 -> 1
>>> ];
>>> (
>>> 	g.vertexOutDegree,
>>> 	g.vertexOutDegree(2)
>>> )
([1 2 1 0], 2)
```

At an undirected graph:

```
>>> let g = Graph[1 2; 2 3; 3 1; 3 4];
>>> (
>>> 	g.vertexOutDegree,
>>> 	g.vertexOutDegree(2)
>>> )
([2 2 3 1], 2)
```

At a multigraph:

```
>>> let g = Graph[
>>> 	1 -> 2, 1 -> 2,
>>> 	2 -> 3,
>>> 	3 -> 1
>>> ];
>>> (
>>> 	g.vertexOutDegree,
>>> 	g.vertexOutDegree(2)
>>> )
([2 1 1], 1)
```

Self-loops are counted twice:

```
>>> Graph[1 2; 2 3; 3 1; 3 3]
>>> .vertexOutDegree
[2 2 4]
```

Undirected graphs correspond to directed graphs with each edge both an in- and out-edge:

```
>>> Graph[1 2; 2 3; 3 1]
>>> .vertexOutDegree
[2 2 2]

>>> Graph[
>>> 	1 -> 2, 1 -> 3,
>>> 	2 -> 1, 2 -> 3,
>>> 	3 -> 1, 3 -> 2
>>> ].vertexOutDegree
[2 2 2]
```

* * *

See also: adjacencyMatrix, Graph, vertexCount, vertexDegree, vertexInDegree, vertexList

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Outdegree.html)
[2](https://reference.wolfram.com/language/ref/VertexOutDegree.html)
