# project

- _project(aGeometry, aProjection)_

Apply _aProjection_ to _aGeometry_.

At `Point`:

```
>>> [1 2 3].Point.project { :each |
>>> 	each @* [1 2]
>>> }
[1 2].Point
```

At `Line`:

```
>>> [1 2 3; 4 5 6].Line.project { :each |
>>> 	each @* [1 2]
>>> }
[1 2; 4 5].Line
```

At `Polygon`:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .Polygon
>>> .project { :each |
>>> 	each @* [1 2]
>>> }
[1 2; 4 5; 7 8].Polygon
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
