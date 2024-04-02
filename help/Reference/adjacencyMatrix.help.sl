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
>>> let g = [1 2; 2 3; 3 1].asGraph;
>>> g.adjacencyMatrix
[
	0 1 1;
	1 0 1;
	1 1 0
]
```

The adjacency matrix of a directed graph:

```
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> g.adjacencyMatrix
[
	0 1 0;
	0 0 1;
	1 0 0
]
```

The adjacency matrix of an undirected graph is symmetric:

```
>>> let g = [1 2; 1 3; 2 3; 2 4; 3 4].asGraph;
>>> g.adjacencyMatrix
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
>>> let g = [1 -> 2, 2 -> 1, 3 -> 1, 3 -> 2, 4 -> 1, 4 -> 2].asGraph;
>>> g.adjacencyMatrix
[
	0 1 0 0;
	1 0 0 0;
	1 1 0 0;
	1 1 0 0
]
```

The adjacency matrix of a graph with self-loops has diagonal entries:

```
>>> let g = [1 2; 2 3; 3 1; 2 2].asGraph;
>>> g.adjacencyMatrix
[
	0 1 1;
	1 1 1;
	1 1 0
]

>>> let g = [1 -> 1, 1 -> 2, 2 -> 3, 3 -> 1].asGraph;
>>> g.adjacencyMatrix
[
	1 1 0;
	0 0 1;
	1 0 0
]
```

* * *

See also: Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AdjacencyMatrix.html)
