# asGraph

- _asGraph(anAssociationList | aMatrix)_

Answer a `Graph` having the specified edges.
The size of the graph (the number of vertices) is inferred.

At association list:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.adjacencyMatrix
[0 1 0; 0 0 1; 1 0 0]
```

At matrix:


```
>>> [1 2; 2 3; 3 1].asGraph.adjacencyMatrix
[0 1 0; 0 0 1; 1 0 0]
```

* * *

See also: adjacencyMatrix, asUndirectedGraph, Graph
