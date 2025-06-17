# nearestNeighbourGraph

- _nearestNeighbourGraph([v₁, v₂, …])_

Answer a `Graph` with vertices _v₁, v₂, …_ and edges connecting each _v_ to its nearest neighbours.

A nearest neighbour graph for integers in the range one to six:

```
>>> [1 .. 5].nearestNeighbourGraph
[
	1 --> 2, 2 --> 1,
	2 --> 3, 3 --> 2,
	3 --> 4, 4 --> 3,
	4 --> 5, 5 --> 4
].asGraph
```

Edges are directed,
the nearest neighour relation is not symmetrical:

```
>>> [1 2 5].nearestNeighbourGraph
[1 --> 2, 2 --> 1, 3 --> 2].asGraph
```

A nearest neighbour graph:

~~~spl svg=A
let r = Sfc32(673281);
let c = r.randomReal([0 1], [50 2]);
let g = c.nearestNeighbourGraph;
g.vertexCoordinates := c;
g
~~~

![](sw/spl/Help/Image/nearestNeighbourGraph-A.svg)

* * *

See also: distanceMatrix, Graph, nearest

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NearestNeighbourGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Nearest_neighbor_graph)
