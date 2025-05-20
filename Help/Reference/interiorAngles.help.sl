# interiorAngles

- _interiorAngles(aGeometry)_

Answer the interior angles of _aGeometry_.
The `sum` of interior angles in any _n_-gon is given by _(n-2)π_ radians.

At `Polygon`:

```
>>> let p = [0 0; 1 0; 0 1].Polygon;
>>> let a = p.interiorAngles;
>>> (a, a.sum)
(
	1.pi / [2 4 4],
	(3 - 2).pi
)
```

At `Triangle`:

```
>>> sssTriangle(1, 1, 1)
>>> .interiorAngles
[1/3.pi 1/3.pi 1/3.pi]

>>> aasTriangle(1/6.pi, 1/3.pi, 1)
>>> .interiorAngles
[1/6.pi 1/3.pi 1/2.pi]
```

* * *

See also: planarAngle, polygonInteriorAngles, vectorAngle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexAngle.html)
[2](https://reference.wolfram.com/language/ref/PolygonAngle.html)

Categories: Geometry
