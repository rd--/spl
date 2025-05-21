# delaunayMesh

- _delaunayMesh([p₁ p₂ …])_

Answer the Delaunay triangulation of a two column matrix,
specifying _(x,y)_ coordinates,
as a `PolygonMesh` value.

The Delaunay triangulation of the unit square,
all triangles are directed counterclockwise:

```
>>> [0 0; 1 0; 0 1; 1 1]
>>> .delaunayMesh
>>> .faceIndices
[1 3 2; 3 4 2]
```

Draw the mesh of the unit square:

~~~spl svg=A
[0 0; 1 0; 0 1; 1 1]
.delaunayMesh
.asLineDrawing
~~~

![](sw/spl/Help/Image/delaunayMesh-A.svg)

The Delaunay triangulation of a hexagon:

~~~spl svg=B
6.circlePoints(1)
.delaunayMesh
.asLineDrawing
~~~

![](sw/spl/Help/Image/delaunayMesh-B.svg)

The Delaunay triangulation of a random set of seventeen points:

~~~spl svg=C
Sfc32(323193)
.randomReal([-1 1], [17 2])
.delaunayMesh
.asLineDrawing
~~~

![](sw/spl/Help/Image/delaunayMesh-C.svg)

* * *

See also: DelaunayTriangulation, PolygonMesh

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DelaunayMesh.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/delaunaytriangulation.html)
