# polygonCollection

- _polygonCollection([v₁ v₂ …; …])_

Answer a `GeometryCollection` of `Polygon` values with vertices specified at _v_.

Find the area of a set of polygons:

```
>>> let c = [0 0; 1 0 ; 0 1];
>>> [c, c + 1].polygonCollection.area
1
```

Draw a set of polygons:

~~~spl svg=A
let c = [0 0; 1 0 ; 0 1];
[c, c + 1]
.polygonCollection
~~~

![](sw/spl/Help/Image/polygonCollection-A.svg)

* * *

See also: GeometryCollection, lineCollection, Polygon, PolygonWithHoles

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Polygon.html)
