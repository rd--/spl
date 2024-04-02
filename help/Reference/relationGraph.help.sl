# relationGraph

- _relationGraph(aBlock:/2, aBoolean, vertexList)_

```
>>> relationGraph(>, true, [1 2 3 4]).adjacencyMatrix
[
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 1 0
]
```

```
>>> { :i :j |
>>> 	(i ~= j) & { i.divisible(j) }
>>> }.relationGraph(true, 24.divisors).adjacencyMatrix
[
	0 0 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0;
	1 1 0 0 0 0 0 0;
	1 1 1 0 0 0 0 0;
	1 1 0 1 0 0 0 0;
	1 1 1 1 1 0 0 0;
	1 1 1 1 1 1 1 0
]
```

Construct a bipartite graph:

```
>>> { :i :j |
>>> 	(i < 6) & { j >= 6 }
>>> }.relationGraph(true, [1 .. 8]).adjacencyMatrix
[
	0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 1;
	0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0
]
```

Construct a divisibility graph:

```
>>> divisible:/2.relationGraph(true, [2 3 4 6 8 12]).adjacencyMatrix
[
	1 0 0 0 0 0;
	0 1 0 0 0 0;
	1 0 1 0 0 0;
	1 1 0 1 0 0;
	1 0 1 0 1 0;
	1 1 1 1 0 1
]
```

Construct a coprime graph:

```
>>> isCoprime:/2.relationGraph(false, [1 .. 7]).adjacencyMatrix
[
	1 1 1 1 1 1 1;
	1 0 1 0 1 0 1;
	1 1 0 1 1 0 1;
	1 0 1 0 1 0 1;
	1 1 1 1 0 1 1;
	1 0 0 0 1 0 1;
	1 1 1 1 1 1 0
]
```

Construct a graph from its adjacency matrix:

```
>>> let m = [0 1 0; 0 0 1; 1 0 0];
>>> let g = { :i :j |
>>> 	m[i,j] = 1
>>> }.relationGraph(true, [1 2 3]);
>>> (g.edgeList, g.adjacencyMatrix)
(
	[1 -> 2, 2 -> 3, 3 -> 1],
	[0 1 0; 0 0 1; 1 0 0]
)
```

* * *

See also: adjacencyGraph, Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RelationGraph.html)
