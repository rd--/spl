# isLoopFree

- _isLoopFree(g)_

Answers `true` if the graph _g_ has no self-loops, else `false`.

```
>>> 5.completeGraph.isLoopFree
true

>>> [1 1; 1 2].asGraph.isLoopFree
false
```

The adjacency matrix of a graph without self-loops has a zero diagonal:

```
>>> 5.wheelGraph
>>> .adjacencyMatrix
>>> .diagonal
[0 0 0 0 0]
```

* * *

See also: asGraph, Graph, isDirected, isUndirected

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LoopFreeGraphQ.html)

Categories: Testing, Collection
