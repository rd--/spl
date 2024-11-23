# relationGraph

- _relationGraph(aBlock:/2, aBoolean, vertexList)_

Answer a graph on _vertexList_,
with edges from _u_ to _v_ whenever _aBlock(u, v)_ is `true`.

Construct a graph with a lower triangle adjacency matrix:

```
>>> relationGraph(>, true, [1 2 3 4]).adjacencyMatrix
[
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 1 0
]
```

An arbitrary boolean expression:

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
