# graphDistance

- _graphDistance(g, s, t)_

Answer the distance from source vertex _s_ to target vertex _t_ in the graph _g_.

Answer the distances between vertices of a grid graph:

```
>>> [3 4].gridGraph.graphDistance(2, 9)
3

>>> [3 4].gridGraph.graphDistance(5, 11)
3
```

Answer the distance between vertices of a directed graph:

```
>>> [
>>> 	1 -> 2, 2 -> 3,
>>> 	3 -> 1, 3 -> 4, 3 -> 5,
>>> 	4 -> 5
>>> ].asGraph.graphDistance(1, 4)
3
```

Answer the distance between vertices of a weighted graph:

```
>>> let e = [1 2; 1 3; 1 4; 2 3; 3 4];
>>> let w = [1.1 0.62 1.4 1.9 2.1];
>>> let g = e.asGraph;
>>> g.edgeWeights := w;
>>> g.graphDistance(2, 3)
1.72
```

Find the distance between opposite corners of a `gridGraph` of size _(6, 6)_:

```
>>> [6 6].gridGraph.graphDistance(1, 36)
10
```

The distance between two vertices belonging to different connected components is Infinity:

```
>>> [1 2; 2 3; 3 1; 4 5]
>>> .asGraph
>>> .graphDistance(3, 5)
Infinity
```

* * *

See also: findShortestPath, graphDistanceMatrix, Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GraphDistance.html)
