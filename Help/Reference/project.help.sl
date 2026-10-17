# project

- _project(g, p)_

Apply the projection _p_ to the geometry _g_.

At `Point`:

```
>>> Point[1 2 3].project(
>>> 	[1 2].from
>>> )
Point[1 2]
```

At `Line`:

```
>>> Line[1 2 3; 4 5 6].project(
>>> 	[1 2].from
>>> )
Line[1 2; 4 5]
```

At `Polygon`:

```
>>> Polygon[
>>> 	1 2 3; 4 5 6; 7 8 9
>>> ].project(
>>> 	[1 2].from
>>> )
Polygon[1 2; 4 5; 7 8]
```

At `Polyhedron` answer `PolygonMesh`:

```
>>> [0 0 0].unitCube.project(
>>> 	[1 2].from
>>> ).canonicalForm
PolygonMesh(
	[-0.5 -0.5; -0.5 0.5; 0.5 -0.5; 0.5 0.5],
	[[1 3 4 2]]
)
```

* * *

See also: AxonometricProjection, Line, Point, Polygon, PolygonMesh, Polyhedron, projection

Guides: Geometry Functions
