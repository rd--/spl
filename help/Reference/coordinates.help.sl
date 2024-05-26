# coordinates

- _coordinates(anObject)_

Answer the coordinates of _anObject_.

The vertex `coordinates` of a `Triangle`:

```
>>> Triangle([0 0], [0 1], [1 0]).coordinates
[0 0; 0 1; 1 0]
```

The vertex `coordinates` of a `Triangle` in three dimensions:

```
>>> Triangle([0 0 0], [1 0 0], [0 1 1]).coordinates
[0 0 0; 1 0 0; 0 1 1]
```

The vertex `coordinates` of a `Rectangle`:

```
>>> Rectangle([0 0], [1 1]).coordinates
[0 0; 1 0; 1 1; 0 1]
```

The vertex `coordinates` of a `Polygon`:

```
>>> let c = [0 0; 1 0; 1 1; 0 1];
>>> let p = c.Polygon;
>>> p.coordinates
c
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolygonCoordinates.html)
