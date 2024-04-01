# cycleGraph

- _cycleGraph(anInteger)_

Answer the cycle graph with _anInteger_ vertices.

The `adjacencyMatrix` of three small cycle graphs:

```
>>> 3.cycleGraph.adjacencyMatrix
[0 1 1; 1 0 1; 1 1 0]

>>> 4.cycleGraph.adjacencyMatrix
[0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0]

>>> 5.cycleGraph.adjacencyMatrix
[
	0 1 0 0 1;
	1 0 1 0 0;
	0 1 0 1 0;
	0 0 1 0 1;
	1 0 0 1 0
]
```

The `vertices` and `edges` of a cycle graph:

```
>>> let g = 7.cycleGraph;
>>> (g.vertices, g.edges)
(1:7, [1 2; 2 3; 3 4; 4 5; 5 6; 6 7; 7 1])
```

* * *

See also: Graph, pathGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CycleGraph.html)
[2](https://reference.wolfram.com/language/ref/CycleGraph.html)
