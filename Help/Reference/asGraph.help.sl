# asGraph

- _asGraph(e)_

Answer a `Graph` having the edges specified at _e_.
The `vertexList` of the graph is inferred.

At an `Association` `List` makes a directed graph:

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

At a two-column matrix makes an undirected graph:

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

Guides: Graph Functions

Categories: Converting
