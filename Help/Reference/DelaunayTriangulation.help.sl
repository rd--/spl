# DelaunayTriangulation

- _DelaunayTriangulation(aMatrix)_

Answer the Delaunay triangulation of _aMatrix_,
which should be a two column matrix of _(x,y)_ coordinates,

Calculate the `vertexCount`, `faceCount` and `edgeCount` of the `DelaunayTriangulation` of a hexagon:

```
>>> let d = DelaunayTriangulation(
>>> 	6.circlePoints(1)
>>> );
>>> (
>>> 	d.vertexCount,
>>> 	d.faceCount,
>>> 	d.edgeCount
>>> )
(6, 4, 9)
```

Draw the `polygonMesh` of the Delaunay triangulation of a hexagon:

~~~spl svg=A
DelaunayTriangulation(
	6.circlePoints(1)
).polygonMesh.asLineDrawing
~~~

![](sw/spl/Help/Image/DelaunayTriangulation-A.svg)

Draw the `vertexCoordinates` and `edgeList` of the Delaunay triangulation of a hexagon:

~~~spl svg=B
DelaunayTriangulation(
	6.circlePoints(1)
).asLineDrawing
~~~

![](sw/spl/Help/Image/DelaunayTriangulation-B.svg)

Plot the `graph` of the Delaunay triangulation of a hexagon:

~~~spl svg=C
DelaunayTriangulation(
	6.circlePoints(1)
).graph.graphPlot
~~~

![](sw/spl/Help/Image/DelaunayTriangulation-C.svg)

Draw a set of five random points,
_p_,
their `convexHull`,
_h_,
their `voronoiVertexCoordinates`,
_v_,
and the set of `circumcircle`s from which they are derived,
_c_:

~~~spl svg=D
let r = Sfc32(273214);
let p = r.randomReal(-1, 1, [5, 2]);
let d = DelaunayTriangulation(p);
let h = p.atAll(d.convexHullIndices);
let v = d.voronoiVertexCoordinates;
let c = d.faceIndices.collect { :each |
	p.atAll(each).circumcircle
};
[
	p.PointCloud,
	h.Polygon,
	v.PointCloud,
	c
].LineDrawing
~~~

![](sw/spl/Help/Image/DelaunayTriangulation-D.svg)

* * *

See also: circumcircle, convexHull, convexHullIndices, delaunayMesh, edgeList, faceIndices, Graph, graph, polygonMesh, PolygonMesh, vertexCount, voronoiVertexCoordinates
