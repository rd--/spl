# randomBernoulliGraph

- _randomBernoulliGraph(r, n, p)_

Answer a graph with _n_ vertices and edge probability _p_.

A pseudorandom graph of ten vertices and edge probability of sixty-percent:

~~~spl svg=A
Sfc32(789214)
.randomBernoulliGraph(10, 0.6)
.graphPlot
~~~

![](sw/spl/Help/Image/randomBernoulliGraph-A.svg)

A pseudorandom graph of seventeen vertices and edge probability of twenty-percent:

~~~spl svg=B
Sfc32(281634)
.randomBernoulliGraph(17, 0.2)
.graphPlot
~~~

![](sw/spl/Help/Image/randomBernoulliGraph-B.svg)

Edge probability of one results in the complete graph:

~~~spl svg=C
Sfc32(281634)
.randomBernoulliGraph(5, 1)
.graphPlot
~~~

![](sw/spl/Help/Image/randomBernoulliGraph-C.svg)

* * *

See also: Graph, randomUniformGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BernoulliGraphDistribution.html)
[2](https://reference.wolfram.com/language/ref/RandomGraph.html)
