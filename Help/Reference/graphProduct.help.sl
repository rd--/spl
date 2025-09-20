# graphProduct

- _graphProduct(g₁, g₂, k='Cartesian')_

Answer the cartesian graph product of the two graphs _g₁_ and _g₂_.

The product of two path graphs is a grid graph:

```
>>> 3.pathGraph
>>> .graphProduct(
>>> 	6.pathGraph
>>> )
[3 6].gridGraph
```

Plot an _m_-ladder graph,
an _m,2_ grid graph:

~~~spl svg=A
5.pathGraph
.graphProduct(
	2.pathGraph
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-A.svg)

Plot the _2,3,3,2_ grid graph:

~~~spl svg=B
[2 3 2 3]
.collect(pathGraph:/1)
.reduce(graphProduct:/2)
.graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-B.svg)

Plot a three-prism graph:

~~~spl svg=C
3.cycleGraph
.graphProduct(
	2.pathGraph,
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-C.svg)

Plot a stacked five-prism graph:

~~~spl svg=D
5.cycleGraph
.graphProduct(
	4.pathGraph
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-D.svg)

Plot a torus grid graph:

~~~spl svg=E
5.cycleGraph
.graphProduct(
	8.cycleGraph,
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-E.svg)

Plot a book graph:

~~~spl svg=F
(4 + 1).starGraph
.graphProduct(
	2.pathGraph
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-F.svg)

Plot a stacked book graph:

~~~spl svg=G
(3 + 1).starGraph
.graphProduct(
	5.pathGraph
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-G.svg)

Plot a four-crown graph,
which is the cubical graph

~~~spl svg=H
2.completeGraph
.graphProduct(
	4.completeGraph
).complement.graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-H.svg)

Plot a 4×4 rook graph:

~~~spl svg=I
4.completeGraph
.graphProduct(
	4.completeGraph
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-I.svg)

Plot a _4,2_ Hamming graph,
which is the hypercube graph:

~~~spl svg=J
(2.completeGraph # 4)
.reduce(graphProduct:/2)
.graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-J.svg)

Plot _7,7_ king graph,
the strong (normal) product of two path graphs:

~~~spl svg=K
7.pathGraph.graphProduct(
	7.pathGraph,
	'Normal'
).graphPlot
~~~

![](sw/spl/Help/Image/graphProduct-K.svg)

* * *

See also: hammingGraph, gridGraph, prismGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphCartesianProduct.html)
[2](https://mathworld.wolfram.com/GraphStrongProduct.html)
[3](https://reference.wolfram.com/language/ref/GraphProduct.html),
_W_
[1](https://en.wikipedia.org/wiki/Cartesian_product_of_graphs)
[2](https://en.wikipedia.org/wiki/Strong_product_of_graphs)
