# PolygonMesh

- _PolygonMesh(v, f)_

A `Trait` and a related `Type` holding a polygon mesh,
having vertex coordinates _v_, and face indices _f_.

`Polyhedron` implements the `PolygonMesh` trait.

The `project` method at `Polyhedron`,
which projects from a three-dimensional space into a two-dimensional space,
answers a `PolygonMesh`:

```
>>> let m = [0 0 0].unitCube.project(
>>> 	AxonometricProjection(
>>> 		1/6.pi, 0, 1/6.pi,
>>> 		1, 1, 1
>>> 	)
>>> );
>>> (
>>> 	m.isPolygonMesh,
>>> 	m.embeddingDimension
>>> )
(true, 2)
```

* * *

See also: Polygon, Polyhedron, project

Guides: Geometry Functions
