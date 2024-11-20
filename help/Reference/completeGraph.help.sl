# completeGraph

- _completeGraph(anInteger)_

Answer the complete graph with _anInteger_ vertices.
A complete graph of order _n_ is a graph with _n_ vertices and an edge between every pair of vertices.

The `adjacencyMatrix` of three small complete graphs:

```
>>> 3.completeGraph.adjacencyMatrix
[0 1 1; 1 0 1; 1 1 0]

>>> 4.completeGraph.adjacencyMatrix
[0 1 1 1; 1 0 1 1; 1 1 0 1; 1 1 1 0]

>>> 5.completeGraph.adjacencyMatrix
[
	0 1 1 1 1;
	1 0 1 1 1;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0
]
```

The `edgeCount` of small complete graphs:

```
>>> 2:9.collect { :n | n.completeGraph.edgeCount }
[1 3 6 10 15 21 28 36]

>>> 2:9.collect { :n | (-1 + n) * n / 2 }
[1 3 6 10 15 21 28 36]
```

* * *

See also: adjacencyMatrix, cycleGraph, edgeCount, Graph, pathGraph, starGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CompleteGraph.html)
[2](https://reference.wolfram.com/language/ref/CompleteGraph.html)

Categories: Graph, Collection
