# findShortestPath

- _findShortestPath(g, s, t)_

Answer the shortest path from source vertex _s_ to target vertex _t_ in the `Graph` _g_.

Find a shortest path between two individual vertices in a graph:

```
>>> [
>>> 	1 2; 1 3; 1 4; 1 5; 1 6;
>>> 	2 3; 2 6;
>>> 	3 4;
>>> 	4 5;
>>> 	5 6
>>> ].asGraph
>>> .findShortestPath(3, 5)
[3 1 5]
```

At an undirected `gridGraph`:

```
>>> [3 4].gridGraph
>>> .findShortestPath(5, 11)
[5 9 10 11]
```

At a directed `Graph`:

```
>>> [
>>> 	1 --> 2, 1 --> 3, 2 --> 3,
>>> 	1 --> 4, 4 --> 5, 5 --> 1
>>> ].asGraph
>>> .findShortestPath(4, 2)
[4 5 1 2]
```

At a mixed `Graph`:

```
>>> [
>>> 	1 --> 2, 1 --> 3, 2 --> 3,
>>> 	1 --- 4, 4 --> 5, 5 --> 1
>>> ].asGraph
>>> .findShortestPath(4, 2)
[4 1 2]
```

At a complete _k_-ary tree:

```
>>> 6.completeKaryTree(2)
>>> .asGraph
>>> .undirectedGraph
>>> .findShortestPath(23, 57)
[23 19 18 2 1 33 49 57]
```

The distance between two vertices can be found using the shortest path:

```
>>> [3 4].gridGraph
>>> .findShortestPath(1, 12)
[1 2 6 7 8 12]

>>> [1 2 6 7 8 12].size - 1
5

>>> [3 4].gridGraph
>>> .graphDistance(1, 12)
5
```

* * *

See also: dijkstrasAlgorithm, graphDistance, graphDistanceMatrix, Graph

Guides: Geometry Functions, Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ShortestPathProblem.html)
[2](https://reference.wolfram.com/language/ref/FindShortestPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Shortest_path_problem)
