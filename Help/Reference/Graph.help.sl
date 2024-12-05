# Graph

- _Graph(vertexList, edgeList)_

A `Graph` is a collection of _vertices_ and _edges_.

The number of vertices is the `vertexCount`, or _order_, of the graph.

The _vertices_ are ordinarily the integers from one up to _order_.

The _edges_ are pairs of vertices, either ordered or unordered.

Vertices may be labeled,
in which case `vertexLabels` is a `List` of `vertexCount` labels, one for each vertex.

Edges may also be labeled,
in which case `edgeLabels` is a `List` of labels, one for each edge.

`labeledVertices` answers a `List` of `Associations` between vertices and labels,
providing a default empty label if `vertexLabels` is `nil`.

The coherence of a Graph can be queried using `isValid`.

* * *

See also: ---, -->, edgeCount, edgeList, vertexCount, vertexList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Graph.html)
[2](https://mathworld.wolfram.com/SimpleGraph.html)
[3](https://mathworld.wolfram.com/UndirectedGraph.html)
[4](https://mathworld.wolfram.com/DirectedGraph.html)
[5](https://mathworld.wolfram.com/MixedGraph.html)
[6](https://mathworld.wolfram.com/Multigraph.html)
[7](https://mathworld.wolfram.com/LabeledGraph.html)
_W_
[1](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics))

Categories: Collection, Type
