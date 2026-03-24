# knightGraph

- _knightGraph(m, n=m)_

Answer the _(m,n)_ knight’s graph,
also called the knight’s tour graph.

Plot the _(3,3)_ knight’s graph:

~~~spl svg=A
3.knightGraph.graphPlot
~~~

![](Help/Image/knightGraph-A.svg)

Plot the _(4,4)_ knight’s graph:

~~~spl svg=B
4.knightGraph.graphPlot
~~~

![](Help/Image/knightGraph-B.svg)

Draw the _(4,4)_ knight’s graph,
the answered graph has vertex specified:

~~~spl svg=C
4.knightGraph.asLineDrawing
~~~

![](Help/Image/knightGraph-C.svg)

Draw the _(5,5)_ knight’s graph:

~~~spl svg=D
5.knightGraph.asLineDrawing
~~~

![](Help/Image/knightGraph-D.svg)

Draw the _(7,9)_ knight’s graph:

~~~spl svg=E
knightGraph(7, 9).asLineDrawing
~~~

![](Help/Image/knightGraph-E.svg)

Draw the _(3,3)_ knight’s graph:

~~~spl svg=F
knightGraph(3, 3).asLineDrawing
~~~

![](Help/Image/knightGraph-F.svg)

The adjacency matrix of the _(6,6)_ knight’s graph:

~~~spl svg=G
knightGraph(6, 6)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/knightGraph-G.svg)

The adjacency matrix of the _(7,4)_ knight’s graph:

~~~spl svg=H
knightGraph(7, 4)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/knightGraph-H.svg)

The adjacency matrix of the _(4,7)_ knight’s graph:

~~~spl svg=I
knightGraph(4, 7)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/knightGraph-I.svg)

The number of edges in the _n×n_ knight graph is _4(n-2)(n-1)_,
eight times the triangular numbers,
OEIS [A033996](https://oeis.org/A033996):

```
>>> 0:9.triangularNumber * 8
[0 8 24 48 80 120 168 224 288 360]
```

* * *

See also: Graph, rookGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KnightGraph.html)
[2](https://reference.wolfram.com/language/ref/KnightTourGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Knight%27s_graph)
