# labeledVertexList

- _labeledVertexList(g, f/1)_

Answer a answers a `List` of `Associations` between vertices and labels,
providing a default empty label if `vertexLabels` is `nil`.

Labels are arbitrary values associated with each vertex,
set using `vertexLabels`.

At unlabeled graph:

```
>>> Graph[1 2; 2 3; 3 1]
>>> .labeledVertexList(
>>> 	''.constant
>>> )
[1 -> '', 2 -> '', 3 -> '']

>>> Graph[1 2; 2 3; 3 1]
>>> .labeledVertexList(
>>> 	displayString/1
>>> )
[1 -> '1', 2 -> '2', 3 -> '3']
```

* * *

See also: Graph, vertexCount, vertexLabels, vertexList

Guides: Graph Functions
