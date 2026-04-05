# perfectDifferenceSetGraph

- _isPerfectDifferenceSet([n₁ n₂ …], m)_

Answer a graph with vertices _1…m_ with edges connecting vertices that sum, modulo _m_, to an entry in _n_.

The _0,1,3%7_ perfect difference set graph:

~~~spl svg=A
[0 1 3].perfectDifferenceSetGraph(7)
.graphPlot
~~~

![](Help/Image/perfectDifferenceSetGraph-A.svg)

The _0,1,4,6%13_ perfect difference set graph:

~~~spl svg=B
[0 1 4 6].perfectDifferenceSetGraph(13)
.graphPlot
~~~

![](Help/Image/perfectDifferenceSetGraph-B.svg)

The _0,1,4,14,16%21_ perfect difference set graph:

~~~spl svg=C
[0 1 4 14 16].perfectDifferenceSetGraph(21)
.graphPlot
~~~

![](Help/Image/perfectDifferenceSetGraph-C.svg)

* * *

See also: isPerfectDifferenceSet

Guides: Graph Functions

Further Reading: Erskine 2021
