# interiorAngles

- _interiorAngles(anObject)_

Answer the interior angles of _anObject_.
The sum of interior angles in any n-gon is given by (n-2)pi radians.

At `Polygon`:

```
>>> let p = [0 0; 1 0; 0 1].Polygon;
>>> let a = p.interiorAngles;
>>> (a, a.sum)
(pi / [2 4 4], (3-2).pi)
```

* * *

See also: planarAngle, vectorAngle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VertexAngle.html)
[2](https://reference.wolfram.com/language/ref/PolygonAngle.html)

Categories: Geometry
