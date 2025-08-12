# lineGraph

- _lineGraph(g)_

Answer the line graph of the graph _g_.

The line graph of a directed graph:

```
>>> let g = [
>>> 	1 -> 2, 1 -> 3,
>>> 	2 -> 4,
>>> 	3 -> 4, 3 -> 5,
>>> 	4 -> 6,
>>> 	5 -> 6
>>> ].asGraph;
>>> g.lineGraph.edgeList
[
	1 --> 3, 2 --> 4, 2 --> 5,
	3 --> 6, 4 --> 6, 5 --> 7
]
```

The line graph of the claw graph _K(1, 3)_ is a triangle:

```
>>> [1 2; 1 3; 1 4]
>>> .asGraph
>>> .lineGraph
>>> .edgeList
[1 2; 1 3; 2 3].asEdgeList
```

The number of edges in a graph is equal to the number of vertices in its line graph:

```
>>> let g = 5.petersenGraph(2);
>>> let l = g.lineGraph;
>>> (g.edgeCount, l.vertexCount)
(15, 15)
```

The line graph of the `pathGraph` of _n_ is isomorphic to the `pathGraph` of _n - 1_:

```
>>> 5.pathGraph.lineGraph.edgeList
[1 2; 2 3; 3 4].asEdgeList

>>> 4.pathGraph.edgeList
[1 2; 2 3; 3 4].asEdgeList
```

The line graph of a bipartite graph is perfect:

```
>>> [
>>> 	1 3; 1 4; 1 5;
>>> 	2 3; 2 4; 2 5
>>> ]
>>> .asGraph
>>> .lineGraph
>>> .adjacencyMatrix
[
	0 1 1 1 0 0;
	1 0 1 0 1 0;
	1 1 0 0 0 1;
	1 0 0 0 1 1;
	0 1 0 1 0 1;
	0 0 1 1 1 0
]
```

The line graph of a Hamiltonian graph is Hamiltonian:

```
>>> 4.completeGraph
>>> .lineGraph
>>> .adjacencyMatrix
[
	0 1 1 1 1 0;
	1 0 1 1 0 1;
	1 1 0 0 1 1;
	1 1 0 0 1 1;
	1 0 1 1 0 1;
	0 1 1 1 1 0
]
```

* * *

See also: Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LineGraph.html)
[2](https://reference.wolfram.com/language/ref/LineGraph.html)
