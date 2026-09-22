# polygonInteriorAngles

- _polygonInteriorAngles([x₁ y₁; x₂ y₂ …])_

Answer the interior angles of the polygon given by _aSequence_.
The angles are answered in the same sequence and begin at the same place as the coordinates.

Interior and exterior angles of a triangle:

```
>>> let p = [0 0; 5 0; 3.2 2.4];
>>> let i = p.polygonInteriorAngles;
>>> let e = p.polygonExteriorAngles;
>>> (i, e, i.sum / (3 - 2), e.sum)
(
	[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi],
	1.pi - i,
	1.pi,
	2.pi
)
```

C.f. `Polygon` and `interiorAngles`:

```
>>> Polygon[0 0; 5 0; 3.2 2.4]
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi]
```

C.f. `Triangle`:

```
>>> Triangle[0 0; 5 0; 3.2 2.4]
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi]
```

* * *

See also: exteriorAngles, interiorAngles, Polygon, Triangle

Guides: Geometry Functions
