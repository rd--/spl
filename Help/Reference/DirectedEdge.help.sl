# DirectedEdge

- _DirectedEdge(α, β)_

Answer a `DirectedEdge` between vertices α and β.
The operator form is `-->`.

```
>>> DirectedEdge(1, 2)
1 --> 2
```

`asEdge` at `Association` answers a `DirectedEdge`:

```
>>> (1 -> 2).asEdge
1 --> 2
```

* * *

See also: ---, asEdge, Graph, UndirectedEdge
