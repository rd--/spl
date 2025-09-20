# starGraph

- _starGraph(n)_

Answer the star graph with _n_ vertices.
A star graph of order _n_ is a tree with one vertex of degree _n-1_ and the remaining _n-1_ vertices of degree one.

The `adjacencyMatrix` of three small star graphs,
a star graph has 1s in the first column and first row only:

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

The `vertexList` and `edgeList` of a star graph:

```
>>> let g = 7.starGraph;
>>> (g.vertexList, g.edgeList)
(
	[1 2 3 4 5 6 7],
	[1 2; 1 3; 1 4; 1 5; 1 6; 1 7].asEdgeList
)
```

The line graph of the star graph _S(n)_ is a complete graph _K(n - 1)_:

```
>>> 5.starGraph
>>> .lineGraph
>>> .adjacencyMatrix
[
	0 1 1 1;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0
]
```

Drawing of the star graph on six vertices:

~~~spl svg=A
6.starGraph.graphPlot
~~~

![](sw/spl/Help/Image/starGraph-A.svg)

Drawing of the line graph of the star graph on six vertices:

~~~spl svg=B
6.starGraph.lineGraph.graphPlot
~~~

![](sw/spl/Help/Image/starGraph-B.svg)

* * *

See also: cycleGraph, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StarGraph.html)
[2](https://reference.wolfram.com/language/ref/StarGraph.html)

Categories: Graph, Collection
