# isDirected

- _isDirected(x)_

Answers `true` if the graph or edge _x_ is directed, else `false`.

A graph is directed if all of its edges are directed.

```
>>> [1 --> 2, 2 --> 3, 3 --> 1]
>>> .asGraph
>>> .isDirected
true
```

`isDirectedEdge` of each item in `edgeList`:

```
>>> [1 --> 2, 2 --> 3, 3 --> 1]
>>> .asGraph
>>> .edgeList
>>> .collect(isDirectedEdge:/1)
[true true true]
```

An undirected graph is not directed:

```
>>> [1 2; 2 3; 3 1].asGraph.isDirected
false
```

Edges answer `isDirected`:

```
>>> [
>>> 	1 --- 2,
>>> 	2 --> 3
>>> ].collect(isDirected:/1)
[false true]
```

* * *

See also: Graph, isDirectedEdge, isMixed, isUndirected

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DirectedGraph.html)
[2](http://reference.wolfram.com/language/ref/DirectedGraphQ.html)

Categories: Testing, Collection
