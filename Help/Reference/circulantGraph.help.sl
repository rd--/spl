# circulantGraph

- _circulantGraph(n, [j...])_

Answer the circulant graph with _n_ vertices and jumps _j.._.

The circulant graph with ten vertices and jumps two and four:

~~~spl svg=A
10.circulantGraph([2 4]).graphPlot
~~~

![](sw/spl/Help/Image/circulantGraph-A.svg)

The circulant graph _C(n, 1:n/2)_ gives the complete graph:

~~~spl svg=B
6.circulantGraph([1 2 3]).graphPlot
~~~

![](sw/spl/Help/Image/circulantGraph-B.svg)

The circulant graph with jump `one` gives the cycle graph:

~~~spl svg=C
6.circulantGraph([1]).graphPlot
~~~

![](sw/spl/Help/Image/circulantGraph-C.svg)

The adjacency matrix of the circulant graph is circulant:

~~~spl svg=D
6.circulantGraph([3 5])
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/circulantGraph-D.svg)

A circulant graph with seventeen vertices:

~~~spl svg=E
17.circulantGraph([1, 13]).graphPlot
~~~

![](sw/spl/Help/Image/circulantGraph-E.svg)

The adjacency matrix of a circulant graph of ninety-nine edges:

~~~spl png=F
33.circulantGraph([1 2 3])
.adjacencyMatrix
.Bitmap
~~~

![](sw/spl/Help/Image/circulantGraph-F.png)

* * *

See also: hararyGraph, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CirculantGraph.html)
[2](https://reference.wolfram.com/language/ref/CirculantGraph.html)
