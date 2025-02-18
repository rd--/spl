# simpleGraph

- _simpleGraph(aGraph)_

Remove self-loops from an undirected graph:

~~~spl svg=A
[1 1; 1 2; 2 3; 3 1]
.asGraph
.simpleGraph
.graphPlot
~~~

![](sw/spl/Help/Image/simpleGraph-A.svg)

Remove self-loops from a directed graph:

~~~spl svg=B
[1 -> 1, 1 -> 2, 2 -> 3, 3 -> 1]
.asGraph
.simpleGraph
.graphPlot
~~~

![](sw/spl/Help/Image/simpleGraph-B.svg)

Remove self-loops and multiple edges from an undirected graph:

~~~spl svg=C
[1 1; 1 2; 1 3; 2 1; 2 2; 2 3; 3 3]
.asGraph
.simpleGraph
.graphPlot
~~~

![](sw/spl/Help/Image/simpleGraph-C.svg)

Remove self-loops and multiple edges from a mixed graph:

~~~spl svg=D
[
	1 --- 1,
	1 --> 2, 2 --> 3, 3 --> 4,
	4 --- 2, 4 --- 5, 5 --- 6, 6 --- 2
]
.asGraph
.simpleGraph
.graphPlot
~~~

![](sw/spl/Help/Image/simpleGraph-D.svg)

* * *

See also: Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SimpleGraph.html)
