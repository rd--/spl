# pathGraph

- _pathGraph(anInteger)_

Answer the path graph with _anInteger_ vertices.

The `adjacencyMatrix` of three small path graphs:

```
>>> 3.pathGraph.adjacencyMatrix
[0 1 0; 1 0 1; 0 1 0]

>>> 4.pathGraph.adjacencyMatrix
[0 1 0 0; 1 0 1 0; 0 1 0 1; 0 0 1 0]

>>> 5.pathGraph.adjacencyMatrix
[
	0 1 0 0 0;
	1 0 1 0 0;
	0 1 0 1 0;
	0 0 1 0 1;
	0 0 0 1 0
]
```

The `vertexList` and `edgeList` of a path graph:

```
>>> let g = 7.pathGraph;
>>> (g.vertexList, g.edgeList)
(
	[1 2 3 4 5 6 7],
	[1 2; 2 3; 3 4; 4 5; 5 6; 6 7].asEdgeList
)
```

Use `vertexCount` and `edgeCount` to count vertices and edges:

```
>>> let g = 20.pathGraph;
>>> (g.vertexCount, g.edgeCount)
(20, 19)
```

The `vertexDegree` of a `pathGraph`:

```
>>> 5.pathGraph.vertexDegree
[1 2 2 2 1]

>>> 9.pathGraph.vertexDegree
[1 2 2 2 2 2 2 2 1]
```

* * *

See also: cycleGraph, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PathGraph.html)
[2](https://reference.wolfram.com/language/ref/PathGraph.html)

Categories: Graph, Collection
