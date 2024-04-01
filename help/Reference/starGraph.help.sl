# starGraph

- _starGraph(anInteger)_

Answer the star graph with _anInteger_ vertices.
A star graph of order _n_ is a tree with one vertex of degree _n - 1_ and the remaining _n - 1_ vertices of degree one.

The `adjacencyMatrix` of three small star graphs:

```
>>> 3.starGraph.adjacencyMatrix
[0 1 1; 1 0 0; 1 0 0]

>>> 4.starGraph.adjacencyMatrix
[0 1 1 1; 1 0 0 0; 1 0 0 0; 1 0 0 0]

>>> 5.starGraph.adjacencyMatrix
[
	0 1 1 1 1;
	1 0 0 0 0;
	1 0 0 0 0;
	1 0 0 0 0;
	1 0 0 0 0
]
```

The `vertices` and `edges` of a star graph:

```
>>> let g = 7.starGraph;
>>> (g.vertices, g.edges)
(1:7, [1 2; 1 3; 1 4; 1 5; 1 6; 1 7])
```

* * *

See also: cycleGraph, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StarGraph.html)
[2](https://reference.wolfram.com/language/ref/StarGraph.html)
