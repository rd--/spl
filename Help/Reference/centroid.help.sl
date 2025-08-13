# centroid

- _centroid(g)_

Answer the centroid of the geometry _g_.

Find the centroid of a `Circle`:

```
>>> Circle([0 0], 1).centroid
[0 0]
```

Find the centroid of a `Line`:

```
>>> LineSegment([0 0], [2 2]).centroid
[1 1]
```

Find the centroid of a `Triangle`,
the Kimberling center two:

```
>>> let t = Triangle([0 0], [1 0], [0 1]);
>>> (t.centroid, t.kimberlingCenter(2))
([1/3 1/3], [1/3 1/3])
```

Find the centroid of a `Rectangle`:

```
>>> Rectangle([0 0], [2 2]).centroid
[1 1]
```

Find the centroid of a `Polygon`:

```
>>> [0 0; 1 0; 3/2 1/2; 1 1; 0 1; -1/2 1/2]
>>> .Polygon
>>> .centroid
[1/2 1/2]
```

Draw a regular eight polygon and its centroid:

~~~spl svg=A
let p = 8.regularPolygon([0 0], 1, 0);
[p, p.centroid.Point].LineDrawing
~~~

![](sw/spl/Help/Image/centroid-A.svg)

* * *

See also: Circle, Line, Polygon, polygonCentroid, Rectangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricCentroid.html)
[2](https://mathworld.wolfram.com/TriangleCentroid.html)
[3](https://reference.wolfram.com/language/ref/RegionCentroid.html),
_W_
[1](https://en.wikipedia.org/wiki/Centroid)

Categories: Geometry
