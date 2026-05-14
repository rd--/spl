# project

- _project(g, p)_

Apply the projection _p_ to the geometry _g_.

At `Point`:

```
>>> Point[1 2 3].project { :each |
>>> 	each @* [1 2]
>>> }
Point[1 2]
```

At `Line`:

```
>>> Line[1 2 3; 4 5 6].project { :each |
>>> 	each @* [1 2]
>>> }
Line[1 2; 4 5]
```

At `Polygon`:

```
>>> Polygon[
>>> 	1 2 3; 4 5 6; 7 8 9
>>> ].project { :each |
>>> 	each @* [1 2]
>>> }
Polygon[1 2; 4 5; 7 8]
```

At `Polyhedron` answer `PolygonMesh`:

```
>>> [0 0 0].unitCube.project { :each |
>>> 	each @* [1 2]
>>> }.canonicalForm
PolygonMesh(
	[-0.5 0.5; 0.5 0.5; 0.5 -0.5; -0.5 -0.5],
	[[1 4 3 2]]
)
```

* * *

See also: AxonometricProjection, Line, Point, Polygon, PolygonMesh, Polyhedron, projection

Guides: Geometry Functions
