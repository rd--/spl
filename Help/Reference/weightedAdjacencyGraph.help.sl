# weightedAdjacencyGraph

- _weightedAdjacencyGraph(aMatrix)_

Answer the graph with weighted adjacency matrix _aMatrix_.

~~~spl svg=A
[
	Infinity 1 Infinity;
	Infinity Infinity 3;
	2 Infinity Infinity
]
.weightedAdjacencyGraph
.graphPlot
~~~

![](sw/spl/Help/Image/weightedAdjacencyGraph-A.svg)

A symmetric weighted adjacency matrix results in an undirected graph:

~~~spl svg=B
[
	Infinity 1 2 Infinity;
	1 Infinity 1 1;
	2 1 Infinity 3;
	Infinity 1 3 Infinity
]
.weightedAdjacencyGraph
.graphPlot
~~~

![](sw/spl/Help/Image/weightedAdjacencyGraph-B.svg)

* * *

See also: adjacencyGraph, edgeWeights, isEdgeWeightedGraph, incidenceGraph, kirchhoffGraph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WeightedAdjacencyGraph.html)
