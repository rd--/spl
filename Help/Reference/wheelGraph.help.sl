# wheelGraph

- _wheelGraph(anInteger)_

Answer the wheel graph with _anInteger_ vertices.
A wheel graph of order _n_ is a graph formed by connecting a single vertex to all the vertices of a cycle of order _n - 1_.

The `adjacencyMatrix` of two small wheel graphs:

```
>>> 4.wheelGraph.adjacencyMatrix
[
	0 1 1 1;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0
]

>>> 5.wheelGraph.adjacencyMatrix
[
	0 1 1 1 1;
	1 0 1 0 1;
	1 1 0 1 0;
	1 0 1 0 1;
	1 1 0 1 0
]
```

The `vertexCount`, `edgeCount` and `vertexDegree` of a wheel graph:

```
>>> let g = 5.wheelGraph;
>>> (
>>> 	g.vertexCount,
>>> 	g.edgeCount,
>>> 	g.vertexDegree
>>> )
(5, 8, [4 3 3 3 3])
```

The `vertexList` and `edgeList` of a wheel graph:

```
>>> let g = 7.wheelGraph;
>>> (g.vertexList, g.edgeList)
(
	[1 2 3 4 5 6 7],
	[
		2 3; 3 4; 4 5; 5 6; 6 7; 7 2;
		1 2; 1 3; 1 4; 1 5; 1 6; 1 7
	].asEdgeList
)
```

Draw the wheel graph on nine vertices:

~~~spl svg=A
9.wheelGraph.graphPlot
~~~

![](sw/spl/Help/Image/wheelGraph-A.svg)

* * *

See also: cycleGraph, Graph, pathGraph, starGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WheelGraph.html)
[2](https://reference.wolfram.com/language/ref/WheelGraph.html)

Categories: Graph, Collection
