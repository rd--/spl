# kirchhoffMatrix

- _kirchhoffMatrix(aGraph)_

Answer the Kirchhoff matrix of the graph _aGraph_,
also called the Laplacian matrix or admittance matrix.

The Kirchhoff matrix of an undirected graph:

```
>>> [1 2; 2 3; 3 1]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1 -1;
	-1  2 -1;
	-1 -1  2
]

>>> [1 2; 1 5; 2 3; 2 5; 3 4; 4 5; 4 6]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1  0  0 -1  0;
	-1  3 -1  0 -1  0;
	 0 -1  2 -1  0  0;
	 0  0 -1  3 -1 -1;
	-1 -1  0 -1  3  0;
	 0  0  0 -1  0  1
]
```

The Kirchhoff matrix of a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1  0;
	 0  2 -1;
	-1  0  2
]
```

The Kirchhoff matrix of an undirected graph is symmetric:

```
>>> [1 2; 1 3; 2 3; 2 4; 3 4]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1 -1  0;
	-1  3 -1 -1;
	-1 -1  3 -1;
	 0 -1 -1  2
]
```

* * *

See also: adjacencyMatrix, incidenceMatrix, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LaplacianMatrix.html)
[2](https://reference.wolfram.com/language/ref/KirchhoffMatrix.html)
_W_
[1](https://en.wikipedia.org/wiki/Laplacian_matrix)
