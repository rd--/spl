# rotated

- _rotated(aSequence, anInteger)_
- _rotated(aGeometry, theta)_

At _aSequence_,
answer the rotation to the right by _anInteger_ places.

```
>>> [1 3 2 4 5].rotated(1)
[5 1 3 2 4]

>>> [1 3 2 4 5].rotated(-1)
[3 2 4 5 1]
```

At _aGeometry_,
answer the value rotated _theta_ radians counter-clockwise about its `centroid`.

A square rotated by one eighth turn:

~~~spl svg=A
[0 0].unitSquare
.asPolygon
.rotated(1/4.pi)
~~~

![](sw/spl/Help/Image/rotated-A.svg)

* * *

See also: centroid, Polygon, rotatedLeft, rotatedRight
