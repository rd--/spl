# petersenGraph

- _petersenGraph(n, k)_

Answer the _(n,k)_ generalized Petersen graph,
where _k_ is less than _n/2_.

The Petersen graph is the _(5,2)_ generalized Petersen graph:

```
>>> let g = 5.petersenGraph(2);
>>> (
>>> 	g.vertexCount,
>>> 	g.edgeCount,
>>> 	g.isRegular
>>> )
(10, 15, true)
```

The Petersen graph is the complement of the line graph of the complete graph of five vertices:

```
>>> let k = 5.completeGraph;
>>> let p = k.lineGraph.complement;
>>> (
>>> 	p.vertexCount,
>>> 	p.edgeCount,
>>> 	p.isRegular
>>> )
(10, 15, true)
```

Plot the _5,1_ generalized Petersen graph:

~~~spl svg=A
5.petersenGraph(1)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-A.svg)

Plot the adjacency matrix of the _7,2_ Petersen graph:

~~~spl svg=B
7.petersenGraph(2)
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/petersenGraph-B.svg)

When _k=1_ generates the _n_-prism graph:

~~~spl svg=C
4.petersenGraph(1)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-C.svg)

Plot the Dürer graph:

~~~spl svg=D
6.petersenGraph(2)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-D.svg)

Plot the Desargues graph:

~~~spl svg=E
10.petersenGraph(3)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-E.svg)

Plot the cubic symmetric graph _F(048)A_:

~~~spl svg=F
24.petersenGraph(5)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-F.svg)

Plot the Petersen graph,
the _(5,2)_ generalized Petersen graph:

~~~spl svg=G
5.petersenGraph(2)
.graphPlot
~~~

![](sw/spl/Help/Image/petersenGraph-G.svg)

Plot the line graph of the Petersen graph:

~~~spl svg=H
5.petersenGraph(2)
.lineGraph
.circularGraphPlot(1)
~~~

![](sw/spl/Help/Image/petersenGraph-H.svg)

* * *

See also: circulantGraph, complement, completeGraph, cycleGraph, Graph, lineGraph, prismGraph, starPolygon

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PetersenGraph.html)
[2](https://mathworld.wolfram.com/GeneralizedPetersenGraph.html)
[3](https://reference.wolfram.com/language/ref/PetersenGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Petersen_graph)
[2](https://en.wikipedia.org/wiki/Generalized_Petersen_graph)
