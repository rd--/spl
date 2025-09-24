# kirchhoffGraph

- _kirchhoffGraph(m)_

Answer the graph with Kirchhoff matrix _m_.

Construct a graph from a Kirchhoff matrix:

~~~spl svg=A
[2 -1 0; 0 2 -1; -1 0 2]
.kirchhoffGraph
.graphPlot
~~~

![](sw/spl/Help/Image/kirchhoffGraph-A.svg)

A symmetric Kirchhoff matrix results in an undirected graph:

~~~spl svg=B
[2 -1 -1; -1 2 -1; -1 -1 2]
.kirchhoffGraph
.graphPlot
~~~

![](sw/spl/Help/Image/kirchhoffGraph-B.svg)

Use `table` to specify the Kirchhoff matrix:

~~~spl svg=C
{ :i :j |
	(i = j).if { 6 } { -1 }
}.table(1:6, 1:6)
.kirchhoffGraph
.graphPlot
~~~

![](sw/spl/Help/Image/kirchhoffGraph-C.svg)

* * *

See also: kirchhoffMatrix

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KirchhoffGraph.html)
