# completeBipartiteGraph

- _completeBipartiteGraph(i, j)_

Answer the the complete bipartite graph with _i + j_ vertices.

The complete bipartite graph _(2, 2)_:

```
>>> 2.completeBipartiteGraph(2).connectionMatrix
[
	0 0 1 1;
	0 0 1 1;
	1 1 0 0;
	1 1 0 0
]
```

The complete bipartite graph _(2, 3)_:

```
>>> 2.completeBipartiteGraph(3).connectionMatrix
[
	0 0 1 1 1;
	0 0 1 1 1;
	1 1 0 0 0;
	1 1 0 0 0;
	1 1 0 0 0
]
```

* * *

See also: completeGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CompleteBipartiteGraph.html)
