# DirectedEdge

- _DirectedEdge(α, β)_

Answer a `DirectedEdge` between vertices α and β.
The operator form is `-->`.
This type can be used,
more generally,
to represent a rule that transforms α to β.

```
>>> DirectedEdge(1, 2)
1 --> 2
```

Vertex list:

```
>>> (1 --> 2).vertexList
[1 2]
```

`asEdge` at `Association` answers a `DirectedEdge`:

```
>>> (1 -> 2).asEdge
1 --> 2
```

A graph with directed edges:

~~~spl svg=A
[1 --> 2, 2 --> 3, 3 --> 1]
.asGraph
.graphPlot
~~~

![](sw/spl/Help/Image/DirectedEdge-A.svg)

* * *

See also: ->, ---, asEdge, Graph, UndirectedEdge

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirectedEdge.html)

Unicode: U+027F6 ⟶ Long Rightwards Arrow
