# Graph

- _Graph(size, edges, vertexLabels, edgeLabels)_
- _Graph(k, e)_ ⟹ _Graph(k, e, nil, nil)_

A `Graph` is a collection of `vertices` and `edges`.

The number of vertices is the `size` of the graph.

The vertices are the integers from one up to `size`.

Vertices may be labeled,
in which case `vertexLabels` is a `List` of `size` labels, one for each vertex.

Edges may also be labeled,
in which case `edgeLabels` is a `List` of labels, one for each edge.

`labeledVertices` answers a `List` of `Associations` between vertices and labels,
providing a default empty label if `vertexLabels` is `nil`.

The coherence of a Graph can be queried using `isValid`.

* * *

Categories: Collection, Type
