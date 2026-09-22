# exteriorAngles

- _exteriorAngles(g)_

Answer the interior angles of the geometry _g_.
The `sum` of interior angles in any _n_-gon is given by _(n-2)π_ radians.

At `Polygon`:

```
>>> let p = Polygon[0 0; 1 0; 0 1];
>>> let a = p.exteriorAngles;
>>> (a, a.sum)
(
	1.pi - (1.pi / [2 4 4]),
	2.pi
)
```

The `sum` of exterior angles of a regular _n_-polygon is _2π_:

```
>>> let n = 13;
>>> n.regularPolygon([0 0], 1, 0)
>>> .exteriorAngles
>>> .sum
2.pi
```

The exterior angles of a non-convex polygon:

```
>>> let c = [0 0; 1 0; 2 -1; 2 1];
>>> let p = Polygon(c);
>>> (p.exteriorAngles, p.isConvex)
(
	[2.6779 -0.7854 2.3562 2.0344],
	false
)
```

* * *

See also: interiorAngles, planarAngle, polygonExteriorAngles, vectorAngle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExteriorAngle.html)
[2](https://reference.wolfram.com/language/ref/PolygonAngle.html),
_W_
[1](https://en.wikipedia.org/wiki/Exterior_angle)

Categories: Geometry
