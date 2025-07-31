# hammingGraph

- _hammingGraph(d, q)_

Answer the Hamming graph _H(d,q)_,
the Cartesian product of _d_ copies of the _q_-complete graph.

The _(1,k)_ Hamming graph is the _k_-complete graph:

~~~spl svg=A
hammingGraph(1, 5)
.graphPlot
~~~

![](sw/spl/Help/Image/hammingGraph-A.svg)

The _(2,q)_ Hamming graph is the _(q,q)_ rook graph:

~~~spl svg=B
hammingGraph(2, 4)
.graphPlot
~~~

![](sw/spl/Help/Image/hammingGraph-B.svg)

The _(2,3)_ Hamming graph is the _(2,1)_ generalized quadrangle,
a generalized polygon of order four:

~~~spl svg=C
hammingGraph(2, 3)
.graphPlot
~~~

![](sw/spl/Help/Image/hammingGraph-C.svg)

The _(d,2)_ Hamming graph is _d_ hypercube graph:

~~~spl svg=D
hammingGraph(4, 2)
.graphPlot
~~~

![](sw/spl/Help/Image/hammingGraph-D.svg)

The _(3,3)_ Hamming graph:

~~~spl svg=E
hammingGraph(3, 3)
.graphPlot
~~~

![](sw/spl/Help/Image/hammingGraph-E.svg)

* * *

See also: Graph, hammingDistance, tuples

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammingGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Hamming_graph)
