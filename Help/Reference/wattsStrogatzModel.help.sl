# wattsStrogatzModel

- _wattsStrogatzModel(r, n, k, β)_

Implement the Watts–Strogatz model for random graph generation.
It produces graphs with small-world properties,
including short average path lengths and high clustering.
The initial graph is a regular ring lattice graph with
_n_ vertices each connected to _k_ neighbors,
_k/2_ on each side.
_r_ is a random number generator,
and _β_ is the probablity of each edge being randomly re-wired.

A Watts–Strogatz model graph with _n=50_, _k=4_ and _β=0.05_:

~~~spl svg=A
Sfc32(738912)
.wattsStrogatzModel(50, 4, 0.05)
.graphPlot
~~~

![](Help/Image/wattsStrogatzModel-A.svg)

A Watts–Strogatz model graph with _n=20_, _k=4_ and _β=0.07_:

~~~spl svg=B
Sfc32(797243)
.wattsStrogatzModel(20, 4, 0.07)
.graphPlot
~~~

![](Help/Image/wattsStrogatzModel-B.svg)

A Watts–Strogatz model graph with _n=100_, _k=6_ and _β=0.01_:

~~~spl svg=C
Sfc32(791342)
.wattsStrogatzModel(100, 6, 0.01)
.graphPlot
~~~

![](Help/Image/wattsStrogatzModel-C.svg)

A Watts–Strogatz model graph with _n=160_, _k=12_ and _β=0.035_:

~~~spl svg=D
Sfc32(971342)
.wattsStrogatzModel(160, 12, 0.035)
.graphPlot
~~~

![](Help/Image/wattsStrogatzModel-D.svg)

A Watts–Strogatz model graph with _n=200_, _k=4_ and _β=0.175_:

~~~spl svg=E
Sfc32(517342)
.wattsStrogatzModel(200, 4, 0.175)
.graphPlot
~~~

![](Help/Image/wattsStrogatzModel-E.svg)

* * *

See also: circulantGraph, Graph, randomBernoulliGraph, ringLatticeGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WattsStrogatzGraphDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Watts%E2%80%93Strogatz_model)
