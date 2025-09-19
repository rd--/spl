# dijkstrasAlgorithm

- _dijkstrasAlgorithm(g, s)_
- _dijkstrasAlgorithm(g, s, t)_

Answer a two row matrix _[d, p]_,
where _d_ indicates the distance from vertex _s_ to every other vertex,
and _p_ indicates predecessors along the shortest path.
In the ternary case the algorithm halts when it determines the shortest path to _t_,
in the binary case it continues until the distances to each vertex are calculated.

The binary form is useful for functions like `graphDistanceMatrix`.

The ternary form is useful for functions like `graphDistance` and `findShortestPath`.

```
>>> let g = [
>>> 	1 -> 2, 2 -> 3,
>>> 	3 -> 1, 3 -> 4, 3 -> 5,
>>> 	4 -> 5
>>> ].asGraph;
>>> (
>>> 	g.dijkstrasAlgorithm(1),
>>> 	g.dijkstrasAlgorithm(1, 3)
>>> )
(
	[
		0   1   2   3   3;
		nil 1   2   3   3
	],
	[
		0   1   2   Infinity Infinity;
		nil 1   2   nil nil
	]
)
```

* * *

See also: findShortestPath, graphDistance, graphDistanceMatrix

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DijkstrasAlgorithm.html)
_W_
[1](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
