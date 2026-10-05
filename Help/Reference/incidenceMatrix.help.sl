# incidenceMatrix

- _incidenceMatrix(g)_

Answer the vertex-edge incidence matrix of the graph _g_.

The incidence matrix of an undirected graph (a cycle graph):

```
>>> Graph[1 2; 1 4; 2 3; 3 4]
>>> .incidenceMatrix
[
	1 1 0 0;
	1 0 1 0;
	0 0 1 1;
	0 1 0 1
]
```

The incidence matrix of a directed graph (a cycle graph):

```
>>> Graph[1 -> 2, 2 -> 3, 3 -> 4, 4 -> 1]
>>> .incidenceMatrix
[
	-1 0 0 1;
	1 -1 0 0;
	0 1 -1 0;
	0 0 1 -1
]
```

The incidence matrix of an undirected graph has no negative entries
the sum of the entries in any column is 2:

```
>>> let g = Graph[1 2; 2 3; 3 1];
>>> let m = g.incidenceMatrix;
>>> (m, m.sum)
([1 0 1; 1 1 0; 0 1 1], [2 2 2])
```

The incidence matrix of a directed graph has some negative entries,
if there are no self-loops, the sum of the entries in any column is 0:

```
>>> let g = Graph[1 -> 2, 2 -> 3, 3 -> 1];
>>> let m = g.incidenceMatrix;
>>> (m, m.sum)
(
	[
		-1 0 1;
		1 -1 0;
		0 1 -1
	],
	[0 0 0]
)
```

The incidence matrix of a graph with self-loops has some entries equal to 2:

```
>>> Graph[1 2; 2 3; 3 1; 3 3]
>>> .incidenceMatrix
[
	1 0 1 0;
	1 1 0 0;
	0 1 1 2
]

>>> Graph[1 -> 2, 2 -> 3, 3 -> 1, 1 -> 1]
>>> .incidenceMatrix
[
	-1 0 1 -2;
	1 -1 0 0;
	0 1 -1 0
]
```

* * *

See also: adjacencyMatrix, incidenceGraph, incidenceList

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IncidenceMatrix.html)
[2](https://reference.wolfram.com/language/ref/IncidenceMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Incidence_matrix)

Categories: Graph, Matrix
