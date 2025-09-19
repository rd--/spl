# graphDistanceMatrix

- _graphDistanceMatrix(g)_

Answer the matrix of distances between vertices for the graph _g_.

Answer the distance matrix of a grid graph:

```
>>> [3 2].gridGraph.graphDistanceMatrix
[
	0 1 1 2 2 3;
	1 0 2 1 3 2;
	1 2 0 1 1 2;
	2 1 1 0 2 1;
	2 3 1 2 0 1;
	3 2 2 1 1 0
]
```

Answer the distance matrix of a directed graph:

```
>>> [
>>> 	1 -> 2, 2 -> 3,
>>> 	3 -> 1, 3 -> 4, 3 -> 5,
>>> 	4 -> 5
>>> ].asGraph
>>> .graphDistanceMatrix
[
	0 1 2 3 3;
	2 0 1 2 2;
	1 2 0 1 1;
	Infinity Infinity Infinity 0 1;
	Infinity Infinity Infinity Infinity 0
]
```

Answer the distance matrix of a weighted graph:

```
>>> let e = [1 2; 1 3; 1 4; 2 3; 3 4];
>>> let w = [1.6 0.62 1.4 1.9 2.1];
>>> let g = e.asGraph;
>>> g.edgeWeights := w;
>>> g.graphDistanceMatrix
[
	0.00 1.60 0.62 1.40;
	1.60 0.00 1.90 3.00;
	0.62 1.90 0.00 2.02;
	1.40 3.00 2.02 0.00
]
```

Plot the distance matrix of a `gridGraph` of size _(5, 5)_:

~~~spl svg=A
[5 5]
.gridGraph
.graphDistanceMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/graphDistanceMatrix-A.svg)

* * *

See also: distanceMatrix, graphDistance, Graph

Guides: Distance Functions, Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphDistanceMatrix.html)
[2](https://reference.wolfram.com/language/ref/GraphDistanceMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Distance_matrix)
