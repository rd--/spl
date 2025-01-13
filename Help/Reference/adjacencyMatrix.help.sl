# adjacencyMatrix

- _adjacencyMatrix(aGraph)_

Answer the vertex–vertex adjacency matrix of _aGraph_.
An entry _(i,j)_ of the adjacency matrix is the number of directed edges from vertex _i_ to vertex _j_.
The diagonal entries _(i,i)_ count the number of loops for vertex _i_.
An undirected edge is interpreted as two directed edges with opposite directions.
The vertices are in the order given by _vertexList_.
The adjacency matrix for a graph will have dimensions _n × n_, where _n_ is the number of vertices.

The adjacency matrix of an undirected graph:

```
>>> [1 2; 2 3; 3 1]
>>> .asGraph
>>> .adjacencyMatrix
[
	0 1 1;
	1 0 1;
	1 1 0
]
```

The adjacency matrix of the `completeBipartiteGraph` _K(1,3)_,
which is isomorphic to the `starGraph` _S(4)_:

```
>>> let g = 1.completeBipartiteGraph(3);
>>> let m = g.adjacencyMatrix;
>>> (m = 4.starGraph.adjacencyMatrix, m)
(
	true,
	[
		0 1 1 1;
		1 0 0 0;
		1 0 0 0;
		1 0 0 0
	]
)
```

The adjacency matrix of a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .adjacencyMatrix
[
	0 1 0;
	0 0 1;
	1 0 0
]
```

The adjacency matrix of an undirected graph is symmetric:

```
>>> [1 2; 1 3; 2 3; 2 4; 3 4]
>>> .asGraph
>>> .adjacencyMatrix
[
	0 1 1 0;
	1 0 1 1;
	1 1 0 1;
	0 1 1 0
]

>>> 4.completeGraph.adjacencyMatrix
[
	0 1 1 1;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0
]
```

The adjacency matrix of a directed graph can be unsymmetric:

```
>>> [
>>> 	1 -> 2, 2 -> 1,
>>> 	3 -> 1, 3 -> 2,
>>> 	4 -> 1, 4 -> 2
>>> ]
>>> .asGraph
>>> .adjacencyMatrix
[
	0 1 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 0 0
]
```

The adjacency matrix of a graph with self-loops has diagonal entries:

```
>>> [1 2; 2 3; 3 1; 2 2]
>>> .asGraph
>>> .adjacencyMatrix
[
	0 1 1;
	1 1 1;
	1 1 0
]

>>> [1 -> 1, 1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .adjacencyMatrix
[
	1 1 0;
	0 0 1;
	1 0 0
]
```

The adjacency matrix of a multi-graph has non-boole entries:

```
>>> [1 2; 1 2; 2 3]
>>> .asGraph
>>> .adjacencyMatrix
[0 2 0; 2 0 1; 0 1 0]
```

The adjacency matrix of a path graph:

```
>>> 5.pathGraph.adjacencyMatrix
[
	0 1 0 0 0;
	1 0 1 0 0;
	0 1 0 1 0;
	0 0 1 0 1;
	0 0 0 1 0
]
```

For a complete graph, all entries outside the diagonal are `one` in the adjacency matrix:

~~~spl svg=A
13.completeGraph
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/adjacencyMatrix-A.svg)

A complete _k_-partite graph has zero diagonal block entries:

~~~spl svg=B
2.completeBipartiteGraph(7)
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/adjacencyMatrix-B.svg)

For a path graph,
rows of an adjacency matrix will contain one or two elements:

~~~spl svg=C
20.pathGraph.adjacencyMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/adjacencyMatrix-C.svg)

The adjacency matrix of a grid graph:

~~~spl svg=D
[3 3 3].gridGraph
.adjacencyMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/adjacencyMatrix-D.svg)

* * *

See also: adjacencyGraph, adjacencyList, Graph, incidenceList

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AdjacencyMatrix.html)
[2](https://reference.wolfram.com/language/ref/AdjacencyMatrix.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/graphs/sage/graphs/generic_graph.html#sage.graphs.generic_graph.GenericGraph.adjacency_matrix)
_W_
[1](https://en.wikipedia.org/wiki/Adjacency_matrix)

Categories: Collection, Graph, Matrix
