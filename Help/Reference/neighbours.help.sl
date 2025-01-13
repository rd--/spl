# neighbours

- _neighbours(aGraph, aVertex)_

Answer a `List` of the vertices adjacent to _aVertex_ in _aGraph_.

Each vertex in a cycle graph has two neighours:

```
>>> 5.cycleGraph.neighbours(1)
[2 5]
```

Corner vertices in a grid graph have two neighours:

```
>>> [4 4].gridGraph.neighbours(1)
[2 5]
```

Side vertices in a grid graph have three neighours:

```
>>> [4 4].gridGraph.neighbours(5)
[1 6 9]
```

Interior vertices in a grid graph have four neighours:

```
>>> [4 4].gridGraph.neighbours(11)
[7 10 12 15]
```

All vertices are neighbours in a complete graph:

```
>>> 5.completeGraph.neighbours(1)
[2 3 4 5]
```

* * *

See also: adjacencyList, Graph, incidenceGraph, incidenceList, neighbourhoodGraph

Guides: Graph Functions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/graphs/sage/graphs/generic_graph.html#sage.graphs.generic_graph.GenericGraph.neighbors)

Categories: Graph
