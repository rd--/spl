# edgeList

- _edgeList(aGraph | aGeometry)_

Answer a `List` of the edges in a `Graph` or a geometric object.

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

At `Polyhedron`:

```
>>> [0 0 0].unitCube.edgeList
[
	1 2; 2 3; 3 4; 1 4;
	5 6; 6 7; 7 8; 5 8;
	4 8; 3 7; 2 6; 1 5
]
```

* * *

See also: edgeCount, Graph, vertexList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EdgeSet.html)
[2](https://reference.wolfram.com/language/ref/EdgeList.html)

Categories: Collection
