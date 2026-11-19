# hararyGraph

- _hararyGraph(k, n)_

Answer the minimal _k_-connected graph on _n_ vertices.

When _k_ or _n_ is even, _H(k, n)_ is a circulant graph.
Even _k_ and even _n_:

~~~spl svg=A
hararyGraph(4L, 8L)
.graphPlot
~~~

![](Help/Image/hararyGraph-A.svg)

Even _k_ and odd _n_:

~~~spl svg=B
hararyGraph(4L, 7L)
.graphPlot
~~~

![](Help/Image/hararyGraph-B.svg)

Odd _k_ and even _n_:

~~~spl svg=C
hararyGraph(3L, 8L)
.graphPlot
~~~

![](Help/Image/hararyGraph-C.svg)

Odd _k_ and odd _n_:

~~~spl svg=D
hararyGraph(3L, 7L)
.graphPlot
~~~

![](Help/Image/hararyGraph-D.svg)

A wheel graph:

~~~spl svg=E
hararyGraph(3L, 5L)
.graphPlot
~~~

![](Help/Image/hararyGraph-E.svg)

`cycleGraph` is a special case of `hararyGraph`,
the triangle graph:

~~~spl svg=F
hararyGraph(2L, 3L)
.graphPlot
~~~

![](Help/Image/hararyGraph-F.svg)

Tetrahedral graph:

~~~spl svg=G
hararyGraph(3L, 4L)
.graphPlot
~~~

![](Help/Image/hararyGraph-G.svg)

_H(n - 1, n)_ is the complete graph _K(n)_,
`completeGraph` is a special case of `hararyGraph`:

~~~spl svg=H
hararyGraph(5L, 6L)
.graphPlot
~~~

![](Help/Image/hararyGraph-H.svg)

* * *

See also: Graph, circulantGraph, completeGraph, cycleGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HararyGraph.html)
[2](https://reference.wolfram.com/language/ref/HararyGraph.html)
