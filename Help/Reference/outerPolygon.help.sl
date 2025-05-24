# outerPolygon

- _outerPolygon(p)_

Answer the outer polygon of the polygon _p_.

At `PolygonWithHoles`:

```
>>> let o = [0 0; 5 0; 2.5 4];
>>> let i = [2 1; 2 2; 3 2; 3 1];
>>> PolygonWithHoles(o, [i])
>>> .outerPolygon
Polygon(o)
```

At `Polygon`:

```
>>> let p = Polygon([0 0; 5 0; 2.5 4]);
>>> p.outerPolygon
p
```

* * *

See also: innerPolygons, Polygon, PolygonWithHoles

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/OuterPolygon.html)
