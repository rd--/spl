# innerPolygons

- _innerPolygons(p)_

Answer a `List` of the inner polygons of the polygon _p_.

At `PolygonWithHoles`:

```
>>> let o = [0 0; 5 0; 2.5 4];
>>> let i = [2 1; 2 2; 3 2; 3 1];
>>> PolygonWithHoles(o, [i])
>>> .innerPolygons
[Polygon(i)]
```

At `Polygon`:

```
>>> Polygon([0 0; 5 0; 2.5 4])
>>> .innerPolygons
[]
```

* * *

See also: outerPolygon, Polygon, PolygonWithHoles

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InnerPolygon.html)
