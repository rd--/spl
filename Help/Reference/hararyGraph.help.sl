# hararyGraph

- _hararyGraph(k, n)_

Answer the minimal _k_-connected graph on _n_ vertices.

When _k_ or _n_ is even, _H(k, n)_ is a circulant graph.
Even _k_ and even _n_:

~~~spl svg=A
hararyGraph(4, 8).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-A.svg)

Even _k_ and odd _n_:

~~~spl svg=B
hararyGraph(4, 7).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-B.svg)

Odd _k_ and even _n_:

~~~spl svg=C
hararyGraph(3, 8).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-C.svg)

Odd _k_ and odd _n_

~~~spl svg=D
hararyGraph(3, 7).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-D.svg)

A wheel graph:

~~~spl svg=E
hararyGraph(3, 5).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-E.svg)

`cycleGraph` is a special case of `hararyGraph`,
the triangle graph:

~~~spl svg=F
hararyGraph(2, 3).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-F.svg)

Tetrahedral graph:

~~~spl svg=G
hararyGraph(3, 4).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-G.svg)

_H(n - 1, n)_ is the complete graph _K(n)_,
`completeGraph` is a special case of `hararyGraph`:

~~~spl svg=H
hararyGraph(5, 6).graphPlot
~~~

![](sw/spl/Help/Image/hararyGraph-H.svg)

* * *

See also: circulantGraph, completeGraph, cycleGraph, Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HararyGraph.html)
[2](https://reference.wolfram.com/language/ref/HararyGraph.html)
