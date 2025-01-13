# incidenceGraph

- _incidenceGraph(aGraph, aVertex)_

Answer the `Graph` of the `incidenceList`

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

Categories: Graph
