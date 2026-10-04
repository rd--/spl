# asEdge

- _asEdge(x)_

Answer either a `DirectedEdge` or an `UndirectedEdge`.

At `Association` answers a `DirectedEdge`:

```
>>> (1 -> 3).asEdge
1 --> 3
```

At `List` answers an `UndirectedEdge`:

```
>>> [1 3].asEdge
1 --- 3
```

At `DirectedEdge`:

```
>>> (1 --> 3).asEdge
1 --> 3
```

At `UndirectedEdge`:

```
>>> (1 --- 3).asEdge
1 --- 3
```

* * *

See also: asEdgeList, Association, DirectedEdge, List, UndirectedEdge

Guides: Graph Functions
