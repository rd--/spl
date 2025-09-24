# incidenceGraph

- _incidenceGraph(m)_
- _incidenceGraph(g, v)_

At `List`,
answer the `Graph` described by the incidence matrix _m_.

An undirected graph from its incidence matrix:

```
>>> [
>>> 	0 1 1;
>>> 	1 0 1;
>>> 	1 1 0
>>> ].incidenceGraph
[2 3; 1 3; 1 2].asGraph
```

A directed graph from its incidence matrix:

```
>>> [
>>> 	0 -1 1;
>>> 	1 0 -1;
>>> 	-1 1 0
>>> ].incidenceGraph
[3 -> 2, 1 -> 3, 2 -> 1].asGraph
```

An undirected graph with a self-loop:

```
>>> [
>>> 	2 0 1 1;
>>> 	0 1 0 1;
>>> 	0 1 1 0
>>> ].incidenceGraph
[1 1; 2 3; 1 3; 1 2].asGraph
```

A directed graph with a self-loop:

```
>>> [
>>> 	2 0 -1 1;
>>> 	0 1 0 -1;
>>> 	0 -1 1 0
>>> ].incidenceGraph
[1 --- 1, 3 --> 2, 1 --> 3, 2 --> 1].asGraph
```

A graph of four vertices and five edges:

```
>>> [
>>> 	1 1 0 0 0;
>>> 	1 0 1 1 0;
>>> 	0 1 1 0 1;
>>> 	0 0 0 1 1
>>> ].incidenceGraph
[1 2; 1 3; 2 3; 2 4; 3 4].asGraph
```

Reconstruct a graph from the calculated incidence matrix:

~~~spl svg=A
5.completeGraph
.incidenceMatrix
.incidenceGraph
.graphPlot
~~~

![](sw/spl/Help/Image/incidenceGraph-A.svg)

At `Graph`,
answer the graph of the `incidenceList` of the vertex _v_ of the graph _g_.

Each vertex in a cycle graph has two neighours:

```
>>> 5.cycleGraph.incidenceGraph(1)
[1 --- 2, 1 --- 5].asGraph

>>> 5.cycleGraph.incidenceList(1)
[1 --- 2, 1 --- 5]
```

Corner vertices in a grid graph have two neighours:

```
>>> [4 4].gridGraph.incidenceGraph(1)
[1 2; 1 5].asGraph

>>> [4 4].gridGraph.incidenceList(1)
[1 --- 2, 1 --- 5]
```

Side vertices in a grid graph have three neighours:

```
>>> [4 4].gridGraph.incidenceGraph(5)
[1 5; 5 6; 5 9].asGraph

>>> [4 4].gridGraph.incidenceList(5)
[1 --- 5, 5 --- 6, 5 --- 9]
```

Interior vertices in a grid graph have four neighours:

```
>>> [4 4].gridGraph.incidenceGraph(11)
[7 11; 10 11; 11 12; 11 15].asGraph

>>> [4 4].gridGraph.incidenceList(11)
[7 --- 11, 10 --- 11, 11 --- 12, 11 --- 15]
```

The incidence graph of a complete graph is a star graph:

```
>>> 5.completeGraph.incidenceGraph(1)
5.starGraph

>>> 5.completeGraph.incidenceList(1)
[1 --- 2, 1 --- 3, 1 --- 4, 1 --- 5]
```

The incidence graph of a star graph is itself:

```
>>> 5.starGraph.incidenceGraph(1)
5.starGraph

>>> 5.starGraph.incidenceList(1)
[1 --- 2, 1 --- 3, 1 --- 4, 1 --- 5]
```

* * *

See also: adjacencyList, Graph, incidenceMatrix, neighbourhoodGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IncidenceGraph.html)

Categories: Graph
