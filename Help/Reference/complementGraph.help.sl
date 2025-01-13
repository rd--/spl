# complementGraph

- _complementGraph(aGraph)_

Answer the complement graph of _aGraph_.

At `cycleGraph`:

```
>>> 4.cycleGraph
>>> .complementGraph
>>> .edgeList
[1 3; 2 4].asEdgeList

>>> 5.cycleGraph
>>> .complementGraph
>>> .edgeList
[1 3; 1 4; 2 4; 2 5; 3 5].asEdgeList

>>> 6.cycleGraph
>>> .complementGraph
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
>>> .complementGraph
>>> .edgeList
[
	1 --> 3, 1 --> 4,
	2 --> 1, 2 --> 4,
	3 --> 1, 3 --> 2,
	4 --> 2, 4 --> 3
]
```

The complementGraph of a `completeGraph` is an edgeless graph:

```
>>> let g = 5.completeGraph
>>> .complementGraph;
>>> (g.vertexList, g.isEmpty)
([1 .. 5], true)
```

For simple graphs, the complementGraph of the complementGraph is the original graph:

```
>>> let g = 6.cycleGraph;
>>> g.complementGraph
>>> .complementGraph.edgeList
[1 2; 1 6; 2 3; 3 4; 4 5; 5 6].asEdgeList
```

The complementGraph of the line graph of _K(5)_ is a Petersen graph:

```
>>> 5.completeGraph
>>> .lineGraph;
>>> .complementGraph
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

* * *

See also: complement, Graph, lineGraph, undirectedGraph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphComplement.html)
[1](https://reference.wolfram.com/language/ref/GraphComplement.html)
