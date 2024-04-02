# asGraph

- _asGraph(anAssociationList | aMatrix)_

Answer a `Graph` having the specified edges.
The `vertexList` of the graph is inferred.

At an association list makes a directed graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.adjacencyMatrix
[0 1 0; 0 0 1; 1 0 0]
```

At a two-column matrix makes an undirected graph:

```
>>> [1 2; 2 3; 3 1].asGraph.adjacencyMatrix
[0 1 1; 1 0 1; 1 1 0]
```

* * *

See also: adjacencyMatrix, asUndirectedGraph, Graph
