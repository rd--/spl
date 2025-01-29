# graph

- _graph(aGeometry)_

Answer the `Graph` associated with _aGeometry_.

Draw the graph of a Delaunay triangulation of a random set of seventeen points:

~~~spl svg=A
Sfc32(323193)
.randomReal(-1, 1, [17 2])
.DelaunayTriangulation
.graph
.graphPlot
~~~

![](sw/spl/Help/Image/graph-A.svg)

Draw the graph of the biaugmented pentagonal prism from the McClure polyhedra catalogue:

~~~spl svg=B
system
.mcClurePolyhedraCatalogue
.at('biaugmented pentagonal prism')
.graph
.graphPlot
~~~

![](sw/spl/Help/Image/graph-B.svg)

In both the `DelaunayTriangulation` and the `Polyhedron` case the `Graph` has stored vertex coordinates,
and may be drawn using either `asLineDrawing` or `asPerspectiveDrawing`.
Draw an isometric projection of the biaugmented pentagonal prism:

~~~spl svg=C
system
.mcClurePolyhedraCatalogue
.at('biaugmented pentagonal prism')
.graph
.asPerspectiveDrawing(
	AxonometricProjection(
		1/6.pi, 0, 1/6.pi,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/graph-C.svg)

* * *

See also: asLineDrawing, DelaunayTriangulation, graphPlot, Graph, PolygonMesh, Polyhedron
