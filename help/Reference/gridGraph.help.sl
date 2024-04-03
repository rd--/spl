# gridGraph

- _gridGraph(shape)_

Answer the _k_-dimensional grid graph of _shape_,
where _shape_ is a `List` of _k_ places.

The _2,4_ grid graph:

```
>>> [2 4].gridGraph.adjacencyMatrix
[
	0 1 0 0 1 0 0 0;
	1 0 1 0 0 1 0 0;
	0 1 0 1 0 0 1 0;
	0 0 1 0 0 0 0 1;
	1 0 0 0 0 1 0 0;
	0 1 0 0 1 0 1 0;
	0 0 1 0 0 1 0 1;
	0 0 0 1 0 0 1 0
]
```

The first few grid graphs:

```
>>> [2 4; 2 5; 3 4; 3 5].collect { :shape |
>>> 	let g = shape.gridGraph;
>>> 	[g.vertexCount, g.edgeCount]
>>> }
[8 10; 10 13; 12 17; 15 22]
```

`gridGraph` of _(n, m)_ has _2 * n * m - n - m_ edges:

```
>>> [2 4; 2 5; 3 4; 3 5].collect { :shape |
>>> 	let [n, m] = shape;
>>> 	[n * m, 2 * n * m - n - m]
>>> }
[8 10; 10 13; 12 17; 15 22]
```

Higher-dimensional grid graphs:

```
>>> [2 2 2].gridGraph.adjacencyMatrix
[
	0 1 1 0 1 0 0 0;
	1 0 0 1 0 1 0 0;
	1 0 0 1 0 0 1 0;
	0 1 1 0 0 0 0 1;
	1 0 0 0 0 1 1 0;
	0 1 0 0 1 0 0 1;
	0 0 1 0 1 0 0 1;
	0 0 0 1 0 1 1 0
]

>>> [2 2 2].gridGraph.edgeCount
(2 * 2 * 2) * 3 / 2

>>> [2 2 2 2].gridGraph.adjacencyMatrix
[
	0 1 1 0 1 0 0 0 1 0 0 0 0 0 0 0;
	1 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0;
	1 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0;
	0 1 1 0 0 0 0 1 0 0 0 1 0 0 0 0;
	1 0 0 0 0 1 1 0 0 0 0 0 1 0 0 0;
	0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0;
	0 0 1 0 1 0 0 1 0 0 0 0 0 0 1 0;
	0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 1;
	1 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0;
	0 1 0 0 0 0 0 0 1 0 0 1 0 1 0 0;
	0 0 1 0 0 0 0 0 1 0 0 1 0 0 1 0;
	0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 1;
	0 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0;
	0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 1;
	0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 1;
	0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0
]

>>> [2 2 2 2].gridGraph.edgeCount
(2 * 2 * 2 * 2) * 4 / 2
```

* * *

See also: Graph

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GridGraph.html)
[2](https://reference.wolfram.com/language/ref/GridGraph.html)
