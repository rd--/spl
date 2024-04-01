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

The `vertices` and `edges` of a path graph:

```
>>> let g = 7.pathGraph;
>>> (g.vertices, g.edges)
(1:7, [1 2; 2 3; 3 4; 4 5; 5 6; 6 7])
```

* * *

See also: cycleGraph, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PathGraph.html)
[2](https://reference.wolfram.com/language/ref/PathGraph.html)
