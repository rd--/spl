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
let h = d.convexHull;
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

Draw a set of seventeen random points,
_p_,
their `voronoiVertexCoordinates`,
_v_,
and the `voronoiEdgeList` connecting _v_,
_e_:

~~~spl svg=E
let r = Sfc32(789147);
let p = r.randomReal(-1, 1, [17, 2]);
let d = DelaunayTriangulation(p);
let v = d.voronoiVertexCoordinates;
let e = d.voronoiEdgeList.collect { : each |
	v.atAll(each)
};
[
	p.PointCloud,
	v.PointCloud,
	e.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/DelaunayTriangulation-E.svg)

* * *

See also: circumcircle, convexHull, convexHullIndices, delaunayMesh, edgeList, faceIndices, Graph, graph, polygonMesh, PolygonMesh, vertexCount, voronoiVertexCoordinates

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DelaunayTriangulation.html)
[2](https://mathworld.wolfram.com/VoronoiDiagram.html)
[3](https://reference.wolfram.com/language/ref/DelaunayMesh.html)
