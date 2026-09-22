# isConvex

- _isConvex(p)_

Answer `true` is the polygon _p_ is convex, else `false`.

Regular polygons are convex:

```
>>> 6.regularPolygon([0 0], 1, 0)
>>> .isConvex
true
```

A concave polygon:

```
>>> let p = Polygon[0 0; 0 1; 0.5 0.5; 1 1; 1 0];
>>> (p.isConvex, p.isConcave)
(false, true)
```

* * *

See also: interiorAngles

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConvexPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Convex_polygon)
