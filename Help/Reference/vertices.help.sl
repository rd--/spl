# vertices

- _vertices(anObject)_

Answer the vertices of _anObject_.

The `vertices` of a `Triangle`:

```
>>> Triangle([0 0], [0 1], [1 0]).vertices
[0 0; 0 1; 1 0]
```

The `vertices` of a `Triangle` in three dimensions:

```
>>> Triangle([0 0 0], [1 0 0], [0 1 1]).vertices
[0 0 0; 1 0 0; 0 1 1]
```

The `vertices` of a `Rectangle`:

```
>>> Rectangle([0 0], [1 1]).vertices
[0 0; 1 0; 1 1; 0 1]
```

The `vertices` of a `Polygon`:

```
>>> let c = [0 0; 1 0; 1 1; 0 1];
>>> let p = c.Polygon;
>>> p.vertices
c
```

* * *

See also: Polygon, Rectangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolygonCoordinates.html)

Categories: Geometry
