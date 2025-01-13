# includesEdge

- _includesEdge(aGraph, anEdge)_

Answer `true` if _aGraph_ includes _anEdge_ according to `matchesEdge`.

Undirected edges match directed edges in both directions:

```
>>> 5.starGraph
[1 2; 1 3; 1 4; 1 5].asGraph

>>> 5.starGraph.includesEdge(1 --- 5)
true

>>> 5.starGraph.includesEdge(1 --> 5)
true

>>> 5.starGraph.includesEdge(5 --> 1)
true
```

Directed edges match undirected edges and directed edges that are equal:

```
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> [1 --- 3, 1 --> 3, 3 --> 1].collect { :each |
>>> 	g.includesEdge(each)
>>> }
[true false true]
```

This is not the same as asking if the edge list of a graph includes an edge:

```
>>> 5.starGraph.includesEdge(1 --> 5)
true

>>> 5.starGraph.edgeList.includes(1 --> 5)
false
```

* * *

See also: DirectedEdge, Graph, matchesEdge, UndirectedEdge

Guides: Graph Functions
