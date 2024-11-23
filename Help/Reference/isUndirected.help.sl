# isUndirected

- _isUndirected(aGraph)_

Answers `true` if _aGraph_ is a directed graph, else `false`.

A graph is undirected if all of its edges are undirected.

```
>>> let g = [1 2; 2 3; 3 1].asGraph;
>>> let e = g.edgeList;
>>> (g.isUndirected, e.collect(isUndirectedEdge:/1))
(true, [true true true])
```

A directed graph is not undirected:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1].asGraph.isUndirected
false
```

Mixed graphs are neither directed not undirected:

```
>>> let d = [1 -> 2, 2 -> 3, 3 -> 1];
>>> let u = [1 4; 4 5; 5 1];
>>> let g = (d ++ u).asGraph;
>>> (g.isDirected, g.isUndirected)
(false, false)
```

* * *

See also: Graph, isDirected, isMixed

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UndirectedGraph.html)
[2](http://reference.wolfram.com/language/ref/UndirectedGraphQ.html)

Categories: Testing, Collection
