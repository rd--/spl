# rotated

- _rotated([x₁ x₂ …], n)_
- _rotated(g, theta)_

At a sequence _x_,
answer the rotation to the right by _n_ places.

```
>>> [1 3 2 4 5].rotated(1)
[5 1 3 2 4]

>>> [1 3 2 4 5].rotated(-1)
[3 2 4 5 1]
```

At a `Geometry` value,
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

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rotate.html)
