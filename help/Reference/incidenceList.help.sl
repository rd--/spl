# incidenceList

- _incidenceList(aGraph, aVertex)_

Answer the `List` of edges of _aGraph_ incident to _aVertex_.

Edges incident to vertices one through five of an undirected graph:

```
>>> let g = [
>>> 	1 3; 1 4; 1 6; 2 4; 2 5; 2 7; 3 5; 3 8;
>>> 	4 9; 5 10; 6 7; 6 10; 7 8; 8 9; 9 10
>>> ].asGraph;
>>> 1:5.collect { :each | g.incidenceList(each) }
[
	[1 3; 1 4; 1 6],
	[2 4; 2 5; 2 7],
	[1 3; 3 5; 3 8],
	[1 4; 2 4; 4 9],
	[2 5; 3 5; 5 10]
]
```

Edges incident to vertex one of an undirected graph:

```
>>> let g = [1 2; 1 3; 1 5; 1 6; 4 5; 4 6].asGraph;
>>> g.incidenceList(1)
[1 2; 1 3; 1 5; 1 6]
```

Edges incident to vertex one of a directed graph:

```
>>> let g = [1 -> 3, 2 -> 1, 3 -> 6, 4 -> 6, 1 -> 5, 5 -> 4, 6 -> 1].asGraph;
>>> g.incidenceList(1)
[1 -> 3, 2 -> 1, 1 -> 5, 6 -> 1]
```

Relation to `adjacencyList`:

```
>>> let g = [
>>> 	1 2; 2 3; 3 4; 4 1;
>>> 	5 6; 6 7; 7 8; 8 1;
>>> 	1 5; 2 6; 3 7; 4 8
>>> ].asGraph;
>>> (g.adjacencyList(2), g.incidenceList(2))
([1 3 6], [1 2; 2 3; 2 6])
```

* * *

See also: adjacencyList, Graph, incidenceMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IncidenceList.html)

Categories: Graph
