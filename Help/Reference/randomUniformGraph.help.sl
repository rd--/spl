# randomUniformGraph

- _randomUniformGraph(r, n, m)_

Answer a graph with _n_ vertices and _m_ edges.
The edge list does not contain duplicates and the graph does not contain self arcs.

A pseudorandom graph of five vertices and six edges:

~~~spl svg=A
Sfc32(728914)
.randomUniformGraph(5, 6)
.graphPlot
~~~

![](sw/spl/Help/Image/randomUniformGraph-A.svg)

A pseudorandom graph of seven vertices and ten edges:

~~~spl svg=B
Sfc32(281634)
.randomUniformGraph(7, 10)
.graphPlot
~~~

![](sw/spl/Help/Image/randomUniformGraph-B.svg)

A pseudorandom graph of twenty-three vertices and thirty-seven edges:

~~~spl svg=C
Sfc32(801842)
.randomUniformGraph(23, 37)
.graphPlot
~~~

![](sw/spl/Help/Image/randomUniformGraph-C.svg)

* * *

See also: Graph, randomBernoulliGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UniformGraphDistribution.html)
[2](https://reference.wolfram.com/language/ref/RandomGraph.html)
