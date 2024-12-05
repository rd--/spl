# matchesEdge

- _matchesEdge(anEdge, anotherEdge)_

An undirected edge matches a directed edge,
in both directions,
if the vertices match:

```
>>> (1 --- 2).matchesEdge(1 --> 2)
true

>>> (1 --- 2).matchesEdge(2 --> 1)
true
```

A directed edge matches a directed edge if they are equal:

```
>>> (1 --> 2).matchesEdge(1 --> 2)
true

>>> (1 --> 2).matchesEdge(2 --> 1)
false
```

A directed edge matches an undirected edge,
using the same rules as for matching an undirected edge with a directed edge:


```
>>> (1 --> 2).matchesEdge(1 --- 2)
true

>>> (2 --> 1).matchesEdge(1 --- 2)
true
```

* * *

See also: DirectedEdge, Graph, UndirectedEdge
