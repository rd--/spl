# Polygon

- _Polygon(aSequence)_

A Polygon is a `Type` representing a polygon with vertices given by _aSequence_.

The `area` and `centroid` of two triangle:

```
>>> let p = [1 0; 0 3.sqrt; -1 0].Polygon;
>>> (p.area, p.centroid, p.boundingBox)
(3.sqrt, [0, 3.sqrt / 3], [-1 0; 1 3.sqrt])

>>> let p = [1 0; 1 1; 0 0].Polygon;
>>> (p.area, p.centroid)
(1/2, [2/3 1/3])
```

The `area`, `centroid` and `interiorAngles` of a pentagon:

```
>>> let p = [1 6; 3 1; 7 2; 4 4; 8 5].Polygon;
>>> (
>>> 	p.area,
>>> 	p.centroid,
>>> 	p.interiorAngles,
>>> 	p.boundingBox
>>> )
(
	33/2,
	[35/9 11/3],
	[1.0484 1.7063 0.833 0.833 0.3869],
	[1 1; 8 6]
)
```

The Svg description of a polygon:

```
>>> [1 0; 1 1; 0 0].Polygon.asSvg
'<polygon points="1,0 1,1 0,0" />'
```

* * *

See also: area, centroid, Circle, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polygon.html)
[2](https://reference.wolfram.com/language/ref/Polygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon)

Categories: Geometry
