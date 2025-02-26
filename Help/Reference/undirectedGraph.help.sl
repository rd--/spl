# undirectedGraph

- _undirectedGraph(aGraph)_

Answer an undirected graph from a directed graph.

```
>>> let g = [
>>> 	1 -> 2, 2 -> 3, 3 -> 1, 3 -> 4
>>> ].asGraph;
>>> let h = g.undirectedGraph;
>>> (
>>> 	g.isDirected,
>>> 	h.isUndirected,
>>> 	h.edgeList
>>> )
(
	true,
	true,
	[1 2; 2 3; 3 1; 3 4].asEdgeList
)
```

The graph is unchanged if already undirected:

```
>>> let g = [1 2; 2 3; 3 1; 3 4].asGraph;
>>> let h = g.undirectedGraph;
>>> (
>>> 	g.isUndirected,
>>> 	h.isUndirected,
>>> 	h.edgeList
>>> )
(
	true,
	true,
	[1 2; 2 3; 3 1; 3 4].asEdgeList
)
```

Directed edges with different directions convert to one undirected edge:

```
>>> let g = [1 -> 2, 2 -> 1].asGraph;
>>> g.undirectedGraph.edgeList
[[1, 2]].asEdgeList
```

* * *

See also: Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UndirectedGraph.html)

Categories: Converting
