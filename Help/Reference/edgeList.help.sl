# edgeList

- _edgeList(aGraph)_

Answer a `List` of the edges in _aGraph_.

At undirected graphs:

```
>>> 5.completeGraph.edgeList
[
	1 2; 1 3; 1 4; 1 5;
	2 3; 2 4; 2 5;
	3 4; 3 5;
	4 5
].asEdgeList

>>> 5.cycleGraph.edgeList
[1 2; 2 3; 3 4; 4 5; 5 1].asEdgeList

>>> 5.pathGraph.edgeList
[1 2; 2 3; 3 4; 4 5].asEdgeList
```

At directed graphs:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .edgeList
[1 -> 2, 2 -> 3, 3 -> 1].asEdgeList
```

* * *

See also: Graph, vertexList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EdgeSet.html)
[2](https://reference.wolfram.com/language/ref/EdgeList.html)

Categories: Collection
