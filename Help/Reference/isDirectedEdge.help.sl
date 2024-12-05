# isDirectedEdge

- _isDirectedEdge(anObject)_

Answer `true` if _anObject_ is allowed as a _directed edge_ in a `Graph`.

Directed edges are ordinarily written infix using `-->`:

```
>>> (1 --> 2).isDirectedEdge
true
```

`asEdge` at `Association` answers a directed edge:

```
>>> (1 -> 2).asEdge.isDirectedEdge
true
```

* * *

See also: Graph, isEdge, isUndirectedEdge

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arc.html)
[2](https://reference.wolfram.com/language/ref/DirectedEdge.html)

Categories: Collection, Testing
