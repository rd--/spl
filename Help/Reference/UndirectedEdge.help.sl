# UndirectedEdge

- _UndirectedEdge(α, β)_

Answer an undirected edge between vertices α and β.
The operator form is `---`.
This type can be used,
more generally,
to represent a two-way rule expressing exchange or correspondence of α and β.

Make an undirected edge:

```
>>> UndirectedEdge(1, 2)
1 --- 2
```

`asEdge` at `List` answers a `UndirectedEdge`:

```
>>> [1 2].asEdge
1 --- 2
```

A graph with undirected edges:

~~~
[1 --- 2, 2 --- 3, 3 --- 1]
.asGraph
.dotDrawing
~~~

![](sw/spl/Help/Image/UndirectedEdge-A.svg)

* * *

See also: -->, DirectedEdge, Graph, UndirectedEdge

Unicode: U+02E3A ⸺ Two-Em Dash

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UndirectedEdge.html)
