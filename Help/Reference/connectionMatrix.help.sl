# connectionMatrix

- _connectionMatrix(g)_

Answer the vertex–vertex connection matrix of the graph _g_.
An entry _(i,j)_ of the connection matrix is `one` if the vertices are connected by an edge, else `zero`.

For simple graphs the `connectionMatrix` and the `adjacencyMatrix` are the same,
however for multi-graphs the connection matrix has boole entries:

```
>>> Graph[1 2; 1 2; 2 3]
>>> .connectionMatrix
[0 1 0; 1 0 1; 0 1 0]

>>> Graph[1 2; 1 2; 2 3]
>>> .adjacencyMatrix
[0 2 0; 2 0 1; 0 1 0]
```

* * *

See also: Graph, adjacencyMatrix

Guides: Graph Functions, Matrix Functions
