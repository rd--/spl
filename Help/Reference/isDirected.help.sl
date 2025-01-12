# isDirected

- _isDirected(aGraph | anEdge)_

Answers `true` if _aGraph_ is a directed graph, else `false`.

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

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DirectedGraph.html)
[2](http://reference.wolfram.com/language/ref/DirectedGraphQ.html)

Categories: Testing, Collection
