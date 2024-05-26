# Triangle

- _Triangle(p1, p2, p3)_

A `Type` representing a filled triangle with corner points _p1_, _p2_, and _p3_.

Find the area, centroid and arc length and interior angles of a `Triangle`:

```
>>> let t = Triangle([0 0], [1 0], [0 1]);
>>> (t.area, t.centroid, t.arcLength, t.interiorAngles)
(1/2, [1/3 1/3], 2 + 2.sqrt, [1/2.pi 1/4.pi 1/4.pi])
```

Area, centroid and arc length of an equilateral triangle:

```
>>> let t = Triangle([0 0], [2 0], [1 3.sqrt]);
>>> (t.area, t.centroid, t.arcLength, t.interiorAngles)
(3.sqrt, [1, 3.sqrt / 3], 6, 1/3.pi # 3)
```


Area, centroid and arc length of an isosceles triangle:

```
>>> let t = Triangle([0 0], [2 0], [1 3]);
>>> (t.area, t.centroid, t.arcLength, t.interiorAngles)
(3, [1, 1], 8.3246, [1.2490 1.2490 0.6435])
```

* * *

See also: Circle, Line, Polygon, Rectangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Triangle.html)
