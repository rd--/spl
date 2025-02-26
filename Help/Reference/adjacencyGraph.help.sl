# adjacencyGraph

- _adjacencyGraph(aMatrix)_
- _adjacencyGraph(aMatrix, vertexList)_

In the binary case,
answer the `Graph` with adjacency matrix _aMatrix_ and vertices from _vertexList_.

In the unary case,
vertices are numbered from `one`.

The `edgeList` of the `adjacencyGraph` of the `cycleGraph` of three vertices,

```
>>> let m = [0 1 0; 0 0 1; 1 0 0];
>>> let g = m.adjacencyGraph;
>>> g.edgeList
[1 --> 2, 2 --> 3, 3 --> 1]
```

A drawing of the cycle graph, which is directed:

~~~spl svg=A
let m = [0 1 0; 0 0 1; 1 0 0];
m.adjacencyGraph.graphPlot
~~~

![](sw/spl/Help/Image/adjacencyGraph-A.svg)

A symmetric adjacency matrix results in an undirected graph:

```
>>> let m = [0 1 1; 1 0 1; 1 1 0];
>>> let g = m.adjacencyGraph;
>>> g.edgeList
[1 2; 1 3; 2 3].asEdgeList
```

A drawing of the complete three graph, which is undirected:

~~~spl svg=B
let m = [0 1 1; 1 0 1; 1 1 0];
m.adjacencyGraph.graphPlot
~~~

![](sw/spl/Help/Image/adjacencyGraph-B.svg)

Matrices with diagonal entries create self-loops:

~~~spl svg=C
[
	1 1 1 0;
	1 0 1 1;
	1 1 0 1;
	0 1 1 0
].adjacencyGraph.graphPlot
~~~

![](sw/spl/Help/Image/adjacencyGraph-C.svg)

Construct graph by rule:

~~~spl svg=D
let m = { :i :j |
	(i - j).abs.betweenAnd(1, 3).boole
}.table(1:6, 1:6);
m.adjacencyGraph.graphPlot
~~~

![](sw/spl/Help/Image/adjacencyGraph-D.svg)

Represent a network with an adjacency matrix:

~~~spl svg=E
{ :i :j |
	(((2 * i + j) % 7) = 1).boole
}.table(1:20, 1:20)
.adjacencyGraph
.undirectedGraph
.simpleGraph
.graphPlot
~~~

![](sw/spl/Help/Image/adjacencyGraph-E.svg)

* * *

See also: adjacencyList, adjacencyMatrix, Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AdjacencyGraph.html)

Categories: Graph
