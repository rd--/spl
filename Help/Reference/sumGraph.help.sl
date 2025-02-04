# sumGraph

- _sumGraph(aGraph, anotherGraph)_
- _alpha + beta_ ⟹ _sumGraph(alpha, beta)_

The graph sum of two graphs is the graph with adjacency matrix given by the sum of the two adjacency matrices.
A graph sum is defined when the orders of the two graphs are the same.

The graph sum of the pentatope graph _K(5)_ and the cycle graph _C(5)_.

```
>>> let a = 5.completeGraph;
>>> let b = 5.cycleGraph;
>>> let c = a + b;
>>> [a b c].collect(adjacencyMatrix:/1)
[
	[
		0 1 1 1 1;
		1 0 1 1 1;
		1 1 0 1 1;
		1 1 1 0 1;
		1 1 1 1 0
	],
	[
		0 1 0 0 1;
		1 0 1 0 0;
		0 1 0 1 0;
		0 0 1 0 1;
		1 0 0 1 0
	],
	[
		0 2 1 1 2;
		2 0 2 1 1;
		1 2 0 2 1;
		1 1 2 0 2;
		2 1 1 2 0
	]
]
```

Draw the sum of the three cycle and path graphs:

~~~spl svg=A
3.cycleGraph.sumGraph(
	3.pathGraph
).graphPlot
~~~

![](sw/spl/Help/Image/sumGraph-A.svg)

* * *

See also: Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphSum.html)
[2](https://reference.wolfram.com/language/ref/GraphSum.html)
