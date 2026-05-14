# subgraph

- _subgraph(g, [v₁ v₂ …])_

Answer the subgraph of the graph _g_ given by the vertex list _v_.
The subgraph is defined as the vertices in _v_ and all edges connecting them.

Subgraph of a cycle graph:

```
>>> 5.cycleGraph.subgraph([1 2 5])
Graph[1 2; 1 5]
```

Subgraph of a grid graph:

```
>>> [4 4].gridGraph.subgraph(
>>> 	[7 10 11 12 15]
>>> )
Graph[7 11; 10 11; 11 12; 11 15]
```

Subgraph of a complete graph:

```
>>> 5.completeGraph.subgraph([1 3 5])
Graph[1 3; 1 5; 3 5]
```

Subgraph of a directed graph:

```
>>> Graph[
>>> 	1 -> 3, 1 -> 5, 2 -> 1, 3 -> 6,
>>> 	4 -> 6, 5 -> 4, 6 -> 1
>>> ].subgraph([1 3 6])
Graph[1 -> 3, 3 -> 6, 6 -> 1]
```

* * *

See also: Graph, neighbourhoodGraph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Subgraph.html)
[2](https://reference.wolfram.com/language/ref/Subgraph.html)

Categories: Graph
