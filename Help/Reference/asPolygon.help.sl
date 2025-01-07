# asPolygon

- _asPolygon(anObject)_

Answer a `Polygon` that is like _anObject_:

At `Rectangle`:

```
>>> Rectangle([0 0], [1 1]).asPolygon
Polygon([0 0; 1 0; 1 1; 0 1])
```

At `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1]).asPolygon
Polygon([0 0; 1 0; 0 1])
```

* * *

See also: asPolyhedron, Polygon, Polyhedron, Rectangle, Triangle

Categories: Geometry
