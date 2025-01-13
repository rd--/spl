# adjacencyList

- _adjacencyList(aGraph)_
- _adjacencyList(aGraph, aVertex)_

In the binary case,
answer the `List` of vertices of _aGraph_ incident to _aVertex_.

In the unary case,
answer a list of the `adjacencyList` for each vertex of _aGraph_.

A list of vertices adjacent to vertices one through five of an undirected graph:

```
>>> let g = [
>>> 	1 3; 1 4; 1 6; 2 4; 2 5; 2 7; 3 5; 3 8;
>>> 	4 9; 5 10; 6 7; 6 10; 7 8; 8 9; 9 10
>>> ].asGraph;
>>> 1:5.collect { :each |
>>> 	g.adjacencyList(each)
>>> }
[3 4 6; 4 5 7; 1 5 8; 1 2 9; 2 3 10]
```

Edges incident to vertex one of an undirected graph:

```
>>> [1 2; 1 3; 1 5; 1 6; 4 5; 4 6]
>>> .asGraph
>>> .adjacencyList(1)
[2 3 5 6]
```

Edges incident to vertex one of a directed graph:

```
>>> [
>>> 	1 -> 3,
>>> 	2 -> 1,
>>> 	3 -> 6,
>>> 	4 -> 6,
>>> 	1 -> 5,
>>> 	5 -> 4,
>>> 	6 -> 1
>>> ].asGraph
>>> .adjacencyList(1)
[3 2 5 6]
```

Relation to `incidenceList`:

```
>>> let g = [
>>> 	1 2; 2 3; 3 4; 4 1;
>>> 	5 6; 6 7; 7 8; 8 1;
>>> 	1 5; 2 6; 3 7; 4 8
>>> ].asGraph;
>>> (g.adjacencyList(2), g.incidenceList(2))
([1 3 6], [1 2; 2 3; 2 6].asEdgeList)
```

* * *

See also: adjacencyGraph, adjacencyMatrix, incidenceList

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AdjacencyList.html)

Categories: Graph
