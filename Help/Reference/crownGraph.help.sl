# crownGraph

- _crownGraph(n)_

Answer the _n_-crown graph.

Edge count:

```
>>> let n = 6;
>>> n.crownGraph.edgeCount
n * (n - 1)
```

The 3-crown graph is the 6-cycle graph:

~~~spl svg=A
3.crownGraph.graphPlot
~~~

![](sw/spl/Help/Image/crownGraph-A.svg)

The 4-crown graph is the cubical graph:

~~~spl svg=B
4.crownGraph.graphPlot
~~~

![](sw/spl/Help/Image/crownGraph-B.svg)

The 5-crown graph:

~~~spl svg=C
5.crownGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/crownGraph-C.svg)

The 6-crown graph:

~~~spl svg=D
6.crownGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/crownGraph-D.svg)

* * *

See also: Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CrownGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Crown_graph)
