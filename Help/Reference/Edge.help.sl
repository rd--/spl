# Edge

- _Edge(x)_

Answer either a `DirectedEdge` or an `UndirectedEdge`.

At `Association` answers a `DirectedEdge`:

```
>>> (1 -> 3).Edge
1 --> 3
```

At `List` answers an `UndirectedEdge`:

```
>>> [1 3].Edge
1 --- 3
```

At `DirectedEdge`:

```
>>> (1 --> 3).Edge
1 --> 3
```

At `UndirectedEdge`:

```
>>> (1 --- 3).Edge
1 --- 3
```

* * *

See also: Association, DirectedEdge, List, UndirectedEdge, edgeList

Guides: Graph Functions
