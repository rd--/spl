# torusGraph

- _torusGraph([n₁ n₂ …])_

Answer the _k_-dimensional torus graph.

Plot the _3,3_ torus graph,
the generalized quadrangle:

~~~spl svg=A
[3 3].torusGraph.graphPlot
~~~

![](sw/spl/Help/Image/torusGraph-A.svg)

Plot the _5,3_ torus graph,
a circulant graph:

~~~spl svg=B
[5 3].torusGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/torusGraph-B.svg)

Plot the _10,6_ torus graph:

~~~spl svg=C
[10 6].torusGraph.graphPlot
~~~

![](sw/spl/Help/Image/torusGraph-C.svg)

Plot the _4,4_ torus graph,
the tesseract:

~~~spl svg=D
[4 4].torusGraph.graphPlot
~~~

![](sw/spl/Help/Image/torusGraph-D.svg)

Plot the _3,6_ torus graph,
a quartic vertex-transitive graph:

~~~spl svg=E
[3 6].torusGraph.graphPlot
~~~

![](sw/spl/Help/Image/torusGraph-E.svg)

Plot the adjacency matrix of the _5,7_ torus graph:

~~~spl svg=F
[5 7].torusGraph
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/torusGraph-F.svg)

* * *

See also: cycleGraph, graphProduct

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TorusGridGraph.html)
[2](https://reference.wolfram.com/language/ref/TorusGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Toroidal_graph)
