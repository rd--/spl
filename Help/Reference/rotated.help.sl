# rotated

- _rotated([x₁ x₂ …], n)_
- _rotated(g, theta)_

At `List`,
answer _x_ rotated to the right by _n_ places.

```
>>> [1 3 2 4 5].rotated(1)
[5 1 3 2 4]

>>> [1 3 2 4 5].rotated(-1)
[3 2 4 5 1]
```

At `Geometry`,
answer the value _g_ rotated _theta_ radians counter-clockwise about its `centroid`.

A square rotated by one eighth turn:

~~~spl svg=A
let g = [1 3].unitSquare;
[
	g,
	Point(g.centroid),
	g.rotated(1/4.pi)
].LineDrawing
~~~

![](sw/spl/Help/Image/rotated-A.svg)

* * *

See also: centroid, Polygon, rotatedLeft, rotatedRight, scaled

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rotate.html)
