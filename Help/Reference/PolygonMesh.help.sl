# PolygonMesh

- _PolygonMesh(vertexCoordinates, faceIndices)_

A `Trait` and a related `Type` holding a polygon mesh.

`Polyhedron` implements the `PolygonMesh` trait.

The `project` method at `Polyhedron`,
which projects from a three-dimensional space into a two-dimensional space,
answers a `PolygonMesh`:

```
>>> [0 0 0].unitCube.project(
>>> 	AxonometricProjection(
>>> 		pi / 6, 0, pi / 6,
>>> 		1, 1, 1
>>> 	)
>>> ).isPolygonMesh
true
```

* * *

See also: Polygon, Polyhedron, project

Guides: Geometry Functions
