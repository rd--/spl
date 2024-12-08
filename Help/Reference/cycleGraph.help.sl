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

The `vertexList` and `edgeList` of a cycle graph:

```
>>> let g = 7.cycleGraph;
>>> (g.vertexList, g.edgeList)
(
	[1 2 3 4 5 6 7],
	[1 2; 2 3; 3 4; 4 5; 5 6; 6 7; 7 1].asEdgeList
)
```

Draw cycle graph on five vertices:

~~~
5.cycleGraph.graphPlot
~~~

![](sw/spl/Help/Image/cycleGraph-A.svg)

* * *

See also: completeGraph, Graph, pathGraph, starGraph, wheelGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CycleGraph.html)
[2](https://reference.wolfram.com/language/ref/CycleGraph.html)

Categories: Graph, Collection
