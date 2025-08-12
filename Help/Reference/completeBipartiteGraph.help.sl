# completeBipartiteGraph

- _completeBipartiteGraph(i, j)_

Answer the the complete bipartite graph with _i + j_ vertices.

The complete bipartite graph _(2, 2)_:

```
>>> let g = 2.completeBipartiteGraph(2);
>>> g.connectionMatrix
[
	0 0 1 1;
	0 0 1 1;
	1 1 0 0;
	1 1 0 0
]
```

The complete bipartite graph _(2, 3)_:

```
>>> let g = 2.completeBipartiteGraph(3);
>>> g.connectionMatrix
[
	0 0 1 1 1;
	0 0 1 1 1;
	1 1 0 0 0;
	1 1 0 0 0;
	1 1 0 0 0
]
```

Draw the complete bipartite graph _(2, 3)_:

~~~spl svg=A
2.completeBipartiteGraph(3).graphPlot
~~~

![](sw/spl/Help/Image/completeBipartiteGraph-A.svg)

* * *

See also: completeGraph, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CompleteBipartiteGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Complete_bipartite_graph)
