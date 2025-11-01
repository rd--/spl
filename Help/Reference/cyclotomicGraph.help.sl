# cyclotomicGraph

- _cyclotomicGraph(p)_

Answer the cyclotomic graph for integer _p_.

The first few values of _p_ for which there are simple cyclotomic graphs,
OEIS [A137827](https://oeis.org/A137827):

```
>>> (4, 7 .. 100).select(
>>> 	isPrimePower:/1
>>> )
[
	 4  7 13 16 19 25 31 37 43 49
	61 64 67 73 79 97
]
```

Edge counts for simple cyclotomic graphs:

```
>>> 13.cyclotomicGraph.edgeCount
26

>>> 61.cyclotomicGraph.edgeCount
610
```

The 7-cyclotomic graph is the 7-cycle graph:

~~~spl svg=A
7.cyclotomicGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/cyclotomicGraph-A.svg)

The 13-cyclotomic graph:

~~~spl svg=B
13.cyclotomicGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/cyclotomicGraph-B.svg)

The 19-cyclotomic graph:

~~~spl svg=C
19.cyclotomicGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/cyclotomicGraph-C.svg)

_Note_:
Not implemented for non-prime _p_.

* * *

See also: Graph, paleyGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclotomicGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Paley_graph)
