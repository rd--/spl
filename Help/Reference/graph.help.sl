# graph

- _graph(g)_

Answer the `Graph` associated with the geometry _g_.

Draw the graph of a Delaunay triangulation of a random set of seventeen points:

~~~spl svg=A
Sfc32(323193)
.randomReal([-1 1], [17 2])
.DelaunayTriangulation
.graph
.graphPlot
~~~

![](Help/Image/graph-A.svg)

Draw the graph of the biaugmented pentagonal prism from the McClure polyhedra catalogue:

~~~spl svg=B
system
.mcClurePolyhedraCatalogue
.at('biaugmented pentagonal prism')
.graph
.graphPlot
~~~

![](Help/Image/graph-B.svg)

In both the `DelaunayTriangulation` and the `Polyhedron` case the `Graph` has stored vertex coordinates,
and may be drawn using either `LineDrawing` or `PerspectiveDrawing`.
Draw an isometric projection of the biaugmented pentagonal prism:

~~~spl svg=C
system
.mcClurePolyhedraCatalogue
.at('biaugmented pentagonal prism')
.graph
.PerspectiveDrawing(
	AxonometricProjection(
		1/6.pi, 0, 1/6.pi,
		1, 1, 1
	)
)
~~~

![](Help/Image/graph-C.svg)

* * *

See also: DelaunayTriangulation, Graph, LineDrawing, PolygonMesh, Polyhedron, graphPlot
