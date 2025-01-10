# rotated

- _rotated(aPolygon, theta)_

Answer _aPolygon_ rotated _theta_ radians counter-clockwise about its `centroid`.

A square rotated by one eighth turn:

~~~spl svg=A
[0 0].unitSquare
.asPolygon
.rotated(pi / 4)
.asLineDrawing
~~~

![](sw/spl/Help/Image/rotated-A.svg)

* * *

See also: centroid, Polygon
