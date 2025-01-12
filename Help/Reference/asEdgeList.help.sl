# asEdgeList

- _asEdge(aList)_

Answer a list of edges,
which may contain any combination of `DirectedEdge` and `UndirectedEdge` values.

```
>>> [
>>> 	1 -> 3,
>>> 	[1, 3],
>>> 	1 --> 3,
>>> 	1 --- 3
>>> ]
>>> .asEdgeList
[1 --> 3, 1 --- 3, 1 --> 3, 1 --- 3]
```

* * *

See also: asEdge, Association, DirectedEdge, List, UndirectedEdge

Guides: Graph Functions
