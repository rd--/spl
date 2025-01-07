# regularPolygon

- _regularPolygon(n, center, radius)_

Answer a regular `Polygon` of _n_ sides inscribed on a circle (the _circumcircle_) of _radius_ at _center_.

The regular four polygon is a square:

```
>>> 4.regularPolygon([0 0], 1)
Polygon([1 0; 0 1; -1 0; 0 -1])
```

The `interiorAngles` of a regular polygon are equal:

```
>>> 7.regularPolygon([0 0], 1)
>>> .interiorAngles
2.244 # 7
```

The `centroid` of a regular polygon is its center:

```
>>> 7.regularPolygon([0 0], 1)
>>> .centroid
[0 0]
```

Drawing of a pentagon:

~~~spl svg=A
5.regularPolygon([0 0], 1).asLineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-A.svg)

Drawing of a hexagon:

~~~spl svg=B
6.regularPolygon([0 0], 1).asLineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-B.svg)

Drawing of a diamond:

~~~spl svg=C
4.regularPolygon([0 0], 1).asLineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-C.svg)

* * *

See also: interiorAngles, Polygon, unitSquare
