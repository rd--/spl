# paleyGraph

- _paleyGraph(p)_

Answer the Paley graph for integer _p_.

The first few values of _p_ for which there are simple Paley graphs,
OEIS [A085759](https://oeis.org/A085759):

```
>>> 1 + (4 * 1:12)
[5 9 13 17 21 25 29 33 37 41 45 49]
```

The 5-Paley graph is the 5-cycle graph:

~~~spl svg=A
5.paleyGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/paleyGraph-A.svg)

The 9-Paley graph is the generalised quadrangle,
or triangular duoprism:

~~~spl svg=B
9.paleyGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/paleyGraph-B.svg)

The 13-Paley graph:

~~~spl svg=C
13.paleyGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/paleyGraph-C.svg)

The 17-Paley graph:

~~~spl svg=D
17.paleyGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/paleyGraph-D.svg)

The 25-Paley graph:

~~~spl svg=E
25.paleyGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/paleyGraph-E.svg)

* * *

See also: cyclotomicGraph, Graph, hadamardMatrix

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PaleyGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Paley_graph)
