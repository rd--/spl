# neighbourhoodGraph

- _neighbourhoodGraph(g, v)_

Answer the graph neighbourhood of the vertex _v_ in graph _g_.
The neighbourhood graph for is defined as the vertices adjacent to _v_,
including _v_ itself,
and all edges connecting them.

Each vertex in a cycle graph has two neighours:

```
>>> 5.cycleGraph.neighbourhoodGraph(1)
[1 --- 2, 1 --- 5].asGraph
```

Corner vertices in a grid graph have two neighours:

```
>>> [4 4].gridGraph.neighbourhoodGraph(1)
[1 2; 1 5].asGraph
```

Side vertices in a grid graph have three neighours:

```
>>> [4 4].gridGraph.neighbourhoodGraph(5)
[1 5; 5 6; 5 9].asGraph
```

Interior vertices in a grid graph have four neighours:

```
>>> [4 4].gridGraph.neighbourhoodGraph(11)
[7 11; 10 11; 11 12; 11 15].asGraph
```

The neighbourhood graph of a complete graph is itself:

```
>>> 5.completeGraph.neighbourhoodGraph(1)
5.completeGraph
```

* * *

See also: adjacencyList, Graph, incidenceGraph, incidenceList, incidenceMatrix

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NeighborhoodGraph.html)
[2](https://reference.wolfram.com/language/ref/NeighborhoodGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Neighbourhood_(graph_theory))

Categories: Graph
