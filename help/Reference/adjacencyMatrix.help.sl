# adjacencyMatrix

- _adjacencyMatrix(aGraph)_

The adjacency matrix of an undirected graph:

```
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1].asUndirectedGraph;
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
>>> let g = [1 -> 2, 1 -> 3, 2 -> 3, 2 -> 4, 3 -> 4].asUndirectedGraph;
>>> g.adjacencyMatrix
[
	0 1 1 0;
	1 0 1 1;
	1 1 0 1;
	0 1 1 0
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
>>> let g = [1 -> 2, 2 -> 3, 3 -> 1, 2 -> 2].asUndirectedGraph;
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
