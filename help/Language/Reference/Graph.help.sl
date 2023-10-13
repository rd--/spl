# Graph -- collection type

- _Graph(size, edges, vertexLabels, edgeLabels)_
- _Graph(k, e)_ ⟹ _Graph(k, e, nil, nil)_

A Graph is a collection of _vertices_ and _edges_.

The number of vertices is the _size_ of the graph.

The vertices are the integers from one up to _size_.

Vertices may be labeled,
in which case _vertexLabels_ is an Array of _size_ labels, one for each vertex.

Edges may also be labeled,
in which case _edgeLabels_ is an Array of labels, one for each edge.

_labeledVertices_ answers an Array of Associations between vertices and labels,
providing a default empty label if _vertexLabels_ is nil.

The coherence of a Graph can be queried using _isValid_.
