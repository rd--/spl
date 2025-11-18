# graphComplement

- _graphComplement(g)_

Answer the complement graph of the graph _g_.

At `cycleGraph`:

```
>>> 4.cycleGraph
>>> .graphComplement
>>> .edgeList
[1 3; 2 4].asEdgeList

>>> 5.cycleGraph
>>> .graphComplement
>>> .edgeList
[1 3; 1 4; 2 4; 2 5; 3 5].asEdgeList

>>> 6.cycleGraph
>>> .graphComplement
>>> .edgeList
[
	1 3; 1 4; 1 5;
	2 4; 2 5; 2 6;
	3 5; 3 6;
	4 6
].asEdgeList
```

At directed cycle graph:

```
>>> [
>>> 	1 -> 2,
>>> 	2 -> 3,
>>> 	3 -> 4,
>>> 	4 -> 1
>>> ].asGraph
>>> .graphComplement
>>> .edgeList
[
	1 --> 3, 1 --> 4,
	2 --> 1, 2 --> 4,
	3 --> 1, 3 --> 2,
	4 --> 2, 4 --> 3
]
```

The graphComplement of a `completeGraph` is an edgeless graph:

```
>>> let g = 5.completeGraph
>>> .graphComplement;
>>> (g.vertexList, g.isEmpty)
([1 2 3 4 5], true)
```

For simple graphs, the graphComplement of the graphComplement is the original graph:

```
>>> 6.cycleGraph
>>> .graphComplement
>>> .graphComplement
>>> .edgeList
[1 2; 1 6; 2 3; 3 4; 4 5; 5 6].asEdgeList
```

The graphComplement of the line graph of _K(5)_ is a Petersen graph:

```
>>> 5.completeGraph
>>> .lineGraph
>>> .graphComplement
>>> .adjacencyMatrix
[
	0 0 0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 0 0 1;
	0 0 0 0 1 0 1 0 1 0;
	0 0 0 0 1 1 0 1 0 0;
	0 0 1 1 0 0 0 0 0 1;
	0 1 0 1 0 0 0 0 1 0;
	0 1 1 0 0 0 0 1 0 0;
	1 0 0 1 0 0 1 0 0 0;
	1 0 1 0 0 1 0 0 0 0;
	1 1 0 0 1 0 0 0 0 0
]
```

The complement of the union of the two and three path graphs:

```
>>> [1 2; 3 4; 4 5]
>>> .asGraph
>>> .graphComplement
[1 3; 1 4; 1 5; 2 3; 2 4; 2 5; 3 5].asGraph
```

* * *

See also: complement, Graph, lineGraph, undirectedGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphComplement.html)
[1](https://reference.wolfram.com/language/ref/GraphComplement.html)
