# Polygon

The `area` and `centroid` of two triangle:

```
>>> let p = [1 0; 0 3.sqrt; -1 0].Polygon;
>>> (p.area, p.centroid)
(3.sqrt, [0, 3.sqrt / 3])

>>> let p = [1 0; 1 1; 0 0].Polygon;
>>> (p.area, p.centroid)
(1/2, [2/3 1/3])
```

The `area`, `centroid` and `interiorAngles` of a pentagon:

```
>>> let p = [1 6; 3 1; 7 2; 4 4; 8 5].Polygon;
>>> (p.area, p.centroid, p.interiorAngles)
(
	33/2,
	[35/9 11/3],
	[1.0484, 1.7063, 0.833, 0.833, 0.3869]
)
```

* * *

See also: area, centroid

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polygon.html)
[2](https://reference.wolfram.com/language/ref/Polygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon)

Categories: Geometry
