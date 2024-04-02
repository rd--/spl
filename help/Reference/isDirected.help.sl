# isDirected

- _isDirected(aGraph)_

Answers `true` if _aGraph_ is a directed graph, else `false`.

A graph is directed if all of its edges are directed.

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.isDirected
true

>>> let g = [1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> let e = g.edgeList;
>>> (g.isDirected, e.collect(isDirectedEdge:/1))
(true, [true true true])

>>> [1 2; 2 3; 3 1].asGraph.isDirected
false
```

* * *

See also: Graph, isUndirected
