# isUndirectedEdge

- _isUndirectedEdge(x)_

Answer `true` if the object _x_ is allowed as an _undirected edge_ in a `Graph`.

Undirected edges are ordinarily written infix using `---`:

```
>>> (1 --- 2).isUndirectedEdge
true
```

`asEdge` at `List` answers an undirected edge:

```
>>> [1 2].asEdge.isUndirectedEdge
true
```

* * *

See also: Graph, isDirectedEdge, isEdge

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphEdge.html)
[2](https://reference.wolfram.com/language/ref/UndirectedEdge.html)

Categories: Collection
