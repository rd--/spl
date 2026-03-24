# ringLatticeGraph

- _ringLatticeGraph(n, k)_

Answer a regular ring lattice graph,
a graph with _n_ vertices each connected to _k_ neighbors,
_k/2_ on each side.

The _n=10_ and _k=4_ ring lattice graph:

```
>>> let g = ringLatticeGraph(10, 4);
>>> (g.edgeCount, g.vertexDegree)
(20, [4 4 4 4 4 4 4 4 4 4])
```

The _n=10_ and _k=4_ ring lattice graph:

~~~spl svg=A
ringLatticeGraph(10, 4)
.graphPlot
~~~

![](Help/Image/ringLatticeGraph-A.svg)

Adjacency matrix of the _n=16_ and _k=4_ ring lattice graph:

~~~spl svg=B
ringLatticeGraph(16, 4)
.adjacencyMatrix
.matrixPlot
~~~

![](Help/Image/ringLatticeGraph-B.svg)

The _k=2_ ring lattice graph is a cycle graph:

~~~spl svg=C
ringLatticeGraph(10, 2)
.graphPlot
~~~

![](Help/Image/ringLatticeGraph-C.svg)

Relation to `circulantGraph`,
the _n=10_ and _k=4_ ring lattice graph
is equal to the _n=10_ and _j=1,2_ circulant graph:

~~~spl svg=D
circulantGraph(10, [1 .. 2])
.graphPlot
~~~

![](Help/Image/ringLatticeGraph-D.svg)

A _k=n-1_ ring lattice graph is a complete graph,
the _n=9_ and _k=8_ ring lattice graph:

~~~spl svg=E
ringLatticeGraph(9, 8)
.graphPlot
~~~

![](Help/Image/ringLatticeGraph-E.svg)

The _n=9_ complete graph:

~~~spl svg=F
9.completeGraph.graphPlot
~~~

![](Help/Image/ringLatticeGraph-F.svg)

* * *

See also: circulantGraph, cycleGraph, Graph, wattsStrogatzModel

Guides: Graph Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Watts%E2%80%93Strogatz_model)
