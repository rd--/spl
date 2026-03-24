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

An _m_-ladder graph, the _m,2_ grid graph:

~~~spl svg=A
5.pathGraph
.graphProduct(
	2.pathGraph
).graphPlot
~~~

![](Help/Image/graphProduct-A.svg)

The _2,3,3,2_ grid graph:

~~~spl svg=B
[2 3 2 3]
.collect(pathGraph:/1)
.reduce(graphProduct:/2)
.graphPlot
~~~

![](Help/Image/graphProduct-B.svg)

A three-prism graph:

~~~spl svg=C
3.cycleGraph
.graphProduct(
	2.pathGraph
).graphPlot
~~~

![](Help/Image/graphProduct-C.svg)

A stacked five-prism graph:

~~~spl svg=D
5.cycleGraph
.graphProduct(
	4.pathGraph
).graphPlot
~~~

![](Help/Image/graphProduct-D.svg)

A torus grid graph:

~~~spl svg=E
5.cycleGraph
.graphProduct(
	8.cycleGraph
).graphPlot
~~~

![](Help/Image/graphProduct-E.svg)

A book graph:

~~~spl svg=F
(4 + 1).starGraph
.graphProduct(
	2.pathGraph
).graphPlot
~~~

![](Help/Image/graphProduct-F.svg)

A stacked book graph:

~~~spl svg=G
(3 + 1).starGraph
.graphProduct(
	5.pathGraph
).graphPlot
~~~

![](Help/Image/graphProduct-G.svg)

A four-crown graph,
which is the cubical graph:

~~~spl svg=H
2.completeGraph
.graphProduct(
	4.completeGraph
).complement.graphPlot
~~~

![](Help/Image/graphProduct-H.svg)

A 4×4 rook graph:

~~~spl svg=I
4.completeGraph
.graphProduct(
	4.completeGraph
).graphPlot
~~~

![](Help/Image/graphProduct-I.svg)

A _4,2_ Hamming graph,
which is the hypercube graph:

~~~spl svg=J
List(4, 2.completeGraph)
.reduce(graphProduct:/2)
.graphPlot
~~~

![](Help/Image/graphProduct-J.svg)

The _7,7_ king graph,
the strong (normal) product of two path graphs:

~~~spl svg=K
7.pathGraph.graphProduct(
	7.pathGraph,
	'Normal'
).graphPlot
~~~

![](Help/Image/graphProduct-K.svg)

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
