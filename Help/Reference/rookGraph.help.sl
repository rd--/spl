# rookGraph

- _rookGraph(m, n=m)_

Answer the rook’s graph _R(m,n)_.
The rook’s graph is the graph product of the _m_ and _n_ complete graphs.

The rook’s graph _R(2,2)_,
the square:

~~~spl svg=A
2.rookGraph.graphPlot
~~~

![](Help/Image/rookGraph-A.svg)

The rook’s graph _R(2,3)_,
the prism:

~~~spl svg=B
2.rookGraph(3).graphPlot
~~~

![](Help/Image/rookGraph-B.svg)

The rook’s graph _R(3,3)_,
the generalised quadrangle:

~~~spl svg=C
3.rookGraph.graphPlot
~~~

![](Help/Image/rookGraph-C.svg)

The rook’s graph _R(5,5)_,
the twenty-five cyclotomic graph:

~~~spl svg=D
5.rookGraph.graphPlot
~~~

![](Help/Image/rookGraph-D.svg)

The rook’s graph _R(5,5)_,
the twenty-five cyclotomic graph:

~~~spl svg=E
5.rookGraph
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/rookGraph-E.svg)

The rook’s graph _R(3,5)_,
the twenty-five cyclotomic graph:

~~~spl svg=F
rookGraph(3, 5)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/rookGraph-F.svg)

The rook’s graph _R(5,3)_,
the twenty-five cyclotomic graph:

~~~spl svg=G
rookGraph(5, 3)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/rookGraph-G.svg)

* * *

See also: completeGraph, graphProduct

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RookGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Rook%27s_graph)
