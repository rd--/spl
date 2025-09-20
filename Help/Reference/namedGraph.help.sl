# namedGraph

- _namedGraph(s)_

Answer the named `Graph`.

Plot the Shrikhande graph:

~~~spl svg=A
'ShrikhandeGraph'
.namedGraph
.circularGraphPlot
~~~

![](sw/spl/Help/Image/namedGraph-A.svg)

Plot the Heawood graph:

~~~spl svg=B
'HeawoodGraph'
.namedGraph
.circularGraphPlot
~~~

![](sw/spl/Help/Image/namedGraph-B.svg)

Plot the Tutte _(3,8)_-Cage graph:

~~~spl svg=C
'TutteThreeEightCageGraph'
.namedGraph
.circularGraphPlot
~~~

![](sw/spl/Help/Image/namedGraph-C.svg)

Plot the Coxeter graph:

~~~spl svg=D
'CoxeterGraph'
.namedGraph
.graphPlot
~~~

![](sw/spl/Help/Image/namedGraph-D.svg)

Plot the Tutte graph:

~~~spl svg=E
'TutteGraph'
.namedGraph
.graphPlot
~~~

![](sw/spl/Help/Image/namedGraph-E.svg)

Plot the adjacency matrix of the Tutte graph:

~~~spl svg=F
'TutteGraph'
.namedGraph
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/namedGraph-F.svg)

* * *

See also: Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CoxeterGraph.html)
[2](https://mathworld.wolfram.com/HeawoodGraph.html)
[3](https://mathworld.wolfram.com/TuttesGraph.html)
[4](https://mathworld.wolfram.com/Tutte8-Cage.html)
[5](https://mathworld.wolfram.com/ShrikhandeGraph.html)
