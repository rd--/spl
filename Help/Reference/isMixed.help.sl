# isMixed

- _isMixed(aGraph)_

Answers `true` if _aGraph_ has both directed and undirected edges, else `false`.

```
>>> let d = [1 -> 2, 2 -> 3, 3 -> 1];
>>> let u = [1 4; 4 5; 5 1];
>>> let g = (d ++ u).asGraph;
>>> (
>>> 	g.isDirected,
>>> 	g.isUndirected,
>>> 	g.isMixed,
>>> 	g.edgeList
>>> )
(
	false,
	false,
	true,
	[
		1 --> 2, 2 --> 3, 3 --> 1,
		1 --- 4, 4 --- 5, 1 --- 5
	]
)
```

Draw a mixed graph:

~~~
[1 --> 2, 2 --- 3, 3 --> 1]
.asGraph
.dotDrawing
~~~

![](sw/spl/Help/Image/isMixed-A.svg)

* * *

See also: ---, -->, Graph, isDirected, isUndirected

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MixedGraph.html)

Categories: Testing, Collection
