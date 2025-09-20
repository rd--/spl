# knightGraph

- _knightGraph(m, n=m)_

Answer the _(m,n)_ knight graph.

Plot the _(3,3)_ knight graph:

~~~spl svg=A
3.knightGraph.graphPlot
~~~

![](sw/spl/Help/Image/knightGraph-A.svg)

Plot the _(4,4)_ knight graph:

~~~spl svg=B
4.knightGraph.graphPlot
~~~

![](sw/spl/Help/Image/knightGraph-B.svg)

Draw the _(4,4)_ knight graph,
the answered graph has vertex specified:

~~~spl svg=C
4.knightGraph.asLineDrawing
~~~

![](sw/spl/Help/Image/knightGraph-C.svg)

Draw the _(5,5)_ knight graph:

~~~spl svg=D
5.knightGraph.asLineDrawing
~~~

![](sw/spl/Help/Image/knightGraph-D.svg)

Draw the _(7,9)_ knight graph:

~~~spl svg=E
knightGraph(7, 9).asLineDrawing
~~~

![](sw/spl/Help/Image/knightGraph-E.svg)

* * *

See also: Graph, rookGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KnightGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Knight%27s_graph)
