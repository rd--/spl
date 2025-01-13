# cubeGraph

- _cubeGraph(anInteger)_

Answer the _anInteger_ dimensional cube graph.

The number of vertices in the _n_-cube is _2 ^ n_,
the number of edges is _2 ^ (n - 1) * n_.

The one-cube, also called line and dion:

```
>>> 1.cubeGraph.adjacencyMatrix
[
	0 1;
	1 0
]
```

The two-cube, also called square and tetragon:

```
>>> 2.cubeGraph.adjacencyMatrix
[
	0 1 1 0;
	1 0 0 1;
	1 0 0 1;
	0 1 1 0
]
```

The three-cube, also called cube and hexahedron:

```
>>> 3.cubeGraph.adjacencyMatrix
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
```

Draw the four-cube, also called tesseract and octachoron:

~~~
4.cubeGraph.graphPlot
~~~

![](sw/spl/Help/Image/cubeGraph-A.svg)

Plot the adjacency matrix:

~~~
5.cubeGraph.adjacencyMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/cubeGraph-B.svg)

* * *

See also: adjacencyMatrix, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HypercubeGraph.html)
[2](https://mathworld.wolfram.com/CubicalGraph.html)
[3](https://mathworld.wolfram.com/TesseractGraph.html)
[4](https://reference.wolfram.com/language/ref/HypercubeGraph.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/graphs/sage/graphs/graph_generators.html#sage.graphs.graph_generators.GraphGenerators.CubeGraph),
_W_
[1](https://en.wikipedia.org/wiki/Hypercube)

Categories: Graph
