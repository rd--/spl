# connectionMatrix

- _connectionMatrix(aGraph)_

Answer the vertex–vertex connection matrix of _aGraph_.
An entry _(i,j)_ of the connection matrix is `one` if the vertices are connected by an edge, else `zero`.

For simple graphs the `connectionMatrix` and the `adjacencyMatrix` are the same,
however for multi-graphs the connection matrix has boole entries:

```
>>> [1 2; 1 2; 2 3]
>>> .asGraph
>>> .connectionMatrix
[0 1 0; 1 0 1; 0 1 0]

>>> [1 2; 1 2; 2 3]
>>> .asGraph
>>> .adjacencyMatrix
[0 2 0; 2 0 1; 0 1 0]
```

* * *

See also: adjacencyMatrix, Graph

Categories: Graph, Matrix
