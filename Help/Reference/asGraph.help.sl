# asGraph

- _asGraph(anObject)_

Answer a `Graph` having the specified edges.
The `vertexList` of the graph is inferred.

At `Association` `List` makes a directed graph:

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

At two-column matrix makes an undirected graph:

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

At a `List` of edges can make either kind of graph,
or a mixed graph:

```
>>> [1 --- 2, 2 --> 3].asGraph.isMixed
true
```

* * *

See also: adjacencyMatrix, Graph

Categories: Converting
